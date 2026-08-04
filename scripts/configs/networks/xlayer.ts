import {ChainId} from '@aave-dao/toolbox';
import {NetworkAddresses} from 'scripts/configs/types';

export const xLayerAddresses: NetworkAddresses = {
  name: 'XLayer',
  chainId: ChainId.xLayer,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xF6Dac650dA5616Bc3206e969D7868e7c25805171',
    PROTOCOL_GUARDIAN: '0xD0D1CcB0391aADF1EaD96814ce7ab4008Ebdb336',
    BUDGET_INCENTIVE_SAFE: '0x66Ac7223048037826e12cef9a848199e31AEFabE',
    MERKL_DISTRIBUTION_SAFE: '0x89587ebe7cFF64c6527fE2Deccc3521D75763E8D',
    ROBOT_GUARDIAN: '0x441E4053fDDF1e1a77a39d00309Af389096d4124',
    ALC_SAFE: '0xA1c93D2687f7014Aaf588c764E3Ce80aF016229b',
  },
};
