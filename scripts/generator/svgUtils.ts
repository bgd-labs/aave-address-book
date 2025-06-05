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
  UMBRELLA_STAKE_TOKEN,
  UMBRELLA_STAKE_STATA_TOKEN,
}

const VARIANT_TAGS: Record<VARIANT, AssetTag | undefined> = {
  [VARIANT.UNDERLYING]: undefined,
  [VARIANT.A_TOKEN]: 'a',
  [VARIANT.STATA_TOKEN]: 'stata',
  [VARIANT.STATIC_A_TOKEN]: 'stata',
  [VARIANT.UMBRELLA_STAKE_TOKEN]: 'stk',
  [VARIANT.UMBRELLA_STAKE_STATA_TOKEN]: 'stkStata',
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

export function getUmbrellaStkVariant(symbol: string): VARIANT {
  return symbol.slice(3).startsWith('wa') ?
    VARIANT.UMBRELLA_STAKE_STATA_TOKEN : VARIANT.UMBRELLA_STAKE_TOKEN;
}
