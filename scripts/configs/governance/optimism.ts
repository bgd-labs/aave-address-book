import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigOptimism: GovernanceConfig = {
  name: 'Optimism',
  CHAIN_ID: ChainId.optimism,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x48A9FE90bce5EEd790f3F4Ce192d1C0B351fd4Ca',
  },
};
