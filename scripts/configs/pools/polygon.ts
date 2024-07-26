import {ChainId} from '@bgd-labs/js-utils';
import {PoolConfig} from '../types';

export const polygonProtoV2: PoolConfig = {
  name: 'Polygon',
  chainId: ChainId.polygon,
  POOL_ADDRESSES_PROVIDER: '0xd05e3E715d945B59290df0ae8eF85c1BdB684744',
  additionalAddresses: {
    DEBT_SWAP_ADAPTER: '0x1E623A311948b531B07B6EA7CC34a9A2bCADADd0',
    CONFIG_ENGINE: '0x9eCed0293e7B73CFf4a2b4F9C82aAc8346158bd9',
    MIGRATION_HELPER: '0x3db487975aB1728DB5787b798866c2021B24ec52',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x3ac4e9aa29940770aeC38fe853a4bbabb2dA9C19',
    RATES_FACTORY: '0xD05003a24A17d9117B11eC04cF9743b050779c08',
    REPAY_WITH_COLLATERAL_ADAPTER: '0xE84cF064a0a65290Ae5673b500699f3753063936',
    SWAP_COLLATERAL_ADAPTER: '0x35784a624D4FfBC3594f4d16fA3801FeF063241c',
    UI_INCENTIVE_DATA_PROVIDER: '0x645654D59A5226CBab969b1f5431aA47CBf64ab8',
    UI_POOL_DATA_PROVIDER: '0x204f2Eb81D996729829debC819f7992DCEEfE7b1',
    WALLET_BALANCE_PROVIDER: '0x34aa032bC416Cf2CdC45c0C8f065b1F19463D43e',
    WETH_GATEWAY: '0xf1e6d4347105138B51E2bacA9A22fA228309ebB1',
  },
};

export const polygonProtoV3: PoolConfig = {
  name: 'Polygon',
  chainId: ChainId.polygon,
  POOL_ADDRESSES_PROVIDER: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
  additionalAddresses: {
    CAPS_PLUS_RISK_STEWARD: '0xc5de989E0D1BF605d19478Fdd32Aa827a10b464f',
    FREEZING_STEWARD: '0xa7b40ed4dfAC9255EA9Dd218A3874f380D9FbBEB',
    DEBT_SWAP_ADAPTER: '0xb58Fd91558fa213D97Ac94C97F831c7289278084',
    CONFIG_ENGINE: '0xAF0C901489790c35D9cef02CFA11123009E81e2a',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
    REPAY_WITH_COLLATERAL_ADAPTER: '0xE3090207A2de94A856EA10a7e1Bd36dD6145712B',
    STATIC_A_TOKEN_FACTORY: '0x397202AB0b4E7C954ac0c493c00749C517210953',
    SWAP_COLLATERAL_ADAPTER: '0xC4aff49fCeD8ac1D818a6DCAB063f9f97E66ec5E',
    UI_INCENTIVE_DATA_PROVIDER: '0x874313A46e4957D29FAAC43BF5Eb2B144894f557',
    UI_POOL_DATA_PROVIDER: '0x5598bbfa2f4fe8151f45bba0a3ede1b54b51a0a9',
    WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
    WETH_GATEWAY: '0xC1E320966c485ebF2A0A2A6d3c0Dc860A156eB1B',
    WITHDRAW_SWAP_ADAPTER: '0x78F8Bd884C3D738B74B420540659c82f392820e0',
  },
};
