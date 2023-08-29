import {Hex, PublicClient, getAddress} from 'viem';
import {AddressInfo} from '../configs/types';

function getExplorerLink(publicClient: PublicClient, address: Hex) {
  return `${publicClient.chain?.blockExplorers?.default.url}/address/${address}`;
}

export function prefixWithPragma(code: string) {
  return `// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

${code}`;
}

export function addressInfoToSolidityLibraryConstant(
  publicClient: PublicClient,
  key: string,
  entry: AddressInfo,
) {
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

export function generateSolidityLibrary<T extends {[key: string]: AddressInfo}>(
  publicClient: PublicClient,
  addresses: T,
  name: string,
) {
  const solidityConstants = Object.keys(addresses).map((key) =>
    addressInfoToSolidityLibraryConstant(publicClient, key, addresses[key]),
  );
  return `library ${name} {
    ${solidityConstants.join('\n\n')}
  }`;
}

export function addressToJsConstant(publicClient: PublicClient, key: string, entry: AddressInfo) {
  if (entry.type === 'uint256') {
    return `const ${key} = ${entry.value};`;
  }

  const blockExplorerLinkComment = getExplorerLink(publicClient, entry.value);
  if (entry.type === 'address')
    return `// ${blockExplorerLinkComment}\nconst ${key} = '${getAddress(entry.value)}';`;
}

export function generateJsLibrary<T extends {[key: string]: AddressInfo}>(
  publicClient: PublicClient,
  addresses: T,
) {
  const jsConstants = Object.keys(addresses).map((key) =>
    addressToJsConstant(publicClient, key, addresses[key]),
  );
  return jsConstants.join('\n\n');
}
