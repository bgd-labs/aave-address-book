import {ChainId} from '../../generator/chains';
import {NetworkAddresses} from '../types';

export const arbitrumAddresses: NetworkAddresses = {
  name: 'Arbitrum',
  chainId: ChainId.arbitrum_one,
  addresses: {PARASWAP_FEE_CLAIMER: '0x9abf798f5314BFd793A9E57A654BEd35af4A1D60'},
};
