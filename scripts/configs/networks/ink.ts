import { ChainId } from '@bgd-labs/toolbox';
import { NetworkAddresses } from '../types';

export const inkWhiteLabelAddresses: NetworkAddresses = {
  name: 'InkWhitelabel',
  chainId: ChainId.ink,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x5C2e738F6E27bCE0F7558051Bf90605dD6176900',
    PROTOCOL_GUARDIAN: '0x00C2B13eF4F70Bf1827179Fe6d8facF7cFf6AcD2',
    AGENT_HUB: '0x17781Ba226b359e5C1E1ee5ac9E28Ec5b84fd039',
    AGENT_HUB_AUTOMATION: '0x951C37a35cA9e61448B90B7AF5E371cFdA70326C',
    RANGE_VALIDATION_MODULE: '0xd24790e75799968ce3fed6e27285bad0a26e7e36',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    ROBOT_GUARDIAN: '0x441E4053fDDF1e1a77a39d00309Af389096d4124',
  },
};

export const inkAddresses: NetworkAddresses = {
  name: 'Ink',
  chainId: ChainId.ink,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    ROBOT_GUARDIAN: '0x441E4053fDDF1e1a77a39d00309Af389096d4124',
  },
};

export const inkSepoliaAddresses: NetworkAddresses = {
  name: 'InkSepolia',
  chainId: ChainId.ink_sepolia,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xd8247C7926841337E8adf9fD9E87026992C45062'
  },
};
