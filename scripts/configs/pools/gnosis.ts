import {ChainId} from '@bgd-labs/js-utils';
import {PoolConfig} from '../types';

export const gnosisProtoV3: PoolConfig = {
  name: 'Gnosis',
  chainId: ChainId.gnosis,
  POOL_ADDRESSES_PROVIDER: '0x36616cf17557639614c1cdDb356b1B83fc0B2132',
  additionalAddresses: {
    CONFIG_ENGINE: '0xE2a33403eaD139873820da597531f07f65ED0E3c',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x1236010CECea55998384e795B59815D871f5f94d',
    RATES_FACTORY: '0x73dDE2A75c06a108912bf7Ff600eDdCE9d96Ed25',
    UI_INCENTIVE_DATA_PROVIDER: '0xCFDAdA7DCd2e785cF706BaDBC2B8Af5084d595e9',
    UI_POOL_DATA_PROVIDER: '0x86E2938daE289763D4e09a7e42c5cCcA62Cf9809',
    WALLET_BALANCE_PROVIDER: '0x4172E6aAEC070ACB31aaCE343A58c93E4C70f44D',
    WETH_GATEWAY: '0xfE76366A986B72c3f2923e05E6ba07b7de5401e4',
    CAPS_PLUS_RISK_STEWARD: '0x33AE1f41546a2e05368Bf789b3d868813c0Ae658',
    FREEZING_STEWARD: '0x3Ceaf9b6CAb92dFe6302D0CC3F1BA880C28d35e5',
    STATIC_A_TOKEN_FACTORY: '0x02e9b27599C4Bf8f789d34b6E65C51092c3d9FA6',
  },
};
