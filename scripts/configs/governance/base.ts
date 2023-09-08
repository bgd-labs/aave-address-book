import {GovernanceConfig} from '../types';
import {ChainId} from '../../generator/chains';

export const governanceConfigBase: GovernanceConfig = {
  name: 'Base',
  CHAIN_ID: ChainId.base,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x529467C76f234F2bD359d7ecF7c660A2846b04e2',
  },
};
