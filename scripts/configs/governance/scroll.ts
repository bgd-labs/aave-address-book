import {ChainId} from '@bgd-labs/js-utils';
import {GovernanceConfig} from '../types';

export const governanceConfigScroll: GovernanceConfig = {
  name: 'Scroll',
  CHAIN_ID: ChainId.scroll,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x03073D3F4769f6b6604d616238fD6c636C99AD0A',
    PAYLOADS_CONTROLLER: '0x6b6B41c0f8C223715f712BE83ceC3c37bbfDC3fE',
    PC_DATA_HELPER: '0xf438e33dCCEE260ee4371F9dceF408b0d7DBe424',
  },
};
