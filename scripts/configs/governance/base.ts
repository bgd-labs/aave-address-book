import {GovernanceConfig} from '../types';
import {ChainId} from '@bgd-labs/js-utils';

export const governanceConfigBase: GovernanceConfig = {
  name: 'Base',
  CHAIN_ID: ChainId.base,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x529467C76f234F2bD359d7ecF7c660A2846b04e2',
    PAYLOADS_CONTROLLER: '0x2DC219E716793fb4b21548C0f009Ba3Af753ab01',
    PC_DATA_HELPER: '0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A',
  },
};
