import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const baseAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  cbETH_ETH_AGGREGATOR: Hex;
  LEGACY_BRIDGE_EXECUTOR: Hex;
}> = {
  name: 'Base',
  chainId: ChainId.base,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROXY_ADMIN: '0xc85b1E333aecc99340b2320493Fe2d22b8734795',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    AAVE_CL_ROBOT_OPERATOR: '0x88db99eeBb390a2a4DcAC2E1DDb09c07E911C5C3',
    PROTOCOL_GUARDIAN: '0x56C1a4b54921DEA9A344967a8693C7E661D72968',
    wstETH_stETH_AGGREGATOR: '0xB88BAc61a4Ca37C43a3725912B1f472c9A5bc061',
    cbETH_ETH_AGGREGATOR: '0x868a501e68F3D1E89CfC0D22F6b22E8dabce5F04',
    LEGACY_BRIDGE_EXECUTOR: '0xA9F30e6ED4098e9439B2ac8aEA2d3fc26BcEbb45',
  },
};

export const baseSepoliaAddresses: NetworkAddresses = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xd1B3E25fD7C8AE7CADDC6F71b461b79CD4ddcFa3',
    PROXY_ADMIN: '0xbeCE3Cb857644b44Bb44084f9AfE784473ADb17B',
    GHO_TOKEN: '0x7CFa3f3d1cded0Da930881c609D4Dbf0012c14Bb',
  },
};
