import {writeFileSync} from 'fs';
import {Hex, PublicClient, getContract} from 'viem';
import {Addresses, GovernanceConfig} from '../configs/types';
import {PAYLOADS_CONTROLLER_ABI} from '../abi/payloadsController';
import {RPC_PROVIDERS} from './clients';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';

type ExecutorsV3 = {
  EXECUTOR_LVL_1: Hex;
  EXECUTOR_LVL_2: Hex;
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
    EXECUTOR_LVL_1: executorLvl1.executor,
    EXECUTOR_LVL_2: executorLvl2.executor,
  };
}

async function getGovernanceV3Addresses({CHAIN_ID, ADDRESSES}: GovernanceConfig) {
  const addresses: Addresses = {...ADDRESSES};
  if (addresses.GOVERNANCE)
    addresses.GOVERNANCE = {value: addresses.GOVERNANCE, type: 'IGovernanceCore'};
  if (addresses.PAYLOADS_CONTROLLER) {
    const executors = await fetchV3ExecutorAddresses(
      RPC_PROVIDERS[CHAIN_ID],
      addresses.PAYLOADS_CONTROLLER as Hex,
    );
    addresses.PAYLOADS_CONTROLLER = {
      value: addresses.PAYLOADS_CONTROLLER,
      type: 'IPayloadsControllerCore',
    };
    return {...addresses, ...executors};
  }
  return addresses;
}

export async function generateGovernanceLibrary(config: GovernanceConfig) {
  const addresses = await getGovernanceV3Addresses(config);
  const name = `GovernanceV3${config.name}`;

  writeFileSync(
    `./src/${name}.sol`,
    prefixWithPragma(
      prefixWithGeneratedWarning(
        `import {IGovernanceCore, IPayloadsControllerCore} from './GovernanceV3.sol';\n` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({chainId: config.CHAIN_ID, addresses}),
            name,
          ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    generateJsConstants({chainId: config.CHAIN_ID, addresses}).join('\n'),
  );
  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
