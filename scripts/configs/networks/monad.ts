import {ChainId} from '@aave-dao/toolbox';
import {NetworkAddresses} from 'scripts/configs/types';

export const monadAddresses: NetworkAddresses = {
  name: 'Monad',
  chainId: ChainId.monad,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0xc887455536CBD4e615B745e70CaCde15B3117e74',
  },
};
