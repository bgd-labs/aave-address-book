import {Client, Hex, getAddress} from 'viem';
import {multicall} from 'viem/actions';
import {ISpokeV4_ABI} from 'src/ts/abis/ISpokeV4';
import {IAaveOracleV4_ABI} from 'src/ts/abis/IAaveOracleV4';

export interface FetchedPriceFeed {
  spokeBaseKey: string;
  hubName: string;
  symbol: string;
  priceFeed: Hex;
}

export interface FetchPriceFeedsResult {
  priceFeeds: FetchedPriceFeed[];
  oraclesByBaseKey: Map<string, Hex>;
}

export async function fetchPriceFeeds(
  client: Client,
  spokesByBaseKey: Record<string, Hex>,
  hubNameByAddress: Map<string, string>,
  symbolByHubAsset: Map<string, string>,
): Promise<FetchPriceFeedsResult> {
  const priceFeeds: FetchedPriceFeed[] = [];
  const oraclesByBaseKey = new Map<string, Hex>();

  const entries = Object.entries(spokesByBaseKey).map(
    ([key, addr]) => [key, getAddress(addr)] as const,
  );

  const headContracts = entries.flatMap(([, addr]) => [
    {address: addr, abi: ISpokeV4_ABI, functionName: 'ORACLE'} as const,
    {address: addr, abi: ISpokeV4_ABI, functionName: 'getReserveCount'} as const,
  ]);
  const headResults = await multicall(client, {
    allowFailure: false,
    contracts: headContracts,
  });

  const spokeHeads = entries.map(([key, addr], i) => {
    const oracle = getAddress(headResults[i * 2] as Hex);
    const count = headResults[i * 2 + 1] as bigint;
    oraclesByBaseKey.set(key, oracle);
    return {spokeBaseKey: key, spokeAddr: addr, oracle, count: Number(count)};
  });

  type ReserveTask = {
    spokeBaseKey: string;
    spokeAddr: Hex;
    oracle: Hex;
    reserveId: number;
  };
  const tasks: ReserveTask[] = spokeHeads.flatMap((h) =>
    Array.from({length: h.count}, (_, reserveId) => ({
      spokeBaseKey: h.spokeBaseKey,
      spokeAddr: h.spokeAddr,
      oracle: h.oracle,
      reserveId,
    })),
  );

  const reserveResults = await multicall(client, {
    allowFailure: false,
    contracts: tasks.map(
      (t) =>
        ({
          address: t.spokeAddr,
          abi: ISpokeV4_ABI,
          functionName: 'getReserve',
          args: [BigInt(t.reserveId)],
        }) as const,
    ),
  });
  const priceFeedResults = await multicall(client, {
    allowFailure: false,
    contracts: tasks.map(
      (t) =>
        ({
          address: t.oracle,
          abi: IAaveOracleV4_ABI,
          functionName: 'getReserveSource',
          args: [BigInt(t.reserveId)],
        }) as const,
    ),
  });

  for (let i = 0; i < tasks.length; i++) {
    const t = tasks[i];
    const reserve = reserveResults[i] as {hub: Hex; assetId: number};
    const priceFeed = priceFeedResults[i] as Hex;
    const hubName = hubNameByAddress.get(reserve.hub.toLowerCase());
    const key = `${reserve.hub.toLowerCase()}-${reserve.assetId}`;
    const symbol = symbolByHubAsset.get(key);
    if (hubName && symbol) {
      priceFeeds.push({spokeBaseKey: t.spokeBaseKey, hubName, symbol, priceFeed});
    }
  }

  return {priceFeeds, oraclesByBaseKey};
}
