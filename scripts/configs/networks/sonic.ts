import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const sonicAddresses: NetworkAddresses = {
  name: 'Sonic',
  chainId: ChainId.sonic,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0xA4aF5175ed38e791362F01c67a487DbA4aE07dFe',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    MASIV_SAFE: '0xdef1FA4CEfe67365ba046a7C630D6B885298E210',
  },
};
