import {Address, getContract} from 'viem';
import {IUmbrella_ABI} from '../abi/umbrella';
import {getClient} from '../clients';
import {IPool_ABI} from '../../src/ts/abis/IPool';

type UmbrellaConfig = {
  pool: Address;
  stakeTokens: readonly Address[];
  coverage: readonly {
    reserve: Address;
    configs: readonly {
      isReserveStataToken: boolean;
      liquidationBonus: bigint;
      oracle: Address;
      stakeToken: Address;
    }[];
  }[];
};

export async function getUmbrellaConfig(
  chainId: number,
  umbrella: Address,
): Promise<UmbrellaConfig> {
  const client = getClient(chainId);
  const umbrellaContract = getContract({
    abi: IUmbrella_ABI,
    client,
    address: umbrella,
  });

  const [stakeTokens, pool] = await Promise.all([
    umbrellaContract.read.getStkTokens(),
    umbrellaContract.read.POOL(),
  ]);
  const poolContract = getContract({address: pool, abi: IPool_ABI, client});
  const reserves = await poolContract.read.getReservesList();
  const coverage = await Promise.all(
    reserves.map((r) => umbrellaContract.read.getReserveSlashingConfigs([r])),
  );

  return {
    pool,
    stakeTokens,
    coverage: reserves.map((r, i) => ({reserve: r, configs: coverage[i]})),
  };
}
