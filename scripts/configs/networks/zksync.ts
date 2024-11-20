import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const zkSyncAddresses: NetworkAddresses = {
  name: 'ZkSync',
  chainId: ChainId.zksync,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x8601Af6a00862112b2F2E4993684073D904DE836',
    PROXY_ADMIN: '0x158d6c497317367CEa3CBAb0BD84E6de236F060D',
    PROTOCOL_GUARDIAN: '0xba845c27903F7dDB5c676e5b74728C871057E000',
  },
};
