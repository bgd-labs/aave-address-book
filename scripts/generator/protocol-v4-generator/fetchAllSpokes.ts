import {Client, Hex, getAddress} from 'viem';
import {multicall} from 'viem/actions';
import {IHubV4_ABI} from 'src/ts/abis/IHubV4';
import {FetchedHubAsset} from 'scripts/generator/protocol-v4-generator/fetchHubAssets';

export interface FetchedAllSpokes {
  allSpokes: Hex[];
  spokesByAssetId: Map<number, Hex[]>;
}

export async function fetchAllSpokes(
  client: Client,
  hubAddress: Hex,
  assets: FetchedHubAsset[],
): Promise<FetchedAllSpokes> {
  const hub = getAddress(hubAddress);

  const counts = await multicall(client, {
    allowFailure: false,
    contracts: assets.map((asset) => ({
      address: hub,
      abi: IHubV4_ABI,
      functionName: 'getSpokeCount',
      args: [BigInt(asset.assetId)],
    })),
  });

  const tasks = assets.flatMap((asset, i) =>
    Array.from({length: Number(counts[i])}, (_, idx) => ({assetId: asset.assetId, idx})),
  );

  const addresses = await multicall(client, {
    allowFailure: false,
    contracts: tasks.map((t) => ({
      address: hub,
      abi: IHubV4_ABI,
      functionName: 'getSpokeAddress',
      args: [BigInt(t.assetId), BigInt(t.idx)],
    })),
  });

  const listedSpokes = addresses.map((address) => getAddress(address));

  // Deactivating a spoke leaves it in the hub's spoke list, so the active flag is
  // what separates a live spoke from a superseded one.
  const configs = await multicall(client, {
    allowFailure: false,
    contracts: tasks.map((t, i) => ({
      address: hub,
      abi: IHubV4_ABI,
      functionName: 'getSpokeConfig',
      args: [BigInt(t.assetId), listedSpokes[i]],
    })),
  });

  const allSpokes: Hex[] = [];
  const spokesByAssetId = new Map<number, Hex[]>();
  for (const asset of assets) spokesByAssetId.set(asset.assetId, []);
  tasks.forEach((task, i) => {
    if (!configs[i].active) return;
    allSpokes.push(listedSpokes[i]);
    spokesByAssetId.get(task.assetId)!.push(listedSpokes[i]);
  });

  return {allSpokes, spokesByAssetId};
}
