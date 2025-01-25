import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const lineaAddresses: NetworkAddresses = {
  name: 'Linea',
  chainId: ChainId.linea,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xef62fc23727c17b612081114b1919d139a7b1b83',
    PROXY_ADMIN: '0x160E35e28fEE90F3656420584e0a990276219b5A',
    PROTOCOL_GUARDIAN: '0x0BF186764D8333a938f35e5dD124a7b9b9dccDF9',
  },
};
