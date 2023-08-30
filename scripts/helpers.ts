import {ToHexParameters} from 'viem/dist/types/utils/encoding/toHex';
import {Pool, GovernanceV2, Misc} from './config';
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
  additionalAddresses: Pool['additionalAddresses'],
): string => {
  if (additionalAddresses) {
    return Object.keys(additionalAddresses).reduce((acc, key) => {
      acc += `export const ${key} = '${
        additionalAddresses![key as keyof typeof additionalAddresses]
      }';\n`;
      return acc;
    }, '');
  }
  return '';
};

export const generateAdditionalAddressesSol = (
  provider,
  additionalAddresses: Pool['additionalAddresses'],
): string => {
  if (additionalAddresses) {
    return Object.keys(additionalAddresses).reduce((acc, key) => {
      acc += `${generateExplorerLinkComment(
        provider,
        additionalAddresses![key as keyof typeof additionalAddresses]!,
      )}\naddress internal constant ${key} = ${
        additionalAddresses![key as keyof typeof additionalAddresses]
      };\n\n`;
      return acc;
    }, '');
  }
  return '';
};

export const generateGovV2AddressesSol = (govV2Addresses: GovernanceV2): string => {
  if (govV2Addresses) {
    return Object.keys(govV2Addresses).reduce((acc, key) => {
      if (key == 'GOV') {
        acc += `IAaveGovernanceV2 public constant ${key} =
        IAaveGovernanceV2(${govV2Addresses![key as keyof typeof govV2Addresses]});\n\n`;
      } else if (key == 'GOV_STRATEGY') {
        acc += `IGovernanceStrategy public constant ${key} =
        IGovernanceStrategy(${govV2Addresses![key as keyof typeof govV2Addresses]});\n\n`;
      } else {
        acc += `address internal constant ${key} = ${
          govV2Addresses![key as keyof typeof govV2Addresses]
        };\n\n`;
      }
      return acc;
    }, '');
  }
  return '';
};

export const generateGovV2Addresses = (govV2Addresses: GovernanceV2): string => {
  if (govV2Addresses) {
    return Object.keys(govV2Addresses).reduce((acc, key) => {
      acc += `export const ${key} = '${govV2Addresses![key as keyof typeof govV2Addresses]}';\n`;
      return acc;
    }, '');
  }
  return '';
};

export const generateMiscAddresses = (misc: Misc): string => {
  if (misc) {
    return Object.keys(misc).reduce((acc, key) => {
      acc += `export const ${key} = '${misc![key as keyof typeof misc]}';\n`;
      return acc;
    }, '');
  }
  return '';
};

export function addressOrZero(address?: Hex): Hex {
  if (address) return address;
  return zeroAddress;
}

export function generateExplorerLinkComment(publicClient: PublicClient, address: Hex) {
  return `// ${publicClient.chain?.blockExplorers?.default.url}/address/${address}`;
}
