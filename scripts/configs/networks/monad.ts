import {ChainId} from '@aave-dao/toolbox';
import {NetworkAddresses} from 'scripts/configs/types';

export const monadAddresses: NetworkAddresses = {
  name: 'Monad',
  chainId: ChainId.monad,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x2f09b9D890535c2b5c81b1b95F7f92eeed5B9d5D',
    PROTOCOL_GUARDIAN: '0xc887455536CBD4e615B745e70CaCde15B3117e74',
  },
};
