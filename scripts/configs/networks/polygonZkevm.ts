import {NetworkAddresses} from '../types';
import {ChainId} from '../../generator/chains';

export const polygonZkevmAddresses: NetworkAddresses = {
  name: 'PolygonZkEVM',
  chainId: ChainId.zkevm,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x8B6851156023f4f5A66F68BEA80851c3D905Ac93',
    PROXY_ADMIN: '0x2f6571d3Eb9a4e350C68C36bCD2afe39530078E2',
    CREATE_3_FACTORY: '0xE2E8Badc5d50f8a6188577B89f50701cDE2D4e19',
    PROTOCOL_GUARDIAN: '0x8C05474F1f0161F71276677De0a2d8a347583c45',
  },
};
