import { ChainId } from '@bgd-labs/toolbox';
import { GovernanceConfig } from '../types';

export const governanceConfigSoneium: GovernanceConfig = {
  name: 'Soneium',
  CHAIN_ID: ChainId.soneium,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xD92b37a5114b33F668D274Fb48f23b726a854d6E',
    PAYLOADS_CONTROLLER: '0x44D73D7C4b2f98F426Bf8B5e87628d9eE38ef0Cf',
    PC_DATA_HELPER: '0xd0929668178973d5994D5654929aCB3d6c2b9949',
    GRANULAR_GUARDIAN: '0xD8E6956718784B914740267b7A50B952fb516656',
    GOVERNANCE_GUARDIAN: '0x19CE4363FEA478Aa04B9EA2937cc5A2cbcD44be6',
  },
};
