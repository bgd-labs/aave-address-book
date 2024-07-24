import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigZkSync: GovernanceConfig = {
  name: 'ZkSync',
  CHAIN_ID: ChainId.zkSync,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xA707c95C9e9acB5168971E92b6152aeb0d853153',
    PAYLOADS_CONTROLLER: '0x693E85a21287f3EA255E83bDf5e1192486251360',
    PC_DATA_HELPER: '0xe28A3235DCF1Acb8397B546bd588bAAFD7081505',
    // GRANULAR_GUARDIAN: '',
  },
};
