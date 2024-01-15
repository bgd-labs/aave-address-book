import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const bnbAddresses: NetworkAddresses = {
  name: 'BNB',
  chainId: ChainId.bnb,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x47aAdaAE1F05C978E6aBb7568d11B7F6e0FC4d6A',
    PROTOCOL_GUARDIAN: '0x25170e9Ed4077ABA7D3DD03cf4A9F45Dc6D0fcCD',
    PARASWAP_FEE_CLAIMER: '0xAe940e61E9863178b71500c9B5faE2a04Da361a1',
    PROXY_ADMIN: '0x39EBFfc7679c62Dfcc4A3E2c09Bcb0be255Ae63c',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
  },
};
