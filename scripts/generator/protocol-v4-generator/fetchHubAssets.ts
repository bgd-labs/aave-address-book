import {Client, Hex, getAddress} from 'viem';
import {multicall} from 'viem/actions';
import {IHubV4_ABI} from 'src/ts/abis/IHubV4';
import {IERC20Detailed_ABI} from 'src/ts/abis/IERC20Detailed';

export interface FetchedHubAsset {
  symbol: string;
  underlying: Hex;
  decimals: number;
  assetId: number;
  feeReceiver: Hex;
}

export async function fetchHubAssets(client: Client, hubAddress: Hex): Promise<FetchedHubAsset[]> {
  const hub = getAddress(hubAddress);
  const [assetCount] = await multicall(client, {
    allowFailure: false,
    contracts: [{address: hub, abi: IHubV4_ABI, functionName: 'getAssetCount'}],
  });
  const assetIds = Array.from({length: Number(assetCount)}, (_, assetId) => assetId);

  const assets = await multicall(client, {
    allowFailure: false,
    contracts: assetIds.map(
      (assetId) =>
        ({
          address: hub,
          abi: IHubV4_ABI,
          functionName: 'getAsset',
          args: [BigInt(assetId)],
        }) as const,
    ),
  });
  const rawSymbols = await multicall(client, {
    allowFailure: false,
    contracts: assets.map(
      (asset) =>
        ({
          address: asset.underlying,
          abi: IERC20Detailed_ABI,
          functionName: 'symbol',
        }) as const,
    ),
  });

  return assets.map((asset, i) => ({
    symbol: rawSymbols[i].replace(/-/g, '_'),
    underlying: asset.underlying,
    decimals: asset.decimals,
    assetId: assetIds[i],
    feeReceiver: asset.feeReceiver,
  }));
}
