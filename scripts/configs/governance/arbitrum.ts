import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigArbitrum: GovernanceConfig = {
  name: 'Arbitrum',
  CHAIN_ID: ChainId.arbitrum_one,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x5DA7D1150e7dc6eE060c75c5BdE00Fa92Eb9a675',
  },
};
