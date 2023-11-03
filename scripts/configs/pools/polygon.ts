import {ChainId} from '../../generator/chains';
import {PoolConfig} from '../types';

export const mumbaiProtoV2: PoolConfig = {
  name: 'Mumbai',
  chainId: ChainId.mumbai,
  POOL_ADDRESSES_PROVIDER: '0x178113104fEcbcD7fF8669a0150721e231F0FD4B',
  additionalAddresses: {
    FAUCET: '0x0b3C23243106A69449e79C14c58BB49E358f9B10',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0xE6ef11C967898F9525D550014FDEdCFAB63536B5',
    UI_INCENTIVE_DATA_PROVIDER: '0x070a7D8F4d7A7A87452C5BaBaB3158e08411907E',
    UI_POOL_DATA_PROVIDER: '0xb36a91b1deF63B603896290F6a888c774328519A',
    WALLET_BALANCE_PROVIDER: '0xEe7c0172c200e12AFEa3C34837052ec52F3f367A',
    WETH_GATEWAY: '0xee9eE614Ad26963bEc1Bec0D2c92879ae1F209fA',
  },
};

export const mumbaiProtoV3: PoolConfig = {
  name: 'Mumbai',
  chainId: ChainId.mumbai,
  POOL_ADDRESSES_PROVIDER: '0x4CeDCB57Af02293231BAA9D39354D6BFDFD251e0',
  additionalAddresses: {
    FAUCET: '0x2c95d10bA4BBEc79e562e8B3f48687751808C925',
    UI_INCENTIVE_DATA_PROVIDER: '0x322bCff7b69F832B1a1F56E6BC600C9229CFb907',
    UI_POOL_DATA_PROVIDER: '0xD64dDe119f11C88850FD596BE11CE398CC5893e6',
    WALLET_BALANCE_PROVIDER: '0xD8A70FC58BC069CFE6529EBF0c1Db067f2b5347E',
    WETH_GATEWAY: '0x8dA9412AbB78db20d0B496573D9066C474eA21B8',
  },
};

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
    WETH_GATEWAY: '0xAeBF56223F044a73A513FAD7E148A9075227eD9b',
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
    CONFIG_ENGINE: '0xfFD6F13c9574bedb3f4E131e9C4320186AF83c1D',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
    RATES_FACTORY: '0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896',
    REPAY_WITH_COLLATERAL_ADAPTER: '0xE3090207A2de94A856EA10a7e1Bd36dD6145712B',
    STATIC_A_TOKEN_FACTORY: '0x2B218C73f63820CE86655d16A79C333E24fEB0BE',
    SWAP_COLLATERAL_ADAPTER: '0xC4aff49fCeD8ac1D818a6DCAB063f9f97E66ec5E',
    UI_INCENTIVE_DATA_PROVIDER: '0x874313A46e4957D29FAAC43BF5Eb2B144894f557',
    UI_POOL_DATA_PROVIDER: '0xC69728f11E9E6127733751c8410432913123acf1',
    WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
    WETH_GATEWAY: '0x1e4b7A6b903680eab0c5dAbcb8fD429cD2a9598c',
    WITHDRAW_SWAP_ADAPTER: '0x78F8Bd884C3D738B74B420540659c82f392820e0',
  },
};
