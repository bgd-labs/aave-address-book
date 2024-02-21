import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigCelo: GovernanceConfig = {
  name: 'Celo',
  CHAIN_ID: ChainId.celo,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x4A5f4b29C0407E5Feb323305e121f563c7bC4d79',
    PAYLOADS_CONTROLLER: '0xa70964C9952b08559d5Cb977B44930f4f36bFA9d',
    PC_DATA_HELPER: '0xf438e33dCCEE260ee4371F9dceF408b0d7DBe424',
  },
};
