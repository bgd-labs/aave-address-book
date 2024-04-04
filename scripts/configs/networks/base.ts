import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const baseAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  cbETH_ETH_AGGREGATOR: Hex;
}> = {
  name: 'Base',
  chainId: ChainId.base,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0xAe940e61E9863178b71500c9B5faE2a04Da361a1',
    TRANSPARENT_PROXY_FACTORY: '0x05225Cd708bCa9253789C1374e4337a019e99D56',
    PROXY_ADMIN: '0xc85b1E333aecc99340b2320493Fe2d22b8734795',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    PROTOCOL_GUARDIAN: '0x9e10C0A1Eb8FF6a0AaA53a62C7a338f35D7D9a2A',
    wstETH_stETH_AGGREGATOR: '0xB88BAc61a4Ca37C43a3725912B1f472c9A5bc061',
    cbETH_ETH_AGGREGATOR: '0x868a501e68F3D1E89CfC0D22F6b22E8dabce5F04',
  },
};

export const baseSepoliaAddresses: NetworkAddresses = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xd90f09ea5ee893b8c0564719e855f1cf0455d894',
    PROXY_ADMIN: '0xF9e48edc704BDF494309cA457BCea4c0696f591d',
    GHO_TOKEN:'0x7CFa3f3d1cded0Da930881c609D4Dbf0012c14Bb'
  },
};
