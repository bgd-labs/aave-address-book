import {Hex} from 'viem';
import {ChainId} from '../generator/chains';

export type AddressInfo = {
  address: Hex;
  // default assumption is address always
  type?: 'address' | string;
};

export interface GovernanceConfig {
  CHAIN_ID: ChainId;
  CROSS_CHAIN_CONTROLLER?: AddressInfo;
  GOVERNANCE?: AddressInfo;
  VOTING_MACHINE?: AddressInfo;
  PAYLOADS_CONTROLLER?: AddressInfo;
  VOTING_PORTAL_ETH_ETH?: AddressInfo;
  VOTING_PORTAL_ETH_AVAX?: AddressInfo;
  VOTING_PORTAL_ETH_POL?: AddressInfo;
}
