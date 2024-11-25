import {ChainId} from '@bgd-labs/rpc-env';
import {GhoAddresses} from '../types';

export const ghoArbitrum: GhoAddresses = {
  name: 'Arbitrum',
  chainId: ChainId.arbitrum,
  addresses: {
    GHO_CCIP_TOKEN_POOL: '0xF168B83598516A532a85995b52504a2Fa058C068',
  },
};
