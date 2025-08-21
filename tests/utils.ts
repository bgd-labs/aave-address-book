import { Address, Client, getContract } from 'viem';
import * as addressBook from '../src/ts/AaveAddressBook';
import { IPoolAddressesProvider_ABI } from '../src/ts/abis/IPoolAddressesProvider';

export function getGovernance(chainId: number) {
  for (const [name, lib] of Object.entries(addressBook)) {
    if (name.startsWith('GovernanceV3') && lib.CHAIN_ID === chainId) return lib;
  }
}

export function getWhiteLabelGovernance(chainId: number) {
  for (const [name, lib] of Object.entries(addressBook)) {
    if (name.startsWith('GovernanceV3') && lib.CHAIN_ID === chainId && name.toLowerCase().includes('whitelabel')) return lib;
  }
}

export function getMisc(chainId: number) {
  for (const [name, lib] of Object.entries(addressBook)) {
    if (name.startsWith('Misc') && lib.CHAIN_ID === chainId) return lib;
  }
}

export async function isPoolWhiteLabel(poolAddressProviderAddress: Address, client: Client) {
  const poolAddressProvider = getContract({
    abi: [...IPoolAddressesProvider_ABI] as const,
    address: poolAddressProviderAddress,
    client,
  });
  const marketId = await poolAddressProvider.read.getMarketId();
  return marketId.toLowerCase().includes('whitelabel');
}