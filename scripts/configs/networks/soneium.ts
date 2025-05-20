import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const soneiumAddresses: NetworkAddresses = {
  name: 'Soneium',
  chainId: ChainId.soneium,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0xEf323B194caD8e02D9E5D8F07B34f625f1c088f1',
  },
};
