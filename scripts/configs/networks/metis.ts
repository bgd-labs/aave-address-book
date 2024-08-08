import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const metisAddresses: NetworkAddresses = {
  name: 'Metis',
  chainId: ChainId.metis,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x1dad86dC5990BCE5bFe3A150A4E0ece990d6EBcB',
    PROXY_ADMIN: '0x1CabD986cBAbDf12E00128DFf03C80ee62C4fd97',
    CREATE_3_FACTORY: '0x2e649f6b54B07E210b31c9cC2eB8a0d5997c3D4A',
    PROTOCOL_GUARDIAN: '0x56C1a4b54921DEA9A344967a8693C7E661D72968',
    GOVERNANCE_GUARDIAN: '0x360c0a69Ed2912351227a0b745f890CB2eBDbcFe',
  },
};
