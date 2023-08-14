import * as fs from 'fs';
import {
  addressOrZero,
  generateAdditionalGovV3Addresses,
  generateAdditionalGovV3AddressesSol,
} from './helpers';
import {getContract, Hex, PublicClient} from 'viem';
import {PAYLOADS_CONTROLLER_ABI} from './abi/payloads_controller_abi';
import {GovV3Addresses} from './config';

export type ExecutorsV3 = {
  EXECUTOR_LVL_1: Hex;
  EXECUTOR_LVL_2: Hex;
};

export type GovV3WithExecutors = ExecutorsV3 & GovV3Addresses;

export async function fetchV3ExecutorAddresses(
  payloadsController: Hex,
  provider: PublicClient
): Promise<ExecutorsV3> {
  const executors = {
    EXECUTOR_LVL_1: addressOrZero(),
    EXECUTOR_LVL_2: addressOrZero(),
  };

  // executors
  const payloadsControllerContract = getContract({
    address: payloadsController,
    abi: PAYLOADS_CONTROLLER_ABI,
    publicClient: provider,
  });

  const executorLvl1 = await payloadsControllerContract.read.getExecutorSettingsByAccessControl([
    1,
  ]);
  const executorLvl2 = await payloadsControllerContract.read.getExecutorSettingsByAccessControl([
    2,
  ]);

  executors.EXECUTOR_LVL_1 = executorLvl1.executor;
  executors.EXECUTOR_LVL_2 = executorLvl2.executor;
  return executors;
}

export function writeGovV3Templates(govV3Addresses: GovV3WithExecutors, name: string): void {
  const templateGovV3Solidity = `\n\nlibrary ${name}GovV3 {
    ${generateAdditionalGovV3AddressesSol(govV3Addresses)}
  }
  `;

  fs.appendFileSync(`./src/${name}.sol`, templateGovV3Solidity);

  const templateGovV3Js = `${generateAdditionalGovV3Addresses(govV3Addresses)}`;

  fs.appendFileSync(`./src/ts/${name}.ts`, templateGovV3Js);
}
