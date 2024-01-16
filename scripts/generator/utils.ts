import {Hex, PublicClient, getAddress, zeroAddress} from 'viem';
import {AddressInfo, Addresses} from '../configs/types';
import {CHAIN_ID_CLIENT_MAP, ChainId} from '@bgd-labs/js-utils';

function getExplorerLink(chainId: ChainId, address: Hex) {
  const client = CHAIN_ID_CLIENT_MAP[chainId];
  return `${client.chain?.blockExplorers?.default.url}/address/${getAddress(address)}`;
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
  chainId: ChainId,
  key: string,
  entry: AddressInfo,
) {
  if (typeof entry === 'object') {
    if (entry.type === 'uint256' || entry.type === 'uint8') {
      return `${entry.type} internal constant ${key} = ${entry.value};\n`;
    }
    const blockExplorerLinkComment = getExplorerLink(entry.chainId || chainId, entry.value);
    if (entry.type === 'address')
      return `// ${blockExplorerLinkComment}\naddress internal constant ${key} = ${getAddress(
        entry.value,
      )};\n`;
    return `// ${blockExplorerLinkComment}\n${entry.type} internal constant ${key} = ${
      entry.type
    }(${getAddress(entry.value)});\n`;
  }
  const blockExplorerLinkComment = getExplorerLink(chainId, entry);
  return `// ${blockExplorerLinkComment}\naddress internal constant ${key} = ${getAddress(
    entry,
  )};\n`;
}

export function generateSolidityConstants({
  chainId,
  addresses,
}: {
  chainId: ChainId;
  addresses: Addresses;
}) {
  return Object.keys(addresses).map((key) =>
    addressInfoToSolidityLibraryConstant(chainId, key, addresses[key]),
  );
}

export function addressToJsConstant(chainId: ChainId, key: string, entry: AddressInfo) {
  if (typeof entry === 'object') {
    if (entry.type === 'uint256') {
      return `export const ${key} = ${entry.value};\n`;
    }
    const blockExplorerLinkComment = getExplorerLink(entry.chainId || chainId, entry.value);
    return `// ${entry.type} ${blockExplorerLinkComment}\n export const ${key} = '${getAddress(
      entry.value,
    )}';\n`;
  }

  const blockExplorerLinkComment = getExplorerLink(chainId, entry);
  return `// ${blockExplorerLinkComment}\nexport const ${key} = '${getAddress(entry)}';\n`;
}

export function generateJsConstants({
  chainId,
  addresses,
}: {
  chainId: ChainId;
  addresses: Addresses;
}) {
  return Object.keys(addresses).map((key) => addressToJsConstant(chainId, key, addresses[key]));
}

export function generateJsObject({addresses}: {addresses: Addresses}) {
  return JSON.stringify(
    addresses,
    function (key, value) {
      if (!key) return value;
      return typeof value === 'object' ? value.value : value;
    },
    2,
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
