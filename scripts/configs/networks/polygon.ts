import {Hex} from 'viem';
import {ChainId} from '../../generator/chains';
import {NetworkAddresses} from '../types';

export const polygonAddresses: NetworkAddresses<{AAVE_POL_ETH_BRIDGE: Hex}> = {
  name: 'Polygon',
  chainId: ChainId.polygon,
  addresses: {
    AAVE_POL_ETH_BRIDGE: '0xc928002904Ec475663A83063D492EA2aE09EbDA1',
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
  },
};
