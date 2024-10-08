import {
  AssetTag,
  getAssetIconNameAndPath,
  getAssetName,
} from '@bgd-labs/react-web3-icons/dist/utils';

export enum VARIANT {
  UNDERLYING,
  A_TOKEN,
  STATA_TOKEN,
  STATIC_A_TOKEN,
}

const VARIANT_TAGS: Record<VARIANT, AssetTag | undefined> = {
  [VARIANT.UNDERLYING]: undefined,
  [VARIANT.A_TOKEN]: AssetTag.AToken,
  [VARIANT.STATA_TOKEN]: AssetTag.StataToken,
  [VARIANT.STATIC_A_TOKEN]: AssetTag.StataToken,
};

export async function getSymbolUri(symbol: string, variant: VARIANT): Promise<string | undefined> {
  const assetName = getAssetName({symbol});
  const {iconPathToRepo} = getAssetIconNameAndPath({
    symbol,
    assetTag: VARIANT_TAGS[variant],
  });

  if (assetName !== 'Unknown') {
    return iconPathToRepo;
  } else {
    console.log('symbol not found', symbol, variant);
  }
}
