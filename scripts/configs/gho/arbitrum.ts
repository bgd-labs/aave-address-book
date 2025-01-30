import {ChainId} from '@bgd-labs/rpc-env';
import {GhoAddresses} from '../types';

export const ghoArbitrum: GhoAddresses = {
  name: 'Arbitrum',
  chainId: ChainId.arbitrum,
  addresses: {
    GHO_CCIP_TOKEN_POOL: '0xB94Ab28c6869466a46a42abA834ca2B3cECCA5eB',
    GHO_AAVE_STEWARD: '0xd2D586f849620ef042FE3aF52eAa10e9b78bf7De',
    GHO_BUCKET_STEWARD: '0xa9afaE6A53E90f9E4CE0717162DF5Bc3d9aBe7B2',
    GHO_CCIP_STEWARD: '0xCd5ab470AaC5c13e1063ee700503f3346b7C90Db',
  },
};
