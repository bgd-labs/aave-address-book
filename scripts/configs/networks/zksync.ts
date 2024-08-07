import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';
import {NetworkAddresses} from '../types';

export const zkSyncAddresses: NetworkAddresses = {
  name: 'ZkSync',
  chainId: ChainId.zkSync,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x903A3228c4C58e94787CB33EE83e087bCFcF0a91',
    PROXY_ADMIN: '0x158d6c497317367CEa3CBAb0BD84E6de236F060D',
    PROTOCOL_GUARDIAN: '0xba845c27903F7dDB5c676e5b74728C871057E000',
  },
};
