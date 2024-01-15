import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigArbitrum: GovernanceConfig = {
  name: 'Arbitrum',
  CHAIN_ID: ChainId.arbitrum_one,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xCbFB78a3Eeaa611b826E37c80E4126c8787D29f0',
    PAYLOADS_CONTROLLER: '0x89644CA1bB8064760312AE4F03ea41b05dA3637C',
    PC_DATA_HELPER: '0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A',
  },
};
