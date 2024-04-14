import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const gnosisAddresses: NetworkAddresses<{wstETH_stETH_AGGREGATOR: Hex}> = {
  name: 'Gnosis',
  chainId: ChainId.gnosis,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x47aAdaAE1F05C978E6aBb7568d11B7F6e0FC4d6A',
    PROXY_ADMIN: '0xe892E40C92c2E4D281Be59b2E6300F271d824E75',
    CREATE_3_FACTORY: '0x2cC41488f4494c5e11cB6cbA82199442B9f495B6',
    PROTOCOL_GUARDIAN: '0xF163b8698821cefbD33Cf449764d69Ea445cE23D',
    wstETH_stETH_AGGREGATOR: '0x0064AC007fF665CF8D0D3Af5E0AD1c26a3f853eA',
  },
};
