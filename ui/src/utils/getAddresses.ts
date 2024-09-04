import * as addressBook from '../../../src/ts/AaveAddressBook';
import { isAddress, Address } from 'viem';
import { CHAIN_ID_CLIENT_MAP } from '@bgd-labs/js-utils';

export type ListItem = {
  path: string[];
  value: string;
  chainId: number;
};

export function flattenObject(
  obj: any,
  path: string[] = [],
  chainId: number | null = null,
): ListItem[] {
  const result: ListItem[] = [];
  const entries = Object.entries(obj).sort(([keyA], [keyB]) => {
    if (keyA === 'CHAIN_ID') return -1;
    if (keyB === 'CHAIN_ID') return 1;
    return 0;
  });

  for (let [key, value] of entries) {
    if (key === 'tokenlist') continue;
    if (chainId && CHAIN_ID_CLIENT_MAP[chainId!].chain?.testnet) continue;

    const newPath = [...path, key];
    if (key === 'CHAIN_ID') {
      chainId = value as number;
    }
    if (typeof value === 'object' && value !== null) {
      result.push(...flattenObject(value, newPath, chainId));
    } else if (isAddress(value as string)) {
      result.push({
        path: newPath,
        value: value as Address,
        chainId: chainId!,
      });
    }
  }
  return result;
}

export const flattenedAddresses = flattenObject(addressBook);
