import {Address, getAddress} from 'viem';
import * as addresses from './AaveAddressBook';

type AnyObject = {[key: string]: any};

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
        const chainAddresses = {...addresses[key as keyof typeof addresses]};
        // deleting eModes as they only contain duplicates and on lookup should always be deprioritized
        if ((chainAddresses as any).E_MODES) {
          delete (chainAddresses as any).E_MODES;
        }
        return {...acc, ...flattenObject({[key]: chainAddresses})};
      }
      return acc;
    },
    {} as Record<string, Address>,
  );
  return Object.keys(transformedAddresses).filter(
    (key) => transformedAddresses[key] === getAddress(value),
  );
}
