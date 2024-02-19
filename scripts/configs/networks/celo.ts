import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const celoAddresses: NetworkAddresses = {
  name: 'Celo',
  chainId: ChainId.celo,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xb172a90A7C238969CE9B27cc19D13b60A91e7F00',
    PROTOCOL_GUARDIAN: '0x38BC0ED9d90Bc2309A436f4ED6Ca6Bc4D5C0DFA6',
    PROXY_ADMIN: '0x01d678F1bbE148C96e7501F1Ac41661904F84F61'
  },
};
