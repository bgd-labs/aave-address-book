import {ChainId} from '../../generator/chains';
import {NetworkAddresses} from '../types';

export const scrollAddresses: NetworkAddresses = {
  name: 'Scroll',
  chainId: ChainId.scroll,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xFa2eeb2d0054C3Db2A606E2cd9EE111b62707D1e',
    PROXY_ADMIN: '0x782559e349b084bB7C07c08404aE6E3436cDAE2E',
    // TODO: CREATE_3_FACTORY: '',
    // TODO: PROTOCOL_GUARDIAN: '',
  },
};
