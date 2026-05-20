import {Client, Hex, getAddress} from 'viem';
import {multicall} from 'viem/actions';
import {ITokenizationSpokeV4_ABI} from 'src/ts/abis/ITokenizationSpokeV4';
import {FetchedHubAsset} from 'scripts/generator/protocol-v4-generator/fetchHubAssets';

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
  spokesByAssetId: Map<number, Hex[]>,
  knownNonTokenizationSpokes: Set<string>,
): Promise<Map<number, Hex>> {
  const hub = getAddress(hubAddress);
  const results = new Map<number, Hex>();
  const hubLabel = toTitleCase(hubName);

  type CandidateTask = {asset: FetchedHubAsset; candidate: Hex};
  const pendingCandidates: CandidateTask[] = [];

  for (const asset of assets) {
    const spokeAddresses = spokesByAssetId.get(asset.assetId)!;
    const candidates = spokeAddresses.filter(
      (addr) =>
        !knownNonTokenizationSpokes.has(addr.toLowerCase()) &&
        addr.toLowerCase() !== asset.feeReceiver.toLowerCase(),
    );

    if (candidates.length === 1) {
      results.set(asset.assetId, getAddress(candidates[0]));
    } else if (candidates.length > 1) {
      for (const candidate of candidates) {
        pendingCandidates.push({asset, candidate});
      }
    }
  }

  if (pendingCandidates.length > 0) {
    const validationContracts = pendingCandidates.flatMap(({candidate}) => [
      {address: candidate, abi: ITokenizationSpokeV4_ABI, functionName: 'hub'} as const,
      {address: candidate, abi: ITokenizationSpokeV4_ABI, functionName: 'assetId'} as const,
      {address: candidate, abi: ITokenizationSpokeV4_ABI, functionName: 'name'} as const,
    ]);

    const validationResults = await multicall(client, {
      allowFailure: true,
      contracts: validationContracts,
    });

    // Using TokenizationSpoke name against Hub label and asset symbol for verification, can be replaced by
    // a more robust method in the future.
    for (let i = 0; i < pendingCandidates.length; i++) {
      const {asset, candidate} = pendingCandidates[i];
      if (results.has(asset.assetId)) continue;
      const hubRes = validationResults[i * 3];
      const assetIdRes = validationResults[i * 3 + 1];
      const nameRes = validationResults[i * 3 + 2];
      if (
        hubRes.status !== 'success' ||
        assetIdRes.status !== 'success' ||
        nameRes.status !== 'success'
      ) {
        continue;
      }
      const hubAddr = hubRes.result as Hex;
      const assetIdVal = assetIdRes.result as bigint;
      const nameVal = nameRes.result as string;
      if (
        hubAddr.toLowerCase() === hub.toLowerCase() &&
        Number(assetIdVal) === asset.assetId &&
        nameVal.includes(asset.symbol) &&
        nameVal.includes(hubLabel)
      ) {
        results.set(asset.assetId, getAddress(candidate));
      }
    }
  }

  for (const asset of assets) {
    if (!results.has(asset.assetId)) {
      throw new Error(
        `Could not identify tokenization spoke for asset ${asset.symbol} (id=${asset.assetId}) on hub ${hubAddress}`,
      );
    }
  }

  return results;
}
