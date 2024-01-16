import {GovernanceConfig} from '../types';
import {ChainId} from '@bgd-labs/js-utils';

export const governanceConfigBNB: GovernanceConfig = {
  name: 'BNB',
  CHAIN_ID: ChainId.bnb,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x9d33ee6543C9b2C8c183b8fb58fB089266cffA19',
    CL_EMERGENCY_ORACLE: '0xcabb46FfB38c93348Df16558DF156e9f68F9F7F1',
    PAYLOADS_CONTROLLER: '0xE5EF2Dd06755A97e975f7E282f828224F2C3e627',
    PC_DATA_HELPER: '0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A',
  },
};
