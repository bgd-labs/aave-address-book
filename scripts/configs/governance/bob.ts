import { ChainId } from '@bgd-labs/toolbox';
import { GovernanceConfig } from '../types';

export const governanceConfigBob: GovernanceConfig = {
  name: 'Bob',
  CHAIN_ID: ChainId.bob,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0xf630C8A7bC033FD20fcc45d8B43bFe92dE73154F',
    PAYLOADS_CONTROLLER: '0x17fa87007bfF1dC7e6b3a36ED936E6355e37237C',
    PC_DATA_HELPER: '0x9fE056F44510F970d724adA16903ba5D75CC4742',
    GRANULAR_GUARDIAN: '0xb2C672931Bd1Da226e29997Ec8cEB60Fb1DA3959',
    GOVERNANCE_GUARDIAN: '0x19CE4363FEA478Aa04B9EA2937cc5A2cbcD44be6',
  },
};
