import * as addressBook from '../src/ts/AaveAddressBook';

export function getGovernance(chainId: number) {
  for (const [name, lib] of Object.entries(addressBook)) {
    if (name.startsWith('GovernanceV3') && lib.CHAIN_ID === chainId) return lib;
  }
}

export function getMisc(chainId: number) {
  for (const [name, lib] of Object.entries(addressBook)) {
    if (name.startsWith('Misc') && lib.CHAIN_ID === chainId) return lib;
  }
}
