import {writeFileSync} from 'fs';
import {Hex, PublicClient, getContract} from 'viem';
import {AddressInfo, GovernanceConfig} from '../configs/types';
import {PAYLOADS_CONTROLLER_ABI} from '../abi/payloadsController';
import {RPC_PROVIDERS} from './clients';
import {generateJsLibrary, generateSolidityLibrary} from './utils';
import {getChainName} from './chains';

type ExecutorsV3 = {
  EXECUTOR_LVL_1: AddressInfo;
  EXECUTOR_LVL_2: AddressInfo;
};

async function fetchV3ExecutorAddresses(
  publicClient: PublicClient,
  payloadsController: Hex,
): Promise<ExecutorsV3> {
  if (!payloadsController) throw new Error('trying to fetch executors for zero address');
  // executors
  const payloadsControllerContract = getContract({
    address: payloadsController,
    abi: PAYLOADS_CONTROLLER_ABI,
    publicClient,
  });

  const executorLvl1 = await payloadsControllerContract.read.getExecutorSettingsByAccessControl([
    1,
  ]);
  const executorLvl2 = await payloadsControllerContract.read.getExecutorSettingsByAccessControl([
    2,
  ]);
  return {
    EXECUTOR_LVL_1: {address: executorLvl1.executor},
    EXECUTOR_LVL_2: {address: executorLvl2.executor},
  };
}

async function getGovernanceV3Addresses({CHAIN_ID, ...config}: GovernanceConfig) {
  if (config.PAYLOADS_CONTROLLER) {
    const executors = await fetchV3ExecutorAddresses(
      RPC_PROVIDERS[CHAIN_ID],
      config.PAYLOADS_CONTROLLER.address,
    );
    return {...config, ...executors};
  }
  return config;
}

export async function generateGovernanceLibrary(config: GovernanceConfig) {
  const addresses = await getGovernanceV3Addresses(config);
  const name = `Aave${getChainName(config.CHAIN_ID)}GovV3`;
  const provider = RPC_PROVIDERS[config.CHAIN_ID];

  writeFileSync(`./src/${name}.sol`, generateSolidityLibrary(provider, addresses, name));
  writeFileSync(`./src/ts/${name}.ts`, generateJsLibrary(provider, addresses));
}
