import {describe, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {IAaveV3ConfigEngine_ABI} from '../../src/ts/abis/IAaveV3ConfigEngine';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';

export async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  const engineContract = getContract({
    abi: IAaveV3ConfigEngine_ABI,
    address: addresses.CONFIG_ENGINE,
    client,
  });
  const [
    POOL,
    POOL_CONFIGURATOR,
    ORACLE,
    REWARDS_CONTROLLER,
    DEFAULT_INTEREST_RATE_STRATEGY,
    COLLECTOR,
  ] = await Promise.all([
    engineContract.read.POOL(),
    engineContract.read.POOL_CONFIGURATOR(),
    engineContract.read.ORACLE(),
    engineContract.read.REWARDS_CONTROLLER(),
    engineContract.read.DEFAULT_INTEREST_RATE_STRATEGY(),
    engineContract.read.COLLECTOR(),
  ]);
  if (POOL !== addresses.POOL) throw new Error('SANITY_CONFIG_ENGINE: wrong POOL');
  if (POOL_CONFIGURATOR !== addresses.POOL_CONFIGURATOR)
    throw new Error('SANITY_CONFIG_ENGINE: wrong POOL_CONFIGURATOR');
  if (ORACLE !== addresses.ORACLE) throw new Error('SANITY_CONFIG_ENGINE: wrong ORACLE');
  if (REWARDS_CONTROLLER !== addresses.DEFAULT_INCENTIVES_CONTROLLER)
    throw new Error('SANITY_CONFIG_ENGINE: wrong DEFAULT_INCENTIVES_CONTROLLER');
  if (COLLECTOR !== addresses.COLLECTOR) throw new Error('SANITY_CONFIG_ENGINE: wrong COLLECTOR');
  if (
    addresses.ASSETS.length > 0 &&
    DEFAULT_INTEREST_RATE_STRATEGY !==
    (Object.values(addresses.ASSETS)[0] as any).INTEREST_RATE_STRATEGY
  )
    throw new Error(
      `SANITY_CONFIG_ENGINE: wrong DEFAULT_INTEREST_RATE_STRATEGY ${addresses.CONFIG_ENGINE}`,
    );
}

describe('config engine', () => {
  it('should reference correct contracts on all getters', async () => {
    await Promise.all(
      Object.keys(addressBook).map((library) => {
        const addresses = addressBook[library];
        const client = getClient(addresses.CHAIN_ID);
        // we only want to validate AaveV3 config engines as V2 does not expose the necessary getters
        // we also skip testnets as they are not controlled trough governance
        if (!client.chain?.testnet && addresses.CONFIG_ENGINE && addresses.COLLECTOR && library.startsWith('AaveV3'))
          return check(addresses);
      }),
    );
  });
});
