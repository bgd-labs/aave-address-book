import {describe, it, expect} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';
import {getGovernance, getWhiteLabelGovernance, isPoolWhiteLabel} from '../utils';

export async function checkGetters(address, addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const riskStewardContract = getContract({
    abi: [
      {
        inputs: [],
        name: 'ADDRESSES_PROVIDER',
        outputs: [{internalType: 'contract IPoolAddressesProvider', name: '', type: 'address'}],
        stateMutability: 'view',
        type: 'function',
      },
      {
        inputs: [],
        name: 'AUGUSTUS_REGISTRY',
        outputs: [{internalType: 'contract IParaSwapAugustusRegistry', name: '', type: 'address'}],
        stateMutability: 'view',
        type: 'function',
      },
      {
        inputs: [],
        name: 'ORACLE',
        outputs: [{internalType: 'contract IPriceOracleGetter', name: '', type: 'address'}],
        stateMutability: 'view',
        type: 'function',
      },
      {
        inputs: [],
        name: 'POOL',
        outputs: [{internalType: 'contract IPool', name: '', type: 'address'}],
        stateMutability: 'view',
        type: 'function',
      },
      {
        inputs: [],
        name: 'owner',
        outputs: [{internalType: 'address', name: '', type: 'address'}],
        stateMutability: 'view',
        type: 'function',
      },
    ] as const,
    address: address,
    client,
  });
  const [POOL, ORACLE, OWNER] = await Promise.all([
    riskStewardContract.read.POOL(),
    riskStewardContract.read.ORACLE(),
    riskStewardContract.read.owner(),
  ]);
  expect(POOL).toEqual(addresses.POOL);
  expect(ORACLE).toEqual(addresses.ORACLE);

  const isWhiteLabel = await isPoolWhiteLabel(addresses.POOL_ADDRESSES_PROVIDER, client);
  const governance = isWhiteLabel ? getWhiteLabelGovernance(addresses.CHAIN_ID) : getGovernance(addresses.CHAIN_ID);
  if (!governance) {
    console.log(`SANITY_PSP: Skipped due to missing governance on ${client.chain?.name}`);
  } else {
    const l1Executor = (governance as any).EXECUTOR_LVL_1;
    expect(OWNER).toEqual(l1Executor);
  }
}

describe('paraswap adapters', () => {
  it('should reference correct contracts on all getters', async () => {
    await Promise.all(
      Object.keys(addressBook).map((library) => {
        const addresses = addressBook[library];
        // we currently only validate V3 adapters as v2 has no getters
        if (library.startsWith('AaveV3')) {
          if (addresses.REPAY_WITH_COLLATERAL_ADAPTER)
            return checkGetters(addresses.REPAY_WITH_COLLATERAL_ADAPTER, addresses);
          if (addresses.SWAP_COLLATERAL_ADAPTER)
            return checkGetters(addresses.SWAP_COLLATERAL_ADAPTER, addresses);
          if (addresses.DEBT_SWAP_ADAPTER)
            return checkGetters(addresses.DEBT_SWAP_ADAPTER, addresses);
          if (addresses.WITHDRAW_SWAP_ADAPTER)
            return checkGetters(addresses.WITHDRAW_SWAP_ADAPTER, addresses);
        }
      }),
    );
  });
});
