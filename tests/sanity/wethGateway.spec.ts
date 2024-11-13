import {describe, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';
import {IOwnable_ABI} from '../../src/ts/abis/IOwnable';
import {getGovernance} from '../utils';

export async function check(addresses: Record<string, any>) {
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
        `SANITY_GATEWAY: Skipped due to missing governance on chainId: ${addresses.CHAIN_ID}`,
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

describe('weth gateway', () => {
  it('should reference correct contracts on all getters', async () => {
    await Promise.all(
      Object.keys(addressBook).map((library) => {
        const addresses = addressBook[library];
        if (addresses.WETH_GATEWAY) return check(addresses);
      }),
    );
  });
});
