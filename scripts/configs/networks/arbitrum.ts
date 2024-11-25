import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const arbitrumAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  rETH_ETH_AGGREGATOR: Hex;
  LEGACY_BRIDGE_EXECUTOR: Hex;
}> = {
  name: 'Arbitrum',
  chainId: ChainId.arbitrum,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0x9b643d4ac937bee8bfb1ec76401c22e18c318429',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    AAVE_CL_ROBOT_OPERATOR: '0xaa944aD95e51CB83C1f35FAEEDfC7d2c31B0BB4d',
    PROTOCOL_GUARDIAN: '0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6',
    wstETH_stETH_AGGREGATOR: '0xB1552C5e96B312d0Bf8b554186F846C40614a540',
    rETH_ETH_AGGREGATOR: '0xF3272CAfe65b190e76caAF483db13424a3e23dD2',
    LEGACY_BRIDGE_EXECUTOR: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
  },
};

export const arbitrumSepoliaAddresses: NetworkAddresses = {
  name: 'ArbitrumSepolia',
  chainId: ChainId.arbitrum_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x5f4d15d761528c57a5c30c43c1dab26fc5452731',
    PROXY_ADMIN: '0xCB5B3ca20603231945dC5731C33E7f7F7679Ea89',
    GHO_TOKEN: '0xb13Cfa6f8B2Eed2C37fB00fF0c1A59807C585810',
  },
};
