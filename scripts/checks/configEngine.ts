import {getContract} from 'viem';
import {CHAIN_ID_CLIENT_MAP} from '../clients';
import {IAaveV3ConfigEngine_ABI} from '../../src/ts/abis/IAaveV3ConfigEngine';

export async function check(lib: string, addresses: Record<string, any>) {
  // Aave V2 has a different type, being deprecated we don't validate it
  if (addresses.CONFIG_ENGINE && lib.startsWith('AaveV3')) {
    const client = CHAIN_ID_CLIENT_MAP[addresses.CHAIN_ID];
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
      DEFAULT_INTEREST_RATE_STRATEGY !==
      (Object.values(addresses.ASSETS)[0] as any).INTEREST_RATE_STRATEGY
    )
      throw new Error(
        `SANITY_CONFIG_ENGINE: wrong DEFAULT_INTEREST_RATE_STRATEGY ${addresses.CONFIG_ENGINE}`,
      );
  }
}
