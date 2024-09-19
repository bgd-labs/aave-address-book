import {CHAIN_ID_CLIENT_MAP} from '@bgd-labs/js-utils';
import {getContract} from 'viem';
import {IStaticATokenFactory_ABI} from '../../src/ts/AaveAddressBook';

export async function check(addresses: Record<string, any>) {
  if (addresses.STATIC_A_TOKEN_FACTORY) {
    const client = CHAIN_ID_CLIENT_MAP[addresses.CHAIN_ID];
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
    console.log('SANITY_STATA: PASSED');
  }
}
