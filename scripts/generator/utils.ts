import {Hex, PublicClient} from 'viem';
import {AddressInfo} from '../configs/types';

function getExplorerLink(publicClient: PublicClient, address: Hex) {
  return `${publicClient.chain?.blockExplorers?.default.url}/address/${address}`;
}

export function addressInfoToSolidityLibraryConstant(
  publicClient: PublicClient,
  key: string,
  addressInfo: AddressInfo,
) {
  const blockExplorerLinkComment = getExplorerLink(publicClient, addressInfo.address);
  if (!addressInfo.type || addressInfo.type === 'address')
    return `// ${blockExplorerLinkComment}\naddress internal constant ${key} = ${addressInfo.address};`;
  return `// ${blockExplorerLinkComment}\n${addressInfo.type} internal constant ${key} = ${addressInfo.type}(${addressInfo.address});`;
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

export function addressInfoToJsConstant(
  publicClient: PublicClient,
  key: string,
  addressInfo: AddressInfo,
) {
  const blockExplorerLinkComment = getExplorerLink(publicClient, addressInfo.address);
  return `// ${blockExplorerLinkComment}\nconst ${key} = ${addressInfo.address};`;
}

export function generateJsLibrary<T extends {[key: string]: AddressInfo}>(
  publicClient: PublicClient,
  addresses: T,
) {
  const jsConstants = Object.keys(addresses).map((key) =>
    addressInfoToJsConstant(publicClient, key, addresses[key]),
  );
  return jsConstants.join('\n\n');
}
