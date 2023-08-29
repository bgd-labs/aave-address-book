import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigMainnet: GovernanceConfig = {
  CHAIN_ID: ChainId.mainnet,
  GOVERNANCE: '0x4096461e8756f8ad1d06992B61d322aB29e73e21',
  VOTING_MACHINE: '0x4D20436E4c6Fc1fF27312f4531112692bbdbC481',
  PAYLOADS_CONTROLLER: '0xf6FB2B1ab6EF8fb24F068229932e60276C9950AE',
  VOTING_PORTAL_ETH_ETH: '0x26B4f5FB207a2635bfEF11DFd86d862B93f85E5a',
};
