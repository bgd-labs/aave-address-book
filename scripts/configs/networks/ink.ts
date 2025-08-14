import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const inkAddresses: NetworkAddresses = {
  name: 'InkWhitelabel',
  chainId: ChainId.ink,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x5C2e738F6E27bCE0F7558051Bf90605dD6176900',
    PROTOCOL_GUARDIAN: '0x00C2B13eF4F70Bf1827179Fe6d8facF7cFf6AcD2'
  },
};
