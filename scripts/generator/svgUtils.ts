import {existsSync, readFileSync} from 'fs';
import {join} from 'path';
import Hash from 'ipfs-only-hash';

export enum VARIANT {
  UNDERLYING,
  A_TOKEN,
  STATA_TOKEN,
}

export const VARIANT_FOLDER: Record<VARIANT, string> = {
  [VARIANT.UNDERLYING]: 'underlying',
  [VARIANT.A_TOKEN]: 'aToken',
  [VARIANT.STATA_TOKEN]: 'stataToken',
};

const SYMBOL_SYMBOL_MAP = {
  miMATIC: 'MAI',
  BTCB: 'BTC',
  'BTC.b': 'BTC',
  fUSDT: 'USDT',
} as const;
/**
 * some assets share a icon, although having different symbols onchain
 */
function getIconForSymbol(symbol) {
  if (/\.e/.test(symbol)) return symbol.replace('.e', '');
  if (/m\./.test(symbol)) return symbol.replace('m.', '');
  return SYMBOL_SYMBOL_MAP[symbol] || symbol;
}

export async function getSymbolUri(_symbol: string, variant: VARIANT): Promise<string | undefined> {
  const symbol = getIconForSymbol(_symbol).toLowerCase();
  const filePath = join(process.cwd(), 'assets', VARIANT_FOLDER[variant], `${symbol}.svg`);
  if (existsSync(filePath)) {
    const cid = await getHash(
      readFileSync(filePath, {
        encoding: 'utf8',
      }),
    );
    return `ipfs://${cid}`;
  } else {
    console.log('symbol not found', symbol, variant);
  }
}

/**
 * Returns the cid0 hash for a given string
 * @param data
 * @returns
 */
async function getHash(data: string): Promise<string> {
  return Hash.of(data);
}
