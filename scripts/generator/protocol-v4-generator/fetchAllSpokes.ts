import {Client, Hex, getAddress, getContract} from 'viem';
import {IHubV4_ABI} from 'src/ts/abis/IHubV4';
import {FetchedHubAsset} from 'scripts/generator/protocol-v4-generator/fetchHubAssets';

export async function fetchAllSpokes(
  client: Client,
  hubAddress: Hex,
  assets: FetchedHubAsset[],
): Promise<Hex[]> {
  const hubContract = getContract({address: getAddress(hubAddress), abi: IHubV4_ABI, client});
  const spokes: Hex[] = [];

  for (const asset of assets) {
    const spokeCount = await hubContract.read.getSpokeCount([BigInt(asset.assetId)]);
    const spokeAddresses = await Promise.all(
      Array.from({length: Number(spokeCount)}, (_, i) =>
        hubContract.read.getSpokeAddress([BigInt(asset.assetId), BigInt(i)]),
      ),
    );
    for (const addr of spokeAddresses) {
      spokes.push(getAddress(addr));
    }
  }

  return spokes;
}
