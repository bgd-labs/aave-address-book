import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const celoAddresses: NetworkAddresses = {
  name: 'Celo',
  chainId: ChainId.celo,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xAe13e4DA0952f0B8fE04E21df53716fCF799a923',
    PROXY_ADMIN: '0x54BDcc37c4143f944A3EE51C892a6cBDF305E7a0',
    PROTOCOL_GUARDIAN: '0x38BC0ED9d90Bc2309A436f4ED6Ca6Bc4D5C0DFA6', // TODO: change to new one once deployed
  },
};