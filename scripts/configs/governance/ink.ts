import {GovernanceConfig} from "../types";
import {ChainId} from '@bgd-labs/toolbox';

export const governanceConfigInk: GovernanceConfig = {
  name: 'InkWhitelabel',
  CHAIN_ID: ChainId.ink,
  ADDRESSES: {
    PERMISSIONED_PAYLOADS_CONTROLLER: '0x1dE9CB9420Dd1f2cCeFFf9393E126b800D413b7A',
  },
};
