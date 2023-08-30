import {Hex, PublicClient, getAddress, zeroAddress} from 'viem';
import {AddressInfo, Addresses} from '../configs/types';

function getExplorerLink(publicClient: PublicClient, address: Hex) {
  return `${publicClient.chain?.blockExplorers?.default.url}/address/${getAddress(address)}`;
}

export function prefixWithPragma(code: string) {
  return `// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

${code}`;
}

export function prefixWithGeneratedWarning(code: string) {
  return `// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR\n${code}`;
}

export function wrapIntoSolidityLibrary(code: string[], libraryName: string) {
  return `library ${libraryName} {
    ${code.join('\n')}
  }`;
}

export function addressInfoToSolidityLibraryConstant(
  publicClient: PublicClient,
  key: string,
  entry: AddressInfo,
) {
  if (typeof entry === 'object') {
    if (entry.type === 'uint256') {
      return `${entry.type} internal constant ${key} = ${entry.value};`;
    }
    const blockExplorerLinkComment = getExplorerLink(publicClient, entry.value);
    if (entry.type === 'address')
      return `// ${blockExplorerLinkComment}\naddress internal constant ${key} = ${getAddress(
        entry.value,
      )};`;
    return `// ${blockExplorerLinkComment}\n${entry.type} internal constant ${key} = ${
      entry.type
    }(${getAddress(entry.value)});`;
  }
  const blockExplorerLinkComment = getExplorerLink(publicClient, entry);
  return `// ${blockExplorerLinkComment}\naddress internal constant ${key} = ${getAddress(entry)};`;
}

export function generateSolidityConstants(publicClient: PublicClient, addresses: Addresses) {
  return Object.keys(addresses).map((key) =>
    addressInfoToSolidityLibraryConstant(publicClient, key, addresses[key]),
  );
}

export function addressToJsConstant(publicClient: PublicClient, key: string, entry: AddressInfo) {
  if (typeof entry === 'object') {
    if (entry.type === 'uint256') {
      return `export const ${key} = ${entry.value};`;
    }
    const blockExplorerLinkComment = getExplorerLink(publicClient, entry.value);
    return `// ${entry.type} ${blockExplorerLinkComment}\n export const ${key} = '${getAddress(
      entry.value,
    )}';`;
  }

  const blockExplorerLinkComment = getExplorerLink(publicClient, entry);
  return `// ${blockExplorerLinkComment}\nexport const ${key} = '${getAddress(entry)}';`;
}

export function generateJsConstants(publicClient: PublicClient, addresses: Addresses) {
  return Object.keys(addresses).map((key) =>
    addressToJsConstant(publicClient, key, addresses[key]),
  );
}

export const bytes32toAddress = (bytes32: Hex) => {
  return getAddress(`0x${bytes32.slice(26)}`);
};

export const getImplementationStorageSlot = async (provider: PublicClient, address: Hex) => {
  return (await provider.getStorageAt({
    address,
    slot: '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc',
  })) as Hex;
};

export function addressOrZero(address?: Hex): Hex {
  if (address) return address;
  return zeroAddress;
}
