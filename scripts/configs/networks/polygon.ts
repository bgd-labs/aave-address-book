import {Hex} from 'viem';
import {ChainId} from '../../generator/chains';
import {NetworkAddresses} from '../types';

export const polygonAddresses: NetworkAddresses<{AAVE_POL_ETH_BRIDGE: Hex}> = {
  name: 'Polygon',
  chainId: ChainId.polygon,
  addresses: {
    AAVE_POL_ETH_BRIDGE: '0x1C2BA5b8ab8e795fF44387ba6d251fa65AD20b36',
    PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60',
    TRANSPARENT_PROXY_FACTORY: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    CREATE_3_FACTORY: '0x3b56998Ec06477704622ca8e2eA1b4db134cec32',
    PROTOCOL_GUARDIAN: '0x1450F2898D6bA2710C98BE9CAF3041330eD5ae58',
    AAVE_MERKLE_DISTRIBUTOR: '0x7A9ff54A6eE4a21223036890bB8c4ea2D62c686b',
  },
};

export const mumbaiAddresses: NetworkAddresses = {
  name: 'Mumbai',
  chainId: ChainId.mumbai,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x49A726CC7B438dBc4fB89a9548B5E8691e1C35A6',
    PROXY_ADMIN: '0xaebfFE29D8E823e8E43695648F418fa8c30AF879',
  },
};
