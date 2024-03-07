import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const baseSepoliaAddresses: NetworkAddresses = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xd90f09ea5ee893b8c0564719e855f1cf0455d894',
    PROXY_ADMIN: '0xF9e48edc704BDF494309cA457BCea4c0696f591d',
  },
};
