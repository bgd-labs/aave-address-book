import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const avalancheAddresses: NetworkAddresses = {
  name: 'Avalanche',
  chainId: ChainId.avalanche,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0x2Efe215aE82339fa059bb9d611E4cC858cfe9Df6',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    AAVE_CL_ROBOT_OPERATOR: '0x06d958772304e7220fc3E463756CE01Ed0D24db2',
    PROTOCOL_GUARDIAN: '0x56C1a4b54921DEA9A344967a8693C7E661D72968',
    AAVE_MERKLE_DISTRIBUTOR: '0xA065d5A299E618CD84a87641d5eEbC7916Fdf32E',
  },
};

export const avalancheFujiAddresses: NetworkAddresses = {
  name: 'Fuji',
  chainId: ChainId.fuji,
  addresses: {
    GHO_TOKEN: '0x9c04928Cc678776eC1C1C0E46ecC03a5F47A7723',
    TRANSPARENT_PROXY_FACTORY: '0x421117D7319E96d831972b3F7e970bbfe29C4F21',
    PROXY_ADMIN: '0xd6a6339c6C1B5a8792afA6e0E80b1908b8579f51',
    FAUCET: '0x48b5bd96e36a9c0d0ea3f07d3b3da34bbd514fb3'
  },
};
