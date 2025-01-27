import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const mantleAddresses: NetworkAddresses = {
  name: 'Mantle',
  chainId: ChainId.mantle,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
  },
};
