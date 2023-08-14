import {Pool} from './config.js';
import {Hex, PublicClient, getAddress, zeroAddress} from 'viem';

export const bytes32toAddress = (bytes32: Hex) => {
  return getAddress(`0x${bytes32.slice(26)}`);
};

export const getImplementationStorageSlot = async (provider: PublicClient, address: Hex) => {
  return (await provider.getStorageAt({
    address,
    slot: '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc',
  })) as Hex;
};

export const generateAdditionalAddresses = (
  additionalAddresses: Pool['additionalAddresses']
): string => {
  if (additionalAddresses) {
    return Object.keys(additionalAddresses).reduce((acc, key) => {
      acc += `export const ${key} = "${
        additionalAddresses![key as keyof typeof additionalAddresses]
      }";\n`;
      return acc;
    }, '');
  }
  return '';
};

export const generateAdditionalGovV3Addresses = (
  govV3Addresses: Pool['govV3Addresses']
): string => {
  if (govV3Addresses) {
    return Object.keys(govV3Addresses).reduce((acc, key) => {
      acc += `export const ${key} = "${
        govV3Addresses![key as keyof typeof govV3Addresses]
      }";\n`;
      return acc;
    }, '');
  }
  return '';
};

export const generateAdditionalAddressesSol = (
  additionalAddresses: Pool['additionalAddresses']
): string => {
  if (additionalAddresses) {
    return Object.keys(additionalAddresses).reduce((acc, key) => {
      acc += `address internal constant ${key} = ${
        additionalAddresses![key as keyof typeof additionalAddresses]
      };\n\n`;
      return acc;
    }, '');
  }
  return '';
};

export const generateAdditionalGovV3AddressesSol = (
  govV3Addresses: Pool['govV3Addresses']
): string => {
  if (govV3Addresses) {
    return Object.keys(govV3Addresses).reduce((acc, key) => {
      acc += `address internal constant ${key} = ${
        govV3Addresses![key as keyof typeof govV3Addresses]
      };\n\n`;
      return acc;
    }, '');
  }
  return '';
};

export function addressOrZero(address?: Hex) {
  if (address) return address;
  return zeroAddress;
}
