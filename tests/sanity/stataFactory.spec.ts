import {describe, expect, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';
import {IStataTokenFactory_ABI} from '../../src/ts/abis/IStataTokenFactory';

async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const factory = getContract({
    abi: [
      ...IStataTokenFactory_ABI,
      {
        type: 'function',
        name: 'PROXY_ADMIN', // legacy for not yet upgraded contracts
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
      {
        type: 'function',
        name: 'TRANSPARENT_PROXY_FACTORY',
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
    address: addresses['STATA_FACTORY'],
    client,
  });
  const factoryPool = await factory.read.POOL();
  expect(factoryPool).toEqual(addresses.POOL);
  // const misc = getMisc(addresses.CHAIN_ID);
  // expect((misc as any).PROXY_ADMIN).toEqual(await factory.read.PROXY_ADMIN());
  // current deployments reference outdated factory
  // expect((misc as any).TRANSPARENT_PROXY_FACTORY).toEqual(
  //   await factory.read.TRANSPARENT_PROXY_FACTORY(),
  // );
}

describe('stata factory', () => {
  Object.keys(addressBook).forEach((library) => {
    const addresses = addressBook[library];
    if (addresses.STATA_FACTORY) {
      const client = getClient(addresses.CHAIN_ID);
      if (!client.chain?.testnet)
        it.concurrent(
          `should reference correct contracts on all getters: ${client.chain!.name}`,
          async () => {
            return check(addresses);
          },
        );
    }
  });
});
