import {describe, expect, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';

export async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const gateway = getContract({
    abi: [
      {
        type: 'function',
        name: 'POOL',
        inputs: [],
        outputs: [
          {
            name: '',
            type: 'address',
            internalType: 'address',
          },
        ],
        stateMutability: 'view',
      },
    ] as const,
    address: addresses.UMRELLA,
    client,
  });
  const [POOL] = await Promise.all([gateway.read.POOL()]);
  expect(POOL).toEqual(addresses.POOL);
}

describe('weth gateway', () => {
  it('should reference correct contracts on all getters', async () => {
    await Promise.all(
      Object.keys(addressBook).map((library) => {
        const addresses = addressBook[library];
        if (addresses.UMBRELLA) return check(addresses);
      }),
    );
  });
});
