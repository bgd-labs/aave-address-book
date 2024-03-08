import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const arbitrumAddresses: NetworkAddresses<{
  wstETH_stETH_AGGREGATOR: Hex;
  rETH_ETH_AGGREGATOR: Hex;
}> = {
  name: 'Arbitrum',
  chainId: ChainId.arbitrum_one,
  addresses: {
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    PROTOCOL_GUARDIAN: '0xbbd9f90699c1fa0d7a65870d241dd1f1217c96eb',
    wstETH_stETH_AGGREGATOR: '0xB1552C5e96B312d0Bf8b554186F846C40614a540',
    rETH_ETH_AGGREGATOR: '0xF3272CAfe65b190e76caAF483db13424a3e23dD2',
  },
};

export const arbitrumSepoliaAddresses: NetworkAddresses = {
  name: 'ArbitrumSepolia',
  chainId: ChainId.arbitrum_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x43A8B7eC945a12a3Acb127B77ede19bd73ad76f8',
    PROXY_ADMIN: '0xCB5B3ca20603231945dC5731C33E7f7F7679Ea89',
    GHO_TOKEN: '0xb13Cfa6f8B2Eed2C37fB00fF0c1A59807C585810',
  },
};
