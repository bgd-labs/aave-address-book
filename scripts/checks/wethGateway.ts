import {getContract} from 'viem';
import {getClient} from '../clients';
import {IOwnable_ABI} from '../../src/ts/abis/IOwnable';
import {getGovernance} from './utils';

export async function check(lib: string, addresses: Record<string, any>) {
  if (addresses.WETH_GATEWAY) {
    const client = getClient(addresses.CHAIN_ID);
    // on testnets owners are usually not governance
    if (!client.chain?.testnet) {
      const gateway = getContract({
        abi: IOwnable_ABI,
        address: addresses.WETH_GATEWAY,
        client,
      });
      const owner = await gateway.read.owner();
      const governance = getGovernance(addresses.CHAIN_ID);
      if (!governance) {
        console.log(
          'SANITY_GATEWAY: Skipped due to missing governance on chainId: ${addresses.CHAIN_ID}',
        );
      } else {
        const l1Executor = (governance as any).EXECUTOR_LVL_1;
        // prettier would be to check against executor lvl_1
        if (owner !== l1Executor) {
          throw new Error(
            `SANITY_GATEWAY: OWNER MISMATCH ${addresses.POOL}.${addresses.WETH_GATEWAY}:${owner} != ${l1Executor}`,
          );
        }
      }
    }
  }
}
