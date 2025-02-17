import {ChainId} from '@bgd-labs/rpc-env';
import {PoolConfig} from '../types';

export const sonicProtoV3: PoolConfig = {
  name: 'Sonic',
  chainId: ChainId.sonic,
  POOL_ADDRESSES_PROVIDER: '0x5C2e738F6E27bCE0F7558051Bf90605dD6176900',
  additionalAddresses: {
    CONFIG_ENGINE: '0xa119F84bC1b8083F5061E4cf53705cBf1065bA27',
    RISK_STEWARD: '0xAe13e4DA0952f0B8fE04E21df53716fCF799a923',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x5E5D87858592d211fdb4503F09FB2B5cf805cB51',
    UI_INCENTIVE_DATA_PROVIDER: '0xeC859AED64e87004FA724892D5aB474901825B2D',
    UI_POOL_DATA_PROVIDER: '0x9005A69fE088680827f292e8aE885Be4BE1beb2f',
    WALLET_BALANCE_PROVIDER: '0x6637Ef9c6b41Fa62d69b7E88C5Dd9eF30BbEE945',
    WETH_GATEWAY: '0x061D8e131F26512348ee5FA42e2DF1bA9d6505E9',
    // STATA_FACTORY: '0xCC29b02a414B6Bb66490edAa25d3e8E9471Fcb96'
  },
  initial: {
    COLLECTOR: '0x1aB55bBdD5DF0782BBCf73553Af93BC6B29A286B',
    DEFAULT_A_TOKEN_IMPL: '0x91FC11136d5615575a0fC5981Ab5C0C54418E2C6',
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL: '0xcb85C501B3A5e9851850d66648d69B26A4c90942'
  },
};
