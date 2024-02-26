import {readFileSync, readdirSync} from 'fs';
import {join} from 'path';
import Hash from 'ipfs-only-hash';

export const assets = readdirSync(join(process.cwd(), 'assets/underlying'));

export enum VARIANT {
  UNDERLYING,
  A_TOKEN,
  STATA_TOKEN,
}

export enum VARIANT_FOLDER {
  UNDERLYING = 'underlying',
  A_TOKEN = 'aToken',
  STATA_TOKEN = 'stataToken',
}

/**
 * some assets share a icon, although having different symbols onchain
 */
const SYMBOL_SYMBOL_MAP = {} as const;

export async function getSymbolUri(_symbol: string, variant: VARIANT): Promise<string | undefined> {
  const rawSymbol = _symbol.toLowerCase();
  const symbol = SYMBOL_SYMBOL_MAP[rawSymbol] || rawSymbol;
  const exists = assets.includes(symbol);
  if (exists) {
    const cid = await getHash(
      readFileSync(join(process.cwd(), 'assets', VARIANT_FOLDER[variant], symbol), {
        encoding: 'utf8',
      }),
    );
    return `ipfs://${cid}`;
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
