import {GovernanceConfig} from '../types';
import {ChainId} from '@bgd-labs/js-utils';

export const governanceConfigMetis: GovernanceConfig = {
  name: 'Metis',
  CHAIN_ID: ChainId.metis,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x6fDaFb26915ABD6065a1E1501a37Ac438D877f70',
    PAYLOADS_CONTROLLER: '0x2233F8A66A728FBa6E1dC95570B25360D07D5524',
    PC_DATA_HELPER: '0x81d32B36380e6266e1BDd490eAC56cdB300afBe0',
  },
};
