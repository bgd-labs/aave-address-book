import { GovernanceConfig } from "../types";
import { ChainId } from '@bgd-labs/toolbox';

export const governanceConfigInkWhiteLabel: GovernanceConfig = {
  name: 'InkWhitelabel',
  CHAIN_ID: ChainId.ink,
  ADDRESSES: {
    PERMISSIONED_PAYLOADS_CONTROLLER: '0x1dE9CB9420Dd1f2cCeFFf9393E126b800D413b7A',
  },
};

export const governanceConfigInk: GovernanceConfig = {
  name: 'Ink',
  CHAIN_ID: ChainId.ink,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x990B75fD1a2345D905a385dBC6e17BEe0Cb2f505',
    PAYLOADS_CONTROLLER: '0x44D73D7C4b2f98F426Bf8B5e87628d9eE38ef0Cf',
    PC_DATA_HELPER: '0xd0929668178973d5994D5654929aCB3d6c2b9949',
    GRANULAR_GUARDIAN: '0xa2bDB2335Faf1940c99654c592B1a80618d79Fc9',
    GOVERNANCE_GUARDIAN: '0x1bBcC6F0BB563067Ca45450023a13E34fa963Fa9',
  },
};