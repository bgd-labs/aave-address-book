import {ChainId} from '../../generator/chains';
import {PoolConfig} from '../types';

export const optimismGoerliProtoV3: PoolConfig = {
  name: 'OptimismGoerli',
  chainId: ChainId.optimism_goerli,
  POOL_ADDRESSES_PROVIDER: '0xf3a4595bD9FBf129DEb80802a4785873F0ceB65c',
  additionalAddresses: {
    FAUCET: '0x387d311e47e80b498169e6fb51d3193167d89F7D',
    L2_ENCODER: '0x19cdecE64EDE475ba0EB114ff4E319d64Ef8ECCf',
    UI_INCENTIVE_DATA_PROVIDER: '0x72A9c57cD5E2Ff20450e409cF6A542f1E6c710fc',
    UI_POOL_DATA_PROVIDER: '0xD2f5680976c86ADd3978b7ad3422Ee5c7690ddb4',
    WALLET_BALANCE_PROVIDER: '0x56033E114c61183590d39BA847400F02022Ebe47',
    WETH_GATEWAY: '0xf556C102F47d806E21E8E78438E58ac06A14A29E',
  },
};

export const optimismProtoV3: PoolConfig = {
  name: 'Optimism',
  chainId: ChainId.optimism,
  POOL_ADDRESSES_PROVIDER: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
  additionalAddresses: {
    CAPS_PLUS_RISK_STEWARD: '0x5E76E98E0963EcDC6A065d1435F84065b7523f39',
    DEBT_SWAP_ADAPTER: '0xcFaE0D8c5707FCc6478D6a65fFA31efADeF8b8EC',
    L2_ENCODER: '0x9abADECD08572e0eA5aF4d47A9C7984a5AA503dC',
    CONFIG_ENGINE: '0x893411580e590D62dDBca8a703d61Cc4A8c7b2b9',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
    RATES_FACTORY: '0xDd81E6F85358292075B78fc8D5830BE8434aF8BA',
    REPAY_WITH_COLLATERAL_ADAPTER: '0xa12734e64417f61f8442E7D5132EdBFdbDDeF0fa',
    STATIC_A_TOKEN_FACTORY: '0xD9419920a9768d6EdaBbe5b93cB4B5B9F3019823',
    SWAP_COLLATERAL_ADAPTER: '0x830C5A67a0C95D69dA5fb7801Ac1773c6fB53857',
    UI_INCENTIVE_DATA_PROVIDER: '0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7',
    UI_POOL_DATA_PROVIDER: '0xbd83DdBE37fc91923d59C8c1E0bDe0CccCa332d5',
    WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
    WETH_GATEWAY: '0x76D3030728e52DEB8848d5613aBaDE88441cbc59',
    WITHDRAW_SWAP_ADAPTER: '0x78F8Bd884C3D738B74B420540659c82f392820e0',
  },
};
