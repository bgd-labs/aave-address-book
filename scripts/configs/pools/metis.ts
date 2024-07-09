import {ChainId} from '@bgd-labs/js-utils';
import {PoolConfig} from '../types';

export const metisProtoV3: PoolConfig = {
  name: 'Metis',
  chainId: ChainId.metis,
  POOL_ADDRESSES_PROVIDER: '0xB9FABd7500B2C6781c35Dd48d54f81fc2299D7AF',
  additionalAddresses: {
    CAPS_PLUS_RISK_STEWARD: '0x5f4d15d761528c57a5C30c43c1DAb26Fc5452731',
    FREEZING_STEWARD: '0x2C77153fF4a1e83A8d8D750735FB101ECB55949f',
    L2_ENCODER: '0x9f3A1B399A9074eBA63Dc4fc274bE2A2b2d80cB9',
    CONFIG_ENGINE: '0x17Dd33Ed0e3dD2a80E37489B8A63063161BE6957',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x9E7B73ffD9D2026F3ff4212c29E209E09C8A91F5',
    RATES_FACTORY: '0x87Aaba7cf8e1F319d0E3402d68017171201dEcd5',
    UI_INCENTIVE_DATA_PROVIDER: '0x3e7BC5EcE0f22DbB16c3e3EeA288a10A57d68927',
    UI_POOL_DATA_PROVIDER: '0x7dd60bd8507fDC3d300d53427b7AE566701a7320',
    WALLET_BALANCE_PROVIDER: '0x1df710eb1E2FD9C21494aF2BFb1F210a4185885b',
    STATIC_A_TOKEN_FACTORY: '0x9C62AdC332888F56998542415c38D7CDf3Ff7619',
  },
};
