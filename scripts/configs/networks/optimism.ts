import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const optimismAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  rETH_ETH_AGGREGATOR: Hex;
}> = {
  name: 'Optimism',
  chainId: ChainId.optimism,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    PROTOCOL_GUARDIAN: '0xe50c8c619d05ff98b22adf991f17602c774f785c',
    AAVE_MERKLE_DISTRIBUTOR: '0x1685D81212580DD4cDA287616C2f6F4794927e18',
    wstETH_stETH_AGGREGATOR: '0xe59EBa0D492cA53C6f46015EEa00517F2707dc77',
    rETH_ETH_AGGREGATOR: '0x22F3727be377781d1579B7C9222382b21c9d1a8f',
  },
};

export const optimismSepoliaAddresses: NetworkAddresses = {
  name: 'OptimismSepolia',
  chainId: ChainId.optimism_sepolia,
  addresses: {
    GHO_TOKEN: '0xb13Cfa6f8B2Eed2C37fB00fF0c1A59807C585810',
    TRANSPARENT_PROXY_FACTORY: '0xb172a90A7C238969CE9B27cc19D13b60A91e7F00',
    PROXY_ADMIN: '0xe892E40C92c2E4D281Be59b2E6300F271d824E75'
  },
};
