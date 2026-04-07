import {describe, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {Address, Client, getContract} from 'viem';
import {getClient} from '../../scripts/clients';
import {IOwnable_ABI} from '../../src/ts/abis/IOwnable';
import {IWithGuardian_ABI} from '../../src/ts/abis/IWithGuardian';
import {IPayloadsControllerCore_ABI} from '../../src/ts/abis/IPayloadsControllerCore';
import {IVotingMachineWithProofs_ABI} from '../../src/ts/abis/IVotingMachineWithProofs';
import { ChainId } from '@bgd-labs/toolbox';

const ownableWithGuardianAbi = [...IOwnable_ABI, ...IWithGuardian_ABI] as const;

const crossChainControllerGetterAbi = [
  {
    type: 'function',
    name: 'CROSS_CHAIN_CONTROLLER',
    inputs: [],
    outputs: [{name: '', type: 'address', internalType: 'address'}],
    stateMutability: 'view',
  },
] as const;

const clEmergencyOracleGetterAbi = [
  {
    type: 'function',
    name: 'getChainlinkEmergencyOracle',
    inputs: [],
    outputs: [{name: '', type: 'address', internalType: 'address'}],
    stateMutability: 'view',
  },
] as const;

function assertEq(actual: string, expected: string, context: string) {
  if (actual !== expected) throw new Error(`SANITY_GOVERNANCE: ${context}: ${actual} != ${expected}`);
}

async function checkOwner(address: Address, expected: Address, label: string, client: Client) {
  const contract = getContract({abi: IOwnable_ABI, address, client});
  const owner = await contract.read.owner();
  assertEq(owner, expected, `${label} owner mismatch on ${client.chain?.name}`);
}

async function checkCrossChainController(
  address: Address,
  expected: Address,
  label: string,
  client: Client,
) {
  const contract = getContract({abi: crossChainControllerGetterAbi, address, client});
  const ccc = await contract.read.CROSS_CHAIN_CONTROLLER();
  assertEq(ccc, expected, `${label} CROSS_CHAIN_CONTROLLER mismatch on ${client.chain?.name}`);
}

async function checkOwnerAndGuardian(
  address: Address,
  expectedOwner: Address | undefined,
  expectedGuardian: Address | undefined,
  label: string,
  client: Client,
) {
  const contract = getContract({abi: ownableWithGuardianAbi, address, client});
  const [owner, guardian] = await Promise.all([contract.read.owner(), contract.read.guardian()]);
  if (expectedOwner) assertEq(owner, expectedOwner, `${label} owner mismatch on ${client.chain?.name}`);
  if (expectedGuardian)
    assertEq(guardian, expectedGuardian, `${label} guardian mismatch on ${client.chain?.name}`);
}

async function checkStandardGovernance(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  if (client.chain?.testnet) return;

  const checks: Promise<void>[] = [];

  // PayloadsController: owner, guardian, CCC, executor configs
  if (addresses.PAYLOADS_CONTROLLER) {
    checks.push(
      (async () => {
        await checkOwnerAndGuardian(
          addresses.PAYLOADS_CONTROLLER,
          addresses.EXECUTOR_LVL_1,
          addresses.GOVERNANCE_GUARDIAN,
          'PAYLOADS_CONTROLLER',
          client,
        );
        await checkCrossChainController(addresses.PAYLOADS_CONTROLLER, addresses.CROSS_CHAIN_CONTROLLER, 'PAYLOADS_CONTROLLER', client);

        const pc = getContract({
          abi: IPayloadsControllerCore_ABI,
          address: addresses.PAYLOADS_CONTROLLER,
          client,
        });

        const executorConfigLvl1 = await pc.read.getExecutorSettingsByAccessControl([1]);
        assertEq(
          executorConfigLvl1.executor,
          addresses.EXECUTOR_LVL_1,
          `PAYLOADS_CONTROLLER executor lvl1 mismatch on ${client.chain?.name}`,
        );

        if (addresses.EXECUTOR_LVL_2) {
          const executorConfigLvl2 = await pc.read.getExecutorSettingsByAccessControl([2]);
          assertEq(
            executorConfigLvl2.executor,
            addresses.EXECUTOR_LVL_2,
            `PAYLOADS_CONTROLLER executor lvl2 mismatch on ${client.chain?.name}`,
          );
        }
      })(),
    );
  }

  // Executors: owner should be PayloadsController
  for (const executorKey of ['EXECUTOR_LVL_1', 'EXECUTOR_LVL_2'] as const) {
    if (addresses[executorKey] && addresses.PAYLOADS_CONTROLLER) {
      checks.push(checkOwner(addresses[executorKey], addresses.PAYLOADS_CONTROLLER, executorKey, client));
    }
  }

  // CrossChainController: owner, guardian, CL emergency oracle
  if (addresses.CROSS_CHAIN_CONTROLLER && client.chain?.id !== ChainId.metis && client.chain?.id !== ChainId.scroll) {
    checks.push(
      (async () => {
        await checkOwnerAndGuardian(
          addresses.CROSS_CHAIN_CONTROLLER,
          addresses.EXECUTOR_LVL_1,
          addresses.GRANULAR_GUARDIAN,
          'CROSS_CHAIN_CONTROLLER',
          client,
        );

        const ccc = getContract({
          abi: clEmergencyOracleGetterAbi,
          address: addresses.CROSS_CHAIN_CONTROLLER,
          client,
        });
        try {
          const oracle = await ccc.read.getChainlinkEmergencyOracle();
          assertEq(oracle, addresses.CL_EMERGENCY_ORACLE, `CROSS_CHAIN_CONTROLLER CL_EMERGENCY_ORACLE mismatch on ${client.chain?.name}`);
        } catch {
          // CCC does not have getChainlinkEmergencyOracle on this chain
        }
      })(),
    );
  }

  // Governance core (Ethereum only): owner, guardian, CCC
  if (addresses.GOVERNANCE) {
    checks.push(
      (async () => {
        await checkOwnerAndGuardian(
          addresses.GOVERNANCE,
          addresses.EXECUTOR_LVL_1,
          addresses.GOVERNANCE_GUARDIAN,
          'GOVERNANCE',
          client,
        );
        await checkCrossChainController(addresses.GOVERNANCE, addresses.CROSS_CHAIN_CONTROLLER, 'GOVERNANCE', client);
      })(),
    );
  }

  // VotingMachine: owner, CCC, voting strategy, data warehouse
  if (addresses.VOTING_MACHINE) {
    checks.push(
      (async () => {
        await checkOwner(addresses.VOTING_MACHINE, addresses.EXECUTOR_LVL_1, 'VOTING_MACHINE', client);
        await checkCrossChainController(addresses.VOTING_MACHINE, addresses.CROSS_CHAIN_CONTROLLER, 'VOTING_MACHINE', client);

        const vm = getContract({
          abi: IVotingMachineWithProofs_ABI,
          address: addresses.VOTING_MACHINE,
          client,
        });
        const [votingStrategy, dataWarehouse] = await Promise.all([
          vm.read.VOTING_STRATEGY(),
          vm.read.DATA_WAREHOUSE(),
        ]);
        assertEq(votingStrategy, addresses.VOTING_STRATEGY, `VOTING_MACHINE VOTING_STRATEGY mismatch on ${client.chain?.name}`);
        assertEq(dataWarehouse, addresses.DATA_WAREHOUSE, `VOTING_MACHINE DATA_WAREHOUSE mismatch on ${client.chain?.name}`);
      })(),
    );
  }

  await Promise.all(checks);
}

async function checkWhitelabelGovernance(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  if (client.chain?.testnet) return;

  if (!addresses.PERMISSIONED_PAYLOADS_CONTROLLER || !addresses.PERMISSIONED_PAYLOADS_CONTROLLER_EXECUTOR) return;

  const pc = getContract({
    abi: [...ownableWithGuardianAbi, ...IPayloadsControllerCore_ABI] as const,
    address: addresses.PERMISSIONED_PAYLOADS_CONTROLLER,
    client,
  });

  const [owner, executorConfigLvl1] = await Promise.all([
    pc.read.owner(),
    pc.read.getExecutorSettingsByAccessControl([1]),
  ]);

  const executor = addresses.PERMISSIONED_PAYLOADS_CONTROLLER_EXECUTOR;
  assertEq(owner, executor, `PERMISSIONED_PAYLOADS_CONTROLLER owner mismatch on ${client.chain?.name}`);
  assertEq(
    executorConfigLvl1.executor,
    executor,
    `PERMISSIONED_PAYLOADS_CONTROLLER executor lvl1 mismatch on ${client.chain?.name}`,
  );

  // Executor owner should be the permissioned payloads controller
  await checkOwner(
    executor,
    addresses.PERMISSIONED_PAYLOADS_CONTROLLER,
    'PERMISSIONED_PAYLOADS_CONTROLLER_EXECUTOR',
    client,
  );
}

describe('governance', () => {
  Object.keys(addressBook).forEach((library) => {
    const addresses = addressBook[library];
    if (!library.startsWith('GovernanceV3')) return;

    const client = getClient(addresses.CHAIN_ID);
    const isWhitelabel = library.toLowerCase().includes('whitelabel');

    it.concurrent(
      isWhitelabel
        ? `should have correct whitelabel governance config: ${client.chain!.name} (${library})`
        : `should have correct governance config: ${client.chain!.name}`,
      async () => {
        return isWhitelabel ? checkWhitelabelGovernance(addresses) : checkStandardGovernance(addresses);
      },
    );
  });
});
