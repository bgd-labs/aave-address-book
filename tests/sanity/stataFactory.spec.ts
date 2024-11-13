import {describe, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';

export async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const factory = getContract({
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
    address: addresses['STATIC_A_TOKEN_FACTORY'],
    client,
  });
  const factoryPool = await factory.read.POOL();
  if (factoryPool !== addresses.POOL)
    throw new Error(`SANITY_STATA: POOL MISMATCH ${addresses.POOL}:${factoryPool}`);
}

describe('stata factory', () => {
  it('should reference correct contracts on all getters', async () => {
    await Promise.all(
      Object.keys(addressBook).map((library) => {
        const addresses = addressBook[library];
        if (addresses.STATIC_A_TOKEN_FACTORY) return check(addresses);
      }),
    );
  });
});
