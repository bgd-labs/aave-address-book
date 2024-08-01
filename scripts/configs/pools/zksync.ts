import {ChainId} from '@bgd-labs/js-utils';
import {PoolConfig} from '../types';

export const zkSyncProtoV3: PoolConfig = {
  name: 'ZkSync',
  chainId: ChainId.zkSync,
  POOL_ADDRESSES_PROVIDER: '0xE8bC6e12faf260dbA1c942134070221B11BF37Fb',
  additionalAddresses: {
    L2_ENCODER: '0x54478961c63F981066859c6aac4160f2d7A658E3',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x396C44011e58108eC3a7Ad83B5c9FB4B256Ba5D7',
    UI_INCENTIVE_DATA_PROVIDER: '0xEeaC35776B35837318c317E0aE57AFdef7eeF40a',
    UI_POOL_DATA_PROVIDER: '0x6C579c44A82E997d57f33A3b6AccD40e90196920',
    WALLET_BALANCE_PROVIDER: '0x3BE5B5E817440f0CDcA46f89518BE4a67875Acb3',
    WETH_GATEWAY: '0x7B70bA67e1af805c747C6E3ae32aCe5e73f8c2A4'
  },
  initial: {
    COLLECTOR: '0x34c480f4e3fCb59e2521886950f801af88f68632',
    DEFAULT_A_TOKEN_IMPL: '0xC2769946125F117B66EB30eE0c2E69C3FE5dF4Cc',
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL: '0x7b9bF948D5925a8FCF5193C34DBEaca318028115',
    DEFAULT_STABLE_DEBT_TOKEN_IMPL: '0xB0349F079C04b953DD9704c29dc631D5cBA1a52f',
  },
};
