import { AssetTag, getAssetIconNameAndPath } from "@bgd-labs/react-web3-icons/dist/utils";
import { Strings } from "@helia/strings";

export enum VARIANT {
  UNDERLYING,
  A_TOKEN,
  STATA_TOKEN,
}

const VARIANT_TAGS: Record<VARIANT, AssetTag | undefined> = {
  [VARIANT.UNDERLYING]: undefined,
  [VARIANT.A_TOKEN]: AssetTag.AToken,
  [VARIANT.STATA_TOKEN]: AssetTag.StataToken,
};

export async function getSymbolUri(symbol: string, variant: VARIANT, str: Strings): Promise<string | undefined> {
  const { iconPathToRepo } = getAssetIconNameAndPath({
    symbol,
    assetTag: VARIANT_TAGS[variant],
  });
  const symbolResponse = await fetch(iconPathToRepo);
  if (symbolResponse.ok) {
    const symbolSvgCode = await symbolResponse.text();
    const cid = await str.add(symbolSvgCode);
    return `ipfs://${cid.toString()}`;
  } else {
    console.log('symbol not found', symbol, variant);
  }
}
