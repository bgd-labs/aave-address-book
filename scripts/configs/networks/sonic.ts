import {ChainId} from '@bgd-labs/rpc-env';
import {NetworkAddresses} from '../types';

export const sonicAddresses: NetworkAddresses = {
  name: 'Sonic',
  chainId: ChainId.sonic,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0xA4aF5175ed38e791362F01c67a487DbA4aE07dFe',
  },
};
