import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const zkSyncAddresses: NetworkAddresses = {
  name: 'ZkSync',
  chainId: ChainId.zkSync,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x8Ef21C75Ce360078cAD162565ED0c27617eCccE0',
    PROXY_ADMIN: '0x158d6c497317367CEa3CBAb0BD84E6de236F060D',
    // PROTOCOL_GUARDIAN: '',
  },
};
