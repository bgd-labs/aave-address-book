import {AddressInfo, Addresses, EMode, PoolConfig, ReserveData} from '../configs/types';
import {appendFileSync, writeFileSync} from 'fs';
import {
  generateJsConstants,
  generateJsObject,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {generateAssetsLibrary} from './assetsLibraryGenerator';
import {fetchPoolAddresses} from './protocol-v3-generator/fetchPoolAddresses';
import {getClient} from '../clients';
import {fetchExternalPoolLibraries} from './protocol-v3-generator/fetchExternalPoolLibraries';
import {fetchEModes, generateEmodeLibrary} from './protocol-v3-generator/fetchEModes';
import {fetchTokens, inferAdditionalTokenInfo} from './protocol-v3-generator/fetchTokens';

export interface PoolV3Addresses {
  POOL_ADDRESSES_PROVIDER: AddressInfo;
  POOL: AddressInfo;
  POOL_IMPL: AddressInfo;
  AAVE_PROTOCOL_DATA_PROVIDER: AddressInfo;
  POOL_CONFIGURATOR: AddressInfo;
  POOL_CONFIGURATOR_IMPL: AddressInfo;
  ORACLE: AddressInfo;
  PRICE_ORACLE_SENTINEL: AddressInfo;
  ACL_ADMIN: AddressInfo;
  ACL_MANAGER: AddressInfo;
  COLLECTOR: AddressInfo;
  EMISSION_MANAGER: AddressInfo;
  DEFAULT_INCENTIVES_CONTROLLER: AddressInfo;
  DEFAULT_A_TOKEN_IMPL: AddressInfo;
  DEFAULT_VARIABLE_DEBT_TOKEN_IMPL: AddressInfo;
  reservesData: ReserveData[];
  externalLibraries: null | Record<string, AddressInfo>;
}

function generateExternalLibraries(
  chainId: number,
  libraries: Record<string, AddressInfo>,
  libraryName: string,
) {
  return {
    solidity: wrapIntoSolidityLibrary(
      generateSolidityConstants({
        chainId,
        addresses: libraries,
      }),
      libraryName,
    ),
    js: `export const EXTERNAL_LIBRARIES = ${generateJsObject(libraries)} as const;\n`,
  };
}

export async function generateProtocolV3Library(poolConfig: PoolConfig) {
  const client = getClient(poolConfig.chainId);
  if (!client) {
    throw new Error(`client for chain not found for chainId: ${poolConfig.chainId}`);
  }
  const poolAddresses = await fetchPoolAddresses(client, poolConfig);
  const reservesData = await fetchTokens(client, poolConfig, poolAddresses);
  const additionalTokenInfo = await inferAdditionalTokenInfo(client, poolConfig, reservesData);
  const name = `AaveV3${poolConfig.name}`;

  // generate main library
  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';\n` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({
              chainId: poolConfig.chainId,
              addresses: {
                ...poolAddresses,
                ...additionalTokenInfo,
                ...poolConfig.additionalAddresses,
              },
            }),
            name,
          ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId: poolConfig.chainId,
        addresses: {
          ...poolAddresses,
          ...additionalTokenInfo,
          ...poolConfig.additionalAddresses,
          CHAIN_ID: {value: poolConfig.chainId, type: 'uint256'},
        },
      }).join('\n'),
    ),
  );

  // generate assets library
  const assetsLibraryName = name + 'Assets';
  const assetsLibrary = generateAssetsLibrary(poolConfig.chainId, reservesData, assetsLibraryName);
  appendFileSync(`./src/${name}.sol`, assetsLibrary.solidity);
  appendFileSync(`./src/ts/${name}.ts`, assetsLibrary.js);

  // generate emodes library
  try {
    const eModes = await fetchEModes(client, poolAddresses.POOL.value, reservesData);
    const eModesLibraryName = name + 'EModes';
    const eModesLibrary = generateEmodeLibrary(poolConfig.chainId, eModes, eModesLibraryName);
    appendFileSync(`./src/${name}.sol`, eModesLibrary.solidity);
    appendFileSync(`./src/ts/${name}.ts`, eModesLibrary.js);
  } catch (e) {
    // can fail due to pre 3.2 deployments
    console.log(e.message);
  }

  // generate externalLibraries library
  try {
    const externalPoolLibraries = await fetchExternalPoolLibraries(
      client,
      poolAddresses.POOL.value,
    );
    if (externalPoolLibraries) {
      const externalLibraryName = name + 'ExternalLibraries';
      const externalLibrary = generateExternalLibraries(
        poolConfig.chainId,
        externalPoolLibraries,
        externalLibraryName,
      );
      appendFileSync(`./src/${name}.sol`, externalLibrary.solidity);
      appendFileSync(`./src/ts/${name}.ts`, externalLibrary.js);
    }
  } catch (e) {
    // can fail due to pre 3.1 deployments
    console.log(e.message);
  }

  return {
    pool: poolAddresses.POOL.value,
    name,
    reservesData,
    chainId: poolConfig.chainId,
    js: [`export * as ${name} from './${name}';`],
  };
}
