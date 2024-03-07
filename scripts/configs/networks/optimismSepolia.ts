import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const optimismSepoliaAddresses: NetworkAddresses = {
  name: 'OptimismSepolia',
  chainId: ChainId.optimism_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xb172a90A7C238969CE9B27cc19D13b60A91e7F00',
    PROXY_ADMIN: '0xe892E40C92c2E4D281Be59b2E6300F271d824E75'
  },
};
