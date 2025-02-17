import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const avalancheAddresses: NetworkAddresses = {
  name: 'Avalanche',
  chainId: ChainId.avalanche,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    AAVE_CL_ROBOT_OPERATOR: '0x06d958772304e7220fc3E463756CE01Ed0D24db2',
    PROTOCOL_GUARDIAN: '0x56C1a4b54921DEA9A344967a8693C7E661D72968',
    AAVE_MERKLE_DISTRIBUTOR: '0xA065d5A299E618CD84a87641d5eEbC7916Fdf32E',
  },
};

export const avalancheFujiAddresses: NetworkAddresses = {
  name: 'Fuji',
  chainId: ChainId.avalanche_fuji,
  addresses: {
    GHO_TOKEN: '0x9c04928Cc678776eC1C1C0E46ecC03a5F47A7723',
    TRANSPARENT_PROXY_FACTORY: '0x5f4d15d761528c57a5C30c43c1DAb26Fc5452731',
    PROXY_ADMIN: '0x440F1b750Cbc7DDd2Bd9Af279Afe422EaeE58b41',
  },
};
