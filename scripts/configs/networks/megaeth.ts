import { ChainId } from '@bgd-labs/toolbox';
import { NetworkAddresses } from '../types';

export const megaEthAddresses: NetworkAddresses = {
  name: 'MegaEth',
  chainId: ChainId.megaeth,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0x8126eAd44383cb52Cf6A1bb70F1b4d7399DE34ef',
  },
};
