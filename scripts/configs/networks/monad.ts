import {ChainId} from '@aave-dao/toolbox';
import {NetworkAddresses} from 'scripts/configs/types';

export const monadAddresses: NetworkAddresses = {
  name: 'Monad',
  chainId: ChainId.monad,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x7447Ce5fC2454Cfd94E236a99178AdB2cD87aB87',
    PROTOCOL_GUARDIAN: '0xc887455536CBD4e615B745e70CaCde15B3117e74',
  },
};
