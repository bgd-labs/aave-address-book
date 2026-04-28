import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const mantleAddresses: NetworkAddresses = {
  name: 'Mantle',
  chainId: ChainId.mantle,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0x172867391d690Eb53896623DaD22208624230686',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    ROBOT_GUARDIAN: '0x441E4053fDDF1e1a77a39d00309Af389096d4124',
  },
};
