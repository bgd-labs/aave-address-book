import {Client, getContract} from 'viem';
import {appendFileSync, writeFileSync} from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {generateUmbrellaStakeAssetsLibrary} from './assetsLibraryGenerator';
import {bytes32toAddress, getImplementationStorageSlot} from './utils';
import {AddressInfo, Addresses, UmbrellaConfig, UmbrellaStakeData} from '../configs/types';
import {getClient} from '../clients';
import {IUmbrella_ABI} from '../../src/ts/abis/IUmbrella';
import {IUmbrellaStakeToken_ABI} from '../../src/ts/abis/IUmbrellaStakeToken';
import {fetchV3ExecutorAddresses} from '../generator/governanceV3Generator';

export interface UmbrellaAddresses {
  UMBRELLA: AddressInfo;
  UMBRELLA_IMPL: AddressInfo;
  UMBRELLA_STAKE_IMPL: AddressInfo;
  UMBRELLA_REWARDS_CONTROLLER: AddressInfo;
  UMBRELLA_REWARDS_CONTROLLER_IMPL: AddressInfo;
  UMBRELLA_BATCH_HELPER?: AddressInfo;
  UMBRELLA_CONFIG_ENGINE?: AddressInfo;
  DATA_AGGREGATION_HELPER?: AddressInfo;
  externalLibraries: null | Record<string, AddressInfo>;
}

async function fetchUmbrellaStakeTokens(client: Client, umbrellaConfig: UmbrellaConfig) {
  const umbrellaContract = getContract({
    address: umbrellaConfig.UMBRELLA,
    abi: IUmbrella_ABI,
    client,
  });

  const stakeTokens = await umbrellaContract.read.getStkTokens();
  const stakeTokenData: UmbrellaStakeData[] = await Promise.all(
    stakeTokens.map(async (stakeToken) => {
      const stakeTokenContract = getContract({
        address: stakeToken,
        abi: IUmbrellaStakeToken_ABI,
        client,
      });
      const [symbol, decimals, underlying] = await Promise.all([
        stakeTokenContract.read.symbol(),
        stakeTokenContract.read.decimals(),
        stakeTokenContract.read.asset(),
      ]);
      const result: UmbrellaStakeData = {
        STAKE_TOKEN: stakeToken,
        UNDERLYING: underlying,
        symbol,
        decimals,
      };
      return result;
    }),
  );
  return stakeTokenData;
}

async function fetchUmbrellaAddresses(client: Client, umbrellaConfig: UmbrellaConfig) {
  const umbrellaContract = getContract({
    address: umbrellaConfig.UMBRELLA,
    abi: IUmbrella_ABI,
    client,
  });

  const UMBRELLA_STAKE_TOKEN_IMPL = await umbrellaContract.read.UMBRELLA_STAKE_TOKEN_IMPL();
  const umbrellaStakeContract = getContract({
    address: UMBRELLA_STAKE_TOKEN_IMPL,
    abi: IUmbrellaStakeToken_ABI,
    client,
  });
  const UMBRELLA_REWARDS_CONTROLLER = await umbrellaStakeContract.read.REWARDS_CONTROLLER();
  const [UMBRELLA_IMPL, UMBRELLA_REWARDS_CONTROLLER_IMPL] = await Promise.all([
    getImplementationStorageSlot(client, umbrellaConfig.UMBRELLA),
    getImplementationStorageSlot(client, UMBRELLA_REWARDS_CONTROLLER),
  ]);

  let addresses: Addresses = {
    UMBRELLA: {
      value: umbrellaConfig.UMBRELLA,
      type: 'IUmbrella',
    },
    UMBRELLA_IMPL: bytes32toAddress(UMBRELLA_IMPL),
    UMBRELLA_STAKE_TOKEN_IMPL,
    UMBRELLA_REWARDS_CONTROLLER,
    UMBRELLA_REWARDS_CONTROLLER_IMPL: bytes32toAddress(UMBRELLA_REWARDS_CONTROLLER_IMPL),
  };

  if (umbrellaConfig.additionalAddresses?.PERMISSIONED_PAYLOADS_CONTROLLER) {
    const executors = await fetchV3ExecutorAddresses(
      client,
      umbrellaConfig.additionalAddresses.PERMISSIONED_PAYLOADS_CONTROLLER,
    );
    addresses = {
      ...addresses,
      PERMISSIONED_PAYLOADS_CONTROLLER: {
        value: umbrellaConfig.additionalAddresses.PERMISSIONED_PAYLOADS_CONTROLLER,
        type: 'IPayloadsControllerCore',
      },
      PERMISSIONED_PAYLOADS_CONTROLLER_EXECUTOR: executors.EXECUTOR_LVL_1,
    };
  }
  return addresses;
}

export async function generateUmbrellaLibrary(umbrellaConfig: UmbrellaConfig) {
  const client = getClient(umbrellaConfig.chainId);
  if (!client) {
    throw new Error(`client for chain not found for chainId: ${umbrellaConfig.chainId}`);
  }
  const umbrellaAddresses = await fetchUmbrellaAddresses(client, umbrellaConfig);
  const umbrellaStakeTokens = await fetchUmbrellaStakeTokens(client, umbrellaConfig);
  const name = `Umbrella${umbrellaConfig.name}`;

  // generate main library
  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {IUmbrella} from './common/IUmbrella.sol';\n\n` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({
              chainId: umbrellaConfig.chainId,
              addresses: {
                ...umbrellaAddresses,
                ...umbrellaConfig.additionalAddresses,
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
        chainId: umbrellaConfig.chainId,
        addresses: {
          ...umbrellaAddresses,
          ...umbrellaConfig.additionalAddresses,
          CHAIN_ID: {value: umbrellaConfig.chainId, type: 'uint256'},
        },
      }).join('\n'),
    ),
  );

  // generate umbrella stake assets library
  const assetsLibraryName = name + 'Assets';
  const assetsLibrary = generateUmbrellaStakeAssetsLibrary(
    umbrellaConfig.chainId,
    umbrellaStakeTokens,
    assetsLibraryName,
  );
  appendFileSync(`./src/${name}.sol`, assetsLibrary.solidity);
  appendFileSync(`./src/ts/${name}.ts`, assetsLibrary.js);

  return {
    umbrella: umbrellaConfig.UMBRELLA,
    name,
    umbrellaStakeData: umbrellaStakeTokens,
    chainId: umbrellaConfig.chainId,
    js: [`export * as ${name} from './${name}';`],
  };
}
