import {Client, Hex, getAddress, getContract} from 'viem';
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

  for (const [spokeBaseKey, spokeAddress] of Object.entries(spokesByBaseKey)) {
    const spokeContract = getContract({address: getAddress(spokeAddress), abi: ISpokeV4_ABI, client});

    const oracleAddress = getAddress(await spokeContract.read.ORACLE());
    oraclesByBaseKey.set(spokeBaseKey, oracleAddress);

    const oracleContract = getContract({
      address: oracleAddress,
      abi: IAaveOracleV4_ABI,
      client,
    });

    const reserveCount = await spokeContract.read.getReserveCount();

    const reserveData = await Promise.all(
      Array.from({length: Number(reserveCount)}, (_, i) => i).map(async (reserveId) => {
        const [reserve, priceFeed] = await Promise.all([
          spokeContract.read.getReserve([BigInt(reserveId)]),
          oracleContract.read.getReserveSource([BigInt(reserveId)]),
        ]);
        const hubName = hubNameByAddress.get(reserve.hub.toLowerCase());
        const key = `${reserve.hub.toLowerCase()}-${reserve.assetId}`;
        const symbol = symbolByHubAsset.get(key);
        if (hubName && symbol) {
          return {spokeBaseKey, hubName, symbol, priceFeed};
        }
        return null;
      }),
    );

    priceFeeds.push(...(reserveData.filter(Boolean) as FetchedPriceFeed[]));
  }

  return {priceFeeds, oraclesByBaseKey};
}
