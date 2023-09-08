import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigArbitrum: GovernanceConfig = {
  name: 'Arbitrum',
  CHAIN_ID: ChainId.arbitrum_one,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xCbFB78a3Eeaa611b826E37c80E4126c8787D29f0',
  },
};
