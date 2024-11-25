import {describe, expect, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';

export async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const umbrella = getContract({
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
    address: addresses.UMBRELLA,
    client,
  });
  console.log(addresses.UMBRELLA, addresses.CHAIN_ID);
  const [POOL] = await Promise.all([umbrella.read.POOL()]);
  expect(POOL).toEqual(addresses.POOL);
}

describe('umbrella', () => {
  it('should reference correct contracts on all getters', async () => {
    await Promise.all(
      Object.keys(addressBook).map((library) => {
        const addresses = addressBook[library];
        if (addresses.UMBRELLA) return check(addresses);
      }),
    );
  });
});
