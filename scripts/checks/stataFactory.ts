import {getContract} from 'viem';
import {getClient} from '../clients';

export async function check(lib: string, addresses: Record<string, any>) {
  if (addresses.STATIC_A_TOKEN_FACTORY) {
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
    console.log('SANITY_STATA: PASSED');
  }
}
