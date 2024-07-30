import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigZkSync: GovernanceConfig = {
  name: 'ZkSync',
  CHAIN_ID: ChainId.zkSync,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x800813f4714BC7A0a95310e3fB9e4f18872CA92C',
    PAYLOADS_CONTROLLER: '0x2E79349c3F5e4751E87b966812C9E65E805996F1',
    PC_DATA_HELPER: '0xe28A3235DCF1Acb8397B546bd588bAAFD7081505',
    // GRANULAR_GUARDIAN: '',
  },
};