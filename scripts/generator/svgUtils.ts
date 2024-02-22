import {readFileSync, readdirSync} from 'fs';
import {join} from 'path';
import Hash from 'ipfs-only-hash';

export const assets = readdirSync(join(process.cwd(), 'assets/underlying'));

export enum VARIANT {
  UNDERLYING,
  A_TOKEN,
  STATA_TOKEN,
}

export enum VARIANT_SUFFIX {
  A_TOKEN = '_aToken',
  STATA_TOKEN = '_stataToken',
}

export async function getSymbolUri(symbol: string, variant: VARIANT): Promise<string | undefined> {
  const fileName = getFileName(symbol, variant);
  const exists = assets.includes(fileName);
  if (exists) {
    const cid = await getHash(
      readFileSync(join(process.cwd(), 'assets/underlying', fileName), {encoding: 'utf8'}),
    );
    return `ipfs://${cid}`;
  }
}

/**
 * Returns the filename based on a constant pattern
 * @param _symbol
 * @param variant
 * @returns
 */
function getFileName(_symbol: string, variant: VARIANT): string {
  const symbol = _symbol.toLowerCase();
  if (variant === VARIANT.UNDERLYING) return `${symbol}.svg`;
  if (variant === VARIANT.A_TOKEN) return `${symbol}${VARIANT_SUFFIX.A_TOKEN}.svg`;
  if (variant === VARIANT.STATA_TOKEN) return `${symbol}${VARIANT_SUFFIX.STATA_TOKEN}.svg`;
  throw new Error('unknown variant');
}

/**
 * Returns the cid0 hash for a given string
 * @param data
 * @returns
 */
async function getHash(data: string): Promise<string> {
  return Hash.of(data);
}
