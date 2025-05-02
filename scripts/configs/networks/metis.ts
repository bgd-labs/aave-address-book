import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';
import {Hex} from 'viem';

export const metisAddresses: NetworkAddresses<{
  LEGACY_BRIDGE_EXECUTOR: Hex;
}> = {
  name: 'Metis',
  chainId: ChainId.metis,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROXY_ADMIN: '0x1CabD986cBAbDf12E00128DFf03C80ee62C4fd97',
    CREATE_3_FACTORY: '0x2e649f6b54B07E210b31c9cC2eB8a0d5997c3D4A',
    PROTOCOL_GUARDIAN: '0x56C1a4b54921DEA9A344967a8693C7E661D72968',
    LEGACY_BRIDGE_EXECUTOR: '0x8EC77963068474a45016938Deb95E603Ca82a029',
  },
};
