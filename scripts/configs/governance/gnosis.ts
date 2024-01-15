import {GovernanceConfig} from '../types';
import {ChainId} from '@bgd-labs/js-utils';

export const governanceConfigGnosis: GovernanceConfig = {
  name: 'Gnosis',
  CHAIN_ID: ChainId.gnosis,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x8Dc5310fc9D3D7D1Bb3D1F686899c8F082316c9F',
    CL_EMERGENCY_ORACLE: '0xF937ffAeA1363e4Fa260760bDFA2aA8Fc911F84D',
    PAYLOADS_CONTROLLER: '0x9A1F491B86D09fC1484b5fab10041B189B60756b',
    PC_DATA_HELPER: '0xF1c11BE0b4466728DDb7991A0Ac5265646ec9672',
  },
};
