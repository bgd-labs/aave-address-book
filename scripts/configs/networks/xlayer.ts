import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const xLayerAddresses: NetworkAddresses = {
  name: 'XLayer',
  chainId: ChainId.xLayer,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xF6Dac650dA5616Bc3206e969D7868e7c25805171',
    PROTOCOL_GUARDIAN: '0xD0D1CcB0391aADF1EaD96814ce7ab4008Ebdb336',
    ROBOT_GUARDIAN: '0x441E4053fDDF1e1a77a39d00309Af389096d4124',
  },
};
