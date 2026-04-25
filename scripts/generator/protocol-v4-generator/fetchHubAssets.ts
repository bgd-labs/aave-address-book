import {Client, Hex, getAddress, getContract} from 'viem';
import {IHubV4_ABI} from '../../../src/ts/abis/IHubV4';
import {IERC20Detailed_ABI} from '../../../src/ts/abis/IERC20Detailed';

export interface FetchedHubAsset {
  symbol: string;
  underlying: Hex;
  decimals: number;
  assetId: number;
  feeReceiver: Hex;
}

export async function fetchHubAssets(client: Client, hubAddress: Hex): Promise<FetchedHubAsset[]> {
  const hubContract = getContract({address: getAddress(hubAddress), abi: IHubV4_ABI, client});
  const assetCount = await hubContract.read.getAssetCount();

  return Promise.all(
    Array.from({length: Number(assetCount)}, (_, i) => i).map(async (assetId) => {
      const asset = await hubContract.read.getAsset([BigInt(assetId)]);
      const erc20 = getContract({address: asset.underlying, abi: IERC20Detailed_ABI, client});
      const rawSymbol = await erc20.read.symbol();
      // Sanitize symbol for use as identifier (replace hyphens with underscores)
      const symbol = rawSymbol.replace(/-/g, '_');

      return {
        symbol,
        underlying: asset.underlying,
        decimals: asset.decimals,
        assetId,
        feeReceiver: asset.feeReceiver,
      };
    }),
  );
}
