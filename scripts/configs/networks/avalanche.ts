import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const avalancheAddresses: NetworkAddresses = {
  name: 'Avalanche',
  chainId: ChainId.avalanche,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    PROTOCOL_GUARDIAN: '0xa35b76E4935449E33C56aB24b23fcd3246f13470',
    AAVE_MERKLE_DISTRIBUTOR: '0xA065d5A299E618CD84a87641d5eEbC7916Fdf32E',
  },
};

export const avalancheFujiAddresses: NetworkAddresses = {
  name: 'Fuji',
  chainId: ChainId.fuji,
  addresses: {
    GHO_TOKEN: '0x9c04928Cc678776eC1C1C0E46ecC03a5F47A7723',
  },
};
