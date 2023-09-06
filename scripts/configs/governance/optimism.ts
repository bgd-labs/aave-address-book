import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigOptimism: GovernanceConfig = {
  name: 'Optimism',
  CHAIN_ID: ChainId.optimism,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x7810AEF20eeF5BF7140402497FF8fB231A4B3fbA',
  },
};
