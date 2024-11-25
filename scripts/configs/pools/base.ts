import {ChainId} from '@bgd-labs/rpc-env';
import {PoolConfig} from '../types';

export const baseProtoV3: PoolConfig = {
  name: 'Base',
  chainId: ChainId.base,
  POOL_ADDRESSES_PROVIDER: '0xe20fCBdBfFC4Dd138cE8b2E6FBb6CB49777ad64D',
  additionalAddresses: {
    CAPS_PLUS_RISK_STEWARD: '0x12DEB4025b79f2B43f6aeF079F9D77C3f9a67bb6',
    RISK_STEWARD: '0xD3DE4b3571744EB77946d65aBF01408902E92c4E',
    FREEZING_STEWARD: '0x4A4c73d563395ad827511F70097d4Ef82E653805',
    DEBT_SWAP_ADAPTER: '0xb12e82DF057BF16ecFa89D7D089dc7E5C1Dc057B',
    WITHDRAW_SWAP_ADAPTER: '0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9',
    SWAP_COLLATERAL_ADAPTER: '0x2E549104c516b8657A7D888494DfbAbD7C70b464',
    REPAY_WITH_COLLATERAL_ADAPTER: '0x63dfa7c09Dc2Ff4030d6B8Dc2ce6262BF898C8A4',
    STATIC_A_TOKEN_FACTORY: '0x940F9a5d5F9ED264990D0eaee1F3DD60B4Cb9A22',
    STATIC_A_TOKEN_ORACLE: '0xe63eAf6DAb1045689BD3a332bC596FfcF54A5C88',
    CONFIG_ENGINE: '0xD828E29E2268f56309dDbbAB697ae85DCEb43B9d',
    L2_ENCODER: '0x39e97c588B2907Fb67F44fea256Ae3BA064207C5',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x2f6571d3Eb9a4e350C68C36bCD2afe39530078E2',
    UI_INCENTIVE_DATA_PROVIDER: '0x91e04cf78e53aebe609e8a7f2003e7eecd743f2b',
    UI_POOL_DATA_PROVIDER: '0x68100bd5345ea474d93577127c11f39ff8463e93',
    WALLET_BALANCE_PROVIDER: '0x5779b29B0a34577d927E8D511B595ef9abbFAE82',
    WETH_GATEWAY: '0x729b3EA8C005AbC58c9150fb57Ec161296F06766',
  },
};

export const baseSepoliaProtoV3: PoolConfig = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  POOL_ADDRESSES_PROVIDER: '0x150E9a8b83b731B9218a5633F1E804BC82508A46',
  additionalAddresses: {
    STATA_FACTORY: '0xAE252DA024783d1813C890d82642bbED120c3093',
    CONFIG_ENGINE: '0x3d2ee1AB8C3a597cDf80273C684dE0036481bE3a',
    L2_ENCODER: '0x0ffE481FBF0AE2282A5E1f701fab266aF487A97D',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x5A6c2685b9dd22705203C99d7Fc30AE53C4c7513',
    UI_INCENTIVE_DATA_PROVIDER: '0xb0633e01310a09C1Ee71a96c057DcF9c13fd6F62',
    // UI_POOL_DATA_PROVIDER: '0x2D2F3e3884e112e555A9Ae213B9781Ca8aFE3b88',
    WALLET_BALANCE_PROVIDER: '0xdc5D225Df17df184d11015B91C4A10cd7834e2aC',
    WETH_GATEWAY: '0xd5DDE725b0A2dE43fBDb4E488A7fdA389210d461',
    UMBRELLA: '0xcBF4fF4FF25a031419fe211A49Ff27B7a7c90dA5',
  },
  initial: {
    COLLECTOR: '0x67F521ca716dD9413fd2D2AfdEbEE9285289d2cB',
    DEFAULT_A_TOKEN_IMPL: '0xA9E3fFb25C369e44862DD3e87Be4420abb879965',
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL: '0x95eeA7A0b16C8ee3A923D3F5ebe6d77C0332084c',
    DEFAULT_STABLE_DEBT_TOKEN_IMPL: '0x4dF950Ff1352B22dA739c33C35C6f0c81B5d9d19',
  },
};

export const baseSepoliaLidoProtoV3: PoolConfig = {
  name: 'BaseSepoliaLido',
  chainId: ChainId.base_sepolia,
  POOL_ADDRESSES_PROVIDER: '0xc08746B8A3bE6ebbB1a8C0b3e7474EB4A0d6F9fb',
  additionalAddresses: {
    STATA_FACTORY: '0x949addAD066F276c216B9892ae4a19D39fA394E1',
    CONFIG_ENGINE: '0x39471096B7EE44d50ba01b978a06d88D164446e3',
    L2_ENCODER: '0x88BA56c5e38536378B17376945f0670F66964714',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0xed20622f29362aeAa2B2e8833a65b30c2B83A0DC',
    UI_INCENTIVE_DATA_PROVIDER: '0x1A706064675d226ABeFA50124e68a422d9FE777a',
    UI_POOL_DATA_PROVIDER: '0xB177501db055d357587Ab973f8D7748588A8A8B5',
    WALLET_BALANCE_PROVIDER: '0x29e4a5A618845250383dCd33DD0a5A4223c26Acd',
    WETH_GATEWAY: '0x85c10e659FcEB9319248d88f82E5e0c8cb0Bc000',
  },
};
