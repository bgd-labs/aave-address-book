import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigArbitrum: GovernanceConfig = {
  name: 'Arbitrum',
  CHAIN_ID: ChainId.arbitrum_one,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x55b9C6DFCC84f120de502484C1C7Cb158A25D610',
  },
};
