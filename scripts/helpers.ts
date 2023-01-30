import {ethers, utils} from 'ethers';
import {Pool} from './config';

export const bytes32toAddress = (bytes32: string) => {
  return utils.getAddress(`0x${bytes32.slice(26)}`);
};

export const getImplementationStorageSlot = async (
  provider: ethers.providers.StaticJsonRpcProvider,
  address: string
) => {
  return await provider.getStorageAt(
    address,
    '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc'
  );
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

export async function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
