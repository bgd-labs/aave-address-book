import { Address, getAddress } from 'viem';
import * as addresses from './AaveAddressBook';

type AnyObject = { [key: string]: any };

function flattenObject(obj: AnyObject, parentKey = '', result: AnyObject = {}): AnyObject {
  for (const [key, value] of Object.entries(obj)) {
    const newKey = parentKey ? `${parentKey}.${key}` : key;

    if (value !== null && typeof value === 'object' && !Array.isArray(value)) {
      flattenObject(value, newKey, result);
    } else {
      result[newKey] = value;
    }
  }
  return result;
}

/**
 * Checks if address is listed on address-book
 * @param value
 * @param chainId
 * @returns string[] found paths to address-book addresses
 */
export function getAddressBookReferences(value: Address, chainId: number): string[] {
  // glob imports have no object properties
  // therefore we recreate the object via spread & remove addresses unrelated to the chain we are checking
  const transformedAddresses = Object.keys(addresses).reduce(
    (acc, key) => {
      if (addresses[key as keyof typeof addresses].CHAIN_ID === chainId) {
        const chainAddresses = { ...addresses[key as keyof typeof addresses] };
        // deleting eModes as they only contain duplicates and on lookup should always be deprioritized
        if ((chainAddresses as any).E_MODES) {
          delete (chainAddresses as any).E_MODES;
        }
        return { ...acc, ...flattenObject({ [key]: chainAddresses }) };
      }
      return acc;
    },
    {} as Record<string, Address>,
  );
  return Object.keys(transformedAddresses).filter(
    (key) => transformedAddresses[key] === getAddress(value),
  );
}

type Deliteralize<T> = {
  [K in keyof T]: T[K] extends string ? string : T[K];
};
type MakePropertyRequired<T, K extends keyof T> = T & {
  [P in K]-?: T[P];
};

type Addresses = Extract<(typeof addresses)[keyof typeof addresses], { CHAIN_ID: number }>;
type AddressFilter = MakePropertyRequired<Partial<Deliteralize<Addresses>>, 'CHAIN_ID'>;

/**
 * Searches the address book for entries matching the filter
 * @param filter an object with properties to filter by
 * @returns list of matching entries
 */
export const filterAddresses = <F extends AddressFilter>(filter: F) => {
  const result = Object.values(addresses).filter((v) => {
    return Object.entries(filter).every(([key, left]) => {
      const right = v[key as keyof Addresses];

      if (typeof left === 'string') {
        return left.toLowerCase() === String(right).toLowerCase();
      }
      return left === v[key as keyof Addresses];
    });
  }) as Extract<Addresses, F>[];

  return result;
};

/**
 * Finds a single entry in the address book matching the filter
 * @param filter a filter object, that should match exactly one entry
 * @returns exactly one matching entry
 * @throws if no or multiple entries are found
 */
export const findAddress = <F extends AddressFilter>(filter: F) => {
  const results = filterAddresses(filter);
  if (!results[0]) {
    throw new Error(`No entry found in address book for filter ${JSON.stringify(filter)}`);
  }
  if (results[1]) {
    throw new Error(
      `Multiple entries found in address book for filter ${JSON.stringify(
        filter,
      )}: ${results.map((r) => JSON.stringify(r)).join(', ')}`,
    );
  }
  return results[0];
};
