import { ChainId } from '@bgd-labs/toolbox';
import { GovernanceConfig } from '../types';

export const governanceConfigXlayer: GovernanceConfig = {
  name: 'XLayer',
  CHAIN_ID: ChainId.xLayer,
  ADDRESSES: {
    // CROSS_CHAIN_CONTROLLER: '',
    // PAYLOADS_CONTROLLER: '',
    // PC_DATA_HELPER: '',
    // GRANULAR_GUARDIAN: '',
    GOVERNANCE_GUARDIAN: '0xeB55A63bf9993d80c86D47f819B5eC958c7C127B',
    // CL_EMERGENCY_ORACLE: '',
  },
};