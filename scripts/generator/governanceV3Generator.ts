import {writeFileSync} from 'fs';
import {Hex, PublicClient, getContract, Address} from 'viem';
import {Addresses, GovernanceConfig} from '../configs/types';
import {RPC_PROVIDERS} from './clients';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {IGovernanceCore_ABI} from '../../src/ts/abis/IGovernanceCore';
import {IPayloadsControllerCore_ABI} from '../../src/ts/abis/IPayloadsControllerCore';
import {IVotingStrategy_ABI} from '../../src/ts/abis/IVotingStrategy';
import {IVotingMachineWithProofs_ABI} from '../../src/ts/abis/IVotingMachineWithProofs';

type ExecutorsV3 = {
  EXECUTOR_LVL_1: Hex;
  EXECUTOR_LVL_2: Hex;
};

async function fetchV3ExecutorAddresses(
  publicClient: PublicClient,
  payloadsController: Hex,
): Promise<ExecutorsV3> {
  const payloadsControllerContract = getContract({
    address: payloadsController,
    abi: IPayloadsControllerCore_ABI,
    publicClient,
  });

  const [executorLvl1, executorLvl2] = await Promise.all([
    payloadsControllerContract.read.getExecutorSettingsByAccessControl([1]),
    payloadsControllerContract.read.getExecutorSettingsByAccessControl([2]),
  ]);
  return {
    EXECUTOR_LVL_1: executorLvl1.executor,
    EXECUTOR_LVL_2: executorLvl2.executor,
  };
}

async function getVotingStrategyAndWarehouse(votingMachine: Address, publicClient: PublicClient) {
  const votingMachineContract = getContract({
    address: votingMachine,
    abi: IVotingMachineWithProofs_ABI,
    publicClient,
  });

  const votingStrategy = await votingMachineContract.read.VOTING_STRATEGY();
  const votingStrategyContract = getContract({
    address: votingStrategy,
    abi: IVotingStrategy_ABI,
    publicClient,
  });
  const warehouse = await votingStrategyContract.read.DATA_WAREHOUSE();
  return {
    VOTING_STRATEGY: {value: votingStrategy, type: 'IVotingStrategy'},
    DATA_WAREHOUSE: {value: warehouse, type: 'IDataWarehouse'},
  };
}

function getGovernancePowerStrategy(governance: Address, publicClient: PublicClient) {
  if (!governance) throw new Error('trying to fetch power strategy from address 0');

  const governanceContract = getContract({
    address: governance,
    abi: IGovernanceCore_ABI,
    publicClient,
  });

  return governanceContract.read.getPowerStrategy();
}

async function getGovernanceV3Addresses({CHAIN_ID, ADDRESSES}: GovernanceConfig) {
  let addresses: Addresses = {...ADDRESSES};
  if (ADDRESSES.GOVERNANCE) {
    addresses.GOVERNANCE_POWER_STRATEGY = await getGovernancePowerStrategy(
      ADDRESSES.GOVERNANCE,
      RPC_PROVIDERS[CHAIN_ID],
    );
    addresses.GOVERNANCE = {value: addresses.GOVERNANCE, type: 'IGovernanceCore'};
  }

  if (ADDRESSES.PAYLOADS_CONTROLLER) {
    const executors = await fetchV3ExecutorAddresses(
      RPC_PROVIDERS[CHAIN_ID],
      ADDRESSES.PAYLOADS_CONTROLLER,
    );
    addresses.PAYLOADS_CONTROLLER = {
      value: ADDRESSES.PAYLOADS_CONTROLLER,
      type: 'IPayloadsControllerCore',
    };
    addresses = {...addresses, ...executors};
  }
  if (ADDRESSES.VOTING_MACHINE) {
    const strategyAndWareHouse = await getVotingStrategyAndWarehouse(
      ADDRESSES.VOTING_MACHINE,
      RPC_PROVIDERS[CHAIN_ID],
    );
    addresses = {...addresses, ...strategyAndWareHouse};
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
        `import {IGovernanceCore, IPayloadsControllerCore, IDataWarehouse, IVotingStrategy} from './GovernanceV3.sol';\n` +
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
