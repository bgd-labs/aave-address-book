import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const bobAddresses: NetworkAddresses = {
  name: 'Bob',
  chainId: ChainId.bob,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
  },
};
