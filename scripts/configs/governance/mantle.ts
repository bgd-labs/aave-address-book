import {ChainId} from '@bgd-labs/rpc-env';
import {GovernanceConfig} from '../types';

export const governanceConfigMantle: GovernanceConfig = {
  name: 'Mantle',
  CHAIN_ID: ChainId.mantle,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x1283C5015B1Fb5616FA3aCb0C18e6879a02869cB',
    PAYLOADS_CONTROLLER: '0xF089f77173A3009A98c45f49D547BF714A7B1e01',
    PC_DATA_HELPER: '0x5e06b10B3b9c3E1c0996D2544A35B9839Be02922',
    GRANULAR_GUARDIAN: '0xb26670d2800DBB9cfCe2f2660FfDcA48C799c86d',
    GOVERNANCE_GUARDIAN: '0x14816fC7f443A9C834d30eeA64daD20C4f56fBCD',
  },
};
