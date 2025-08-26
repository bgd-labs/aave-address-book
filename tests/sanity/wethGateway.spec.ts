import {describe, it, expect} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';
import {IOwnable_ABI} from '../../src/ts/abis/IOwnable';
import {IWrappedTokenGatewayV3_ABI} from '../../src/ts/abis/IWrappedTokenGatewayV3';
import {getGovernance, getWhiteLabelGovernance, isPoolWhiteLabel} from '../utils';

async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  // on testnets owners are usually not governance
  if (!client.chain?.testnet) {
    const gateway = getContract({
      abi: [...IOwnable_ABI, ...IWrappedTokenGatewayV3_ABI] as const,
      address: addresses.WETH_GATEWAY,
      client,
    });
    const owner = await gateway.read.owner();

    const isWhiteLabel = await isPoolWhiteLabel(addresses.POOL_ADDRESSES_PROVIDER, client);

    const governance = isWhiteLabel
      ? getWhiteLabelGovernance(addresses.CHAIN_ID)
      : getGovernance(addresses.CHAIN_ID);
    // pools without governance are factually deprecated
    if (!governance) {
      console.log(
        `SANITY_GATEWAY: Skipped due to missing governance on chainId: ${addresses.CHAIN_ID}`,
      );
      return;
    }

    const pool = await gateway.read.POOL();
    expect(pool).toEqual(addresses.POOL);

    const l1Executor = (governance as any).EXECUTOR_LVL_1;
    if (l1Executor) expect(owner).toEqual(l1Executor);

    // TODO:
    // const nativeWrapped = await gateway.read.WETH();
    // expect(nativeWrapped) - we actually don't store this anywhere yet
  }
}

describe('weth gateway', () => {
  Object.keys(addressBook).forEach((library) => {
    const addresses = addressBook[library];
    if (addresses.WETH_GATEWAY) {
      const client = getClient(addresses.CHAIN_ID);
      it.concurrent(
        `should reference correct contracts on all getters: ${client.chain!.name}`,
        async () => {
          return check(addresses);
        },
      );
    }
  });
});
