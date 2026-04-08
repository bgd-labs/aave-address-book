import {Client, Hex, getAddress, getContract} from 'viem';
import {IHubV4_ABI} from '../../../src/ts/abis/IHubV4';
import {ITokenizationSpokeV4_ABI} from '../../../src/ts/abis/ITokenizationSpokeV4';
import {FetchedHubAsset} from './fetchHubAssets';

function toTitleCase(str: string): string {
  return str
    .split('_')
    .map((w) => w.charAt(0) + w.slice(1).toLowerCase())
    .join(' ');
}

export async function fetchTokenizationSpokes(
  client: Client,
  hubAddress: Hex,
  hubName: string,
  assets: FetchedHubAsset[],
  knownNonTokenizationSpokes: Set<string>,
): Promise<Map<number, Hex>> {
  const hubContract = getContract({address: getAddress(hubAddress), abi: IHubV4_ABI, client});
  const results = new Map<number, Hex>();
  const hubLabel = toTitleCase(hubName);

  for (const asset of assets) {
    const spokeCount = await hubContract.read.getSpokeCount([BigInt(asset.assetId)]);
    const spokeAddresses = await Promise.all(
      Array.from({length: Number(spokeCount)}, (_, i) =>
        hubContract.read.getSpokeAddress([BigInt(asset.assetId), BigInt(i)]),
      ),
    );

    const candidates = spokeAddresses.filter(
      (addr) =>
        !knownNonTokenizationSpokes.has(addr.toLowerCase()) &&
        addr.toLowerCase() !== asset.feeReceiver.toLowerCase(),
    );

    if (candidates.length === 1) {
      results.set(asset.assetId, getAddress(candidates[0]));
    } else if (candidates.length > 1) {
      const settled = await Promise.allSettled(
        candidates.map(async (candidate) => {
          const tokSpoke = getContract({
            address: candidate,
            abi: ITokenizationSpokeV4_ABI,
            client,
          });
          const [hub, hubResult, nameResult] = await Promise.all([
            tokSpoke.read.hub(),
            tokSpoke.read.assetId(),
            tokSpoke.read.name(),
          ]);
          return {candidate, hub, hubResult, nameResult};
        }),
      );

      for (const result of settled) {
        if (result.status !== 'fulfilled') continue;
        const {candidate, hub, hubResult, nameResult} = result.value;

        // Using TokenizationSpoke name against Hub label and asset symbol for verification, can be replaced by
        // a more robust method in the future.
        if (
          hub.toLowerCase() === hubAddress.toLowerCase() &&
          Number(hubResult) === asset.assetId &&
          nameResult.includes(asset.symbol) &&
          nameResult.includes(hubLabel)
        ) {
          results.set(asset.assetId, getAddress(candidate));
          break;
        }
      }
    }

    if (!results.has(asset.assetId)) {
      throw new Error(
        `Could not identify tokenization spoke for asset ${asset.symbol} (id=${asset.assetId}) on hub ${hubAddress}`,
      );
    }
  }

  return results;
}
