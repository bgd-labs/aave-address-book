import {ChainId} from '../../generator/chains';
import {NetworkAddresses} from '../types';

export const baseAddresses: NetworkAddresses = {
  name: 'Base',
  chainId: ChainId.base,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0xAe940e61E9863178b71500c9B5faE2a04Da361a1',
    TRANSPARENT_PROXY_FACTORY: '0x05225Cd708bCa9253789C1374e4337a019e99D56',
    PROXY_ADMIN: '0xc85b1E333aecc99340b2320493Fe2d22b8734795',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    PROTOCOL_GUARDIAN: '0x9e10C0A1Eb8FF6a0AaA53a62C7a338f35D7D9a2A',
  },
};
