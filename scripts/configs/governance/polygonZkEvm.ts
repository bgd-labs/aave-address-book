import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigPolygonZkEvm: GovernanceConfig = {
  name: 'PolygonZkEvm',
  CHAIN_ID: ChainId.zkEVM,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xed7e0874526B9BB9E36C7e9472ed7ed324CEeE3B',
    PAYLOADS_CONTROLLER: '0xa2d22795E0D85D4Cb14Cbb14Df7bb8fec1016615',
    PC_DATA_HELPER: '0xF1c11BE0b4466728DDb7991A0Ac5265646ec9672',
  },
};
