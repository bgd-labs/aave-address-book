import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';
import {Hex} from 'viem';

export const metisAddresses: NetworkAddresses<{
  LEGACY_BRIDGE_EXECUTOR: Hex;
}> = {
  name: 'Metis',
  chainId: ChainId.metis,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x1dad86dC5990BCE5bFe3A150A4E0ece990d6EBcB',
    PROXY_ADMIN: '0x1CabD986cBAbDf12E00128DFf03C80ee62C4fd97',
    CREATE_3_FACTORY: '0x2e649f6b54B07E210b31c9cC2eB8a0d5997c3D4A',
    PROTOCOL_GUARDIAN: '0xF6Db48C5968A9eBCB935786435530f28e32Cc501',
    LEGACY_BRIDGE_EXECUTOR: '0x8EC77963068474a45016938Deb95E603Ca82a029',
  },
};
