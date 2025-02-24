import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const celoAddresses: NetworkAddresses = {
  name: 'Celo',
  chainId: ChainId.celo,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x1Be33D186a081eFDf15310e4bdEd81E828C47f9b',
    PROXY_ADMIN: '0x54BDcc37c4143f944A3EE51C892a6cBDF305E7a0',
    PROTOCOL_GUARDIAN: '0x88E7aB6ee481Cf92e548c0e1169F824F99142c85',
  },
};
