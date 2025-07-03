import {Hex, Client, getContract} from 'viem';
import {AddressInfo, PoolConfig, ReserveData} from '../configs/types';
import {appendFileSync, writeFileSync} from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {generateAssetsLibrary} from './assetsLibraryGenerator';
import {fetchPoolAddresses} from './protocol-v2-generator/fetchPoolAddresses';
import {getClient} from '../clients';
import {fetchTokens, inferAdditionalTokenInfo} from './protocol-v2-generator/fetchTokens';

export interface PoolV2Addresses {
  POOL_ADDRESSES_PROVIDER: AddressInfo;
  POOL: AddressInfo;
  POOL_IMPL: AddressInfo;
  AAVE_PROTOCOL_DATA_PROVIDER: AddressInfo;
  POOL_CONFIGURATOR: AddressInfo;
  POOL_CONFIGURATOR_IMPL: AddressInfo;
  ORACLE: AddressInfo;
  LENDING_RATE_ORACLE: AddressInfo;
  POOL_ADMIN: AddressInfo;
  EMERGENCY_ADMIN: AddressInfo;
  COLLECTOR: AddressInfo;
  EMISSION_MANAGER: AddressInfo;
  DEFAULT_INCENTIVES_CONTROLLER: AddressInfo;
  LENDING_POOL_COLLATERAL_MANAGER: AddressInfo;
  reservesData: ReserveData[];
}

export async function generateProtocolV2Library(poolConfig: PoolConfig) {
  const client = getClient(poolConfig.chainId);
  if (!client) {
    throw new Error(`client for chain not found for chainId: ${poolConfig.chainId}`);
  }
  const poolAddresses = await fetchPoolAddresses(client, poolConfig);
  const reservesData = await fetchTokens(client, poolAddresses);
  const additionalTokenInfo = await inferAdditionalTokenInfo(client, reservesData);

  const name = `AaveV2${poolConfig.name}`;

  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from './AaveV2.sol';\n` +
          `import {ICollector} from './AaveV3.sol';` +
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
  return {
    pool: poolAddresses.POOL.value,
    name,
    reservesData,
    chainId: poolConfig.chainId,
    js: [`export * as ${name} from './${name}';`],
  };
}
