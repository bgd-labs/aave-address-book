import {ChainId} from '@bgd-labs/js-utils';
import {PoolConfig} from '../types';

export const gnosisProtoV3: PoolConfig = {
  name: 'Gnosis',
  chainId: ChainId.gnosis,
  POOL_ADDRESSES_PROVIDER: '0x36616cf17557639614c1cdDb356b1B83fc0B2132',
  additionalAddresses: {
    CONFIG_ENGINE: '0x97CB9e81d480A2AB03299760654C1DDC0C16bE07',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x1236010CECea55998384e795B59815D871f5f94d',
    UI_INCENTIVE_DATA_PROVIDER: '0x5d4d4007a4c6336550ddaa2a7c0d5e7972eebd16',
    UI_POOL_DATA_PROVIDER: '0x5598bbfa2f4fe8151f45bba0a3ede1b54b51a0a9',
    WALLET_BALANCE_PROVIDER: '0x4172E6aAEC070ACB31aaCE343A58c93E4C70f44D',
    WETH_GATEWAY: '0x7B9c12915c594a68dE96201Cbdc79147F09da278',
    CAPS_PLUS_RISK_STEWARD: '0x33AE1f41546a2e05368Bf789b3d868813c0Ae658',
    RISK_STEWARD: '0x677c9f358dA5DC83aF6760a839E4448D72840d04',
    FREEZING_STEWARD: '0x3Ceaf9b6CAb92dFe6302D0CC3F1BA880C28d35e5',
    STATIC_A_TOKEN_FACTORY: '0x02e9b27599C4Bf8f789d34b6E65C51092c3d9FA6',
  },
};
