import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigOptimism: GovernanceConfig = {
  name: 'Optimism',
  CHAIN_ID: ChainId.optimism,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x48A9FE90bce5EEd790f3F4Ce192d1C0B351fd4Ca',
    PAYLOADS_CONTROLLER: '0x0E1a3Af1f9cC76A62eD31eDedca291E63632e7c4',
    PC_DATA_HELPER: '0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A',
  },
};
