import {ChainId} from '@bgd-labs/rpc-env';
import {GhoAddresses} from '../types';

export const ghoArbitrum: GhoAddresses = {
  name: 'Arbitrum',
  chainId: ChainId.arbitrum,
  addresses: {
    GHO_CCIP_TOKEN_POOL: '0xB94Ab28c6869466a46a42abA834ca2B3cECCA5eB',
  },
};
