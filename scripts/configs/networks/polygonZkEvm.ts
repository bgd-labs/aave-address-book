import {NetworkAddresses} from '../types';
import {ChainId} from '@bgd-labs/rpc-env';

export const polygonZkEvmAddresses: NetworkAddresses = {
  name: 'PolygonZkEvm',
  chainId: ChainId.zkEVM,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0xAe940e61E9863178b71500c9B5faE2a04Da361a1',
    TRANSPARENT_PROXY_FACTORY: '0xd91d1331db4F436DaF47Ec9Dd86deCb8EEF946B4',
    PROXY_ADMIN: '0x2f6571d3Eb9a4e350C68C36bCD2afe39530078E2',
    CREATE_3_FACTORY: '0xE2E8Badc5d50f8a6188577B89f50701cDE2D4e19',
    PROTOCOL_GUARDIAN: '0x8C05474F1f0161F71276677De0a2d8a347583c45',
  },
};
