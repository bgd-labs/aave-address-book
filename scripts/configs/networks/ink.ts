import { ChainId } from '@bgd-labs/toolbox';
import { NetworkAddresses } from '../types';

export const inkWhiteLabelAddresses: NetworkAddresses = {
  name: 'InkWhitelabel',
  chainId: ChainId.ink,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x5C2e738F6E27bCE0F7558051Bf90605dD6176900',
    PROTOCOL_GUARDIAN: '0x00C2B13eF4F70Bf1827179Fe6d8facF7cFf6AcD2'
  },
};

export const inkAddresses: NetworkAddresses = {
  name: 'Ink',
  chainId: ChainId.ink,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
  },
};