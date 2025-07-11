import {describe, expect, it} from 'vitest';
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
    ATOKEN_IMPL,
    VTOKEN_IMPL,
    POOL,
    POOL_CONFIGURATOR,
    ORACLE,
    REWARDS_CONTROLLER,
    DEFAULT_INTEREST_RATE_STRATEGY,
    COLLECTOR,
  ] = await Promise.all([
    engineContract.read.ATOKEN_IMPL(),
    engineContract.read.VTOKEN_IMPL(),
    engineContract.read.POOL(),
    engineContract.read.POOL_CONFIGURATOR(),
    engineContract.read.ORACLE(),
    engineContract.read.REWARDS_CONTROLLER(),
    engineContract.read.DEFAULT_INTEREST_RATE_STRATEGY(),
    engineContract.read.COLLECTOR(),
  ]);
  expect(ATOKEN_IMPL).toBe(addresses.DEFAULT_A_TOKEN_IMPL);
  expect(VTOKEN_IMPL).toBe(addresses.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL);
  expect(POOL).toBe(addresses.POOL);
  expect(POOL_CONFIGURATOR).toBe(addresses.POOL_CONFIGURATOR);
  expect(ORACLE).toBe(addresses.ORACLE);
  expect(REWARDS_CONTROLLER).toBe(addresses.DEFAULT_INCENTIVES_CONTROLLER);
  expect(COLLECTOR).toBe(addresses.COLLECTOR);
  expect(DEFAULT_INTEREST_RATE_STRATEGY).toBe(
    (Object.values(addresses.ASSETS)[0] as any).INTEREST_RATE_STRATEGY,
  );
}

describe('config engine', () => {
  Object.keys(addressBook).map((library) => {
    const addresses = addressBook[library];
    const client = getClient(addresses.CHAIN_ID);
    // we only want to validate AaveV3 config engines as V2 does not expose the necessary getters
    // we also skip testnets as they are not controlled trough governance
    if (
      !client.chain?.testnet &&
      addresses.CONFIG_ENGINE &&
      addresses.COLLECTOR &&
      library.startsWith('AaveV3')
    )
      it(`should reference correct contracts on all getters: ${client.chain!.name}`, async () => {
        return check(addresses);
      });
  });
});
