import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const lineaAddresses: NetworkAddresses = {
  name: 'Linea',
  chainId: ChainId.linea,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xef62fc23727c17b612081114b1919d139a7b1b83',
    PROXY_ADMIN: '0x160E35e28fEE90F3656420584e0a990276219b5A',
    PROTOCOL_GUARDIAN: '0x0BF186764D8333a938f35e5dD124a7b9b9dccDF9',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    MASIV_SAFE: '0xdef1FA4CEfe67365ba046a7C630D6B885298E210',
  },
};
