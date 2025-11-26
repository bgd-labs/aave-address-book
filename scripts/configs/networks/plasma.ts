import { ChainId } from '@bgd-labs/toolbox';
import { NetworkAddresses } from '../types';

export const plasmaAddresses: NetworkAddresses = {
  name: 'Plasma',
  chainId: ChainId.plasma,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0xEf323B194caD8e02D9E5D8F07B34f625f1c088f1',
    AGENT_HUB: '0x5F29ACbFB6de4282bB4DD2017930cDA730eD864D',
    AGENT_HUB_AUTOMATION: '0x8C29c9D5439ba69eEEBB132dE2aBd7CA1C04CF35',
    RANGE_VALIDATION_MODULE: '0x9240a6669cc4782fc98620212862df5cb2e0df10'
  },
};
