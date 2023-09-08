import {GovernanceConfig} from '../types';
import {ChainId} from '../../generator/chains';

export const governanceConfigMetis: GovernanceConfig = {
  name: 'Metis',
  CHAIN_ID: ChainId.metis,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xFF66F99Bc4A21E697A8c3DAfa52274E433b9e5aD',
  },
};
