import {getAddress, createPublicClient, http, PublicClient, Hex, fallback} from 'viem';
import {
  mainnet,
  goerli,
  polygonMumbai,
  polygon,
  avalancheFuji,
  arbitrum,
  arbitrumGoerli,
  harmonyOne,
  optimism,
  optimismGoerli,
  fantom,
  fantomTestnet,
  scrollTestnet,
  scrollSepolia,
  metis,
  sepolia,
  avalanche,
  base,
} from 'viem/chains';

export enum ChainId {
  mainnet = 1,
  ropsten = 3,
  rinkeby = 4,
  goerli = 5,
  xdai = 100,
  polygon = 137,
  mumbai = 80001,
  avalanche = 43114,
  fuji = 43113, // avalanche test network
  arbitrum_one = 42161,
  arbitrum_goerli = 421613,
  fantom = 250,
  fantom_testnet = 4002,
  optimism = 10,
  optimism_goerli = 420,
  harmony = 1666600000,
  sepolia = 11155111,
  scroll_alpha = 534353,
  scroll_sepolia = 534351,
  metis = 1088,
  base = 8453,
}

const RPC_PROVIDERS = {
  [ChainId.mainnet]: createPublicClient({
    chain: mainnet,
    transport: fallback([
      http('https://eth.llamarpc.com'),
      http('https://ethereum.publicnode.com'),
      http('https://cloudflare-eth.com'),
    ]),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.goerli]: createPublicClient({
    chain: goerli,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.mumbai]: createPublicClient({
    chain: polygonMumbai,
    transport: fallback([
      http('https://endpoints.omniatech.io/v1/matic/mumbai/public'),
      http('https://polygon-mumbai-bor.publicnode.com'),
    ]),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.polygon]: createPublicClient({
    chain: polygon,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.fuji]: createPublicClient({
    chain: avalancheFuji,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.avalanche]: createPublicClient({
    chain: avalanche,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.arbitrum_one]: createPublicClient({
    chain: arbitrum,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.arbitrum_goerli]: createPublicClient({
    chain: arbitrumGoerli,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.harmony]: createPublicClient({
    chain: harmonyOne,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.optimism]: createPublicClient({
    chain: optimism,
    transport: fallback([
      http('https://mainnet.optimism.io'),
      http('https://optimism.publicnode.com'),
    ]),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.optimism_goerli]: createPublicClient({
    chain: optimismGoerli,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.fantom]: createPublicClient({
    chain: fantom,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.fantom_testnet]: createPublicClient({
    chain: fantomTestnet,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.sepolia]: createPublicClient({
    chain: sepolia,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.scroll_alpha]: createPublicClient({
    chain: scrollTestnet,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.scroll_sepolia]: createPublicClient({
    chain: scrollSepolia,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.metis]: createPublicClient({
    chain: metis,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.base]: createPublicClient({
    chain: base,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
} as const;

export interface Pool {
  name: string;
  chainId: ChainId;
  addressProvider: Hex;
  version: number;
  testnet?: boolean;
  provider: PublicClient;
  // will be inlined in js pool export
  additionalAddresses: {
    FAUCET?: Hex;
    WETH_GATEWAY?: Hex;
    REPAY_WITH_COLLATERAL_ADAPTER?: Hex;
    SWAP_COLLATERAL_ADAPTER?: Hex;
    DEBT_SWAP_ADAPTER?: Hex;
    POOL_ADDRESSES_PROVIDER_REGISTRY?: Hex;
    LISTING_ENGINE?: Hex;
    MIGRATION_HELPER?: Hex;
    UI_POOL_DATA_PROVIDER?: Hex;
    L2_ENCODER?: Hex;
    PROOF_OF_RESERVE?: Hex;
    PROOF_OF_RESERVE_AGGREGATOR?: Hex;
    DELEGATION_AWARE_A_TOKEN_IMPL_REV_1?: Hex;
    STATIC_A_TOKEN_FACTORY?: Hex;
    CAPS_PLUS_RISK_STEWARD?: Hex;
    GHO_TOKEN?: Hex;
    UI_GHO_DATA_PROVIDER?: Hex;
  };
  // will be used for pending pools where the impls can't be fetched yet
  initial?: {
    COLLECTOR?: Hex;
    DEFAULT_A_TOKEN_IMPL?: Hex;
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL?: Hex;
    DEFAULT_STABLE_DEBT_TOKEN_IMPL?: Hex;
  };
}

export interface Token {
  symbol: string;
  underlyingAsset: Hex;
  aTokenAddress: Hex;
  stableDebtTokenAddress: Hex;
  variableDebtTokenAddress: Hex;
}

export interface Misc {
  ECOSYSTEM_RESERVE: Hex;
  AAVE_ECOSYSTEM_RESERVE_CONTROLLER: Hex;
  TRANSPARENT_PROXY_FACTORY_ETHEREUM: Hex;
  PROXY_ADMIN_ETHEREUM: Hex;
  PROXY_ADMIN_ETHEREUM_LONG: Hex;
  TRANSPARENT_PROXY_FACTORY_POLYGON: Hex;
  PROXY_ADMIN_POLYGON: Hex;
  TRANSPARENT_PROXY_FACTORY_AVALANCHE: Hex;
  PROXY_ADMIN_AVALANCHE: Hex;
  TRANSPARENT_PROXY_FACTORY_OPTIMISM: Hex;
  PROXY_ADMIN_OPTIMISM: Hex;
  TRANSPARENT_PROXY_FACTORY_ARBITRUM: Hex;
  PROXY_ADMIN_ARBITRUM: Hex;
  TRANSPARENT_PROXY_FACTORY_METIS: Hex;
  PROXY_ADMIN_METIS: Hex;
}

export interface GovernanceV2 {
  GOV: Hex;
  GOV_STRATEGY: Hex;
  SHORT_EXECUTOR: Hex;
  LONG_EXECUTOR: Hex;
  ARC_TIMELOCK: Hex;
  POLYGON_BRIDGE_EXECUTOR: Hex;
  OPTIMISM_BRIDGE_EXECUTOR: Hex;
  ARBITRUM_BRIDGE_EXECUTOR: Hex;
  METIS_BRIDGE_EXECUTOR: Hex;
  BASE_BRIDGE_EXECUTOR: Hex;
  CROSSCHAIN_FORWARDER_POLYGON: Hex;
  CROSSCHAIN_FORWARDER_OPTIMISM: Hex;
  CROSSCHAIN_FORWARDER_ARBITRUM: Hex;
  CROSSCHAIN_FORWARDER_METIS: Hex;
  CROSSCHAIN_FORWARDER_BASE: Hex;
}

export const governanceV2 = Object.fromEntries(
  Object.entries({
    GOV: '0xEC568fffba86c094cf06b22134B23074DFE2252c',
    GOV_STRATEGY: '0xb7e383ef9B1E9189Fc0F71fb30af8aa14377429e',
    SHORT_EXECUTOR: '0xEE56e2B3D491590B5b31738cC34d5232F378a8D5',
    LONG_EXECUTOR: '0x79426A1c24B2978D90d7A5070a46C65B07bC4299',
    ARC_TIMELOCK: '0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218',
    POLYGON_BRIDGE_EXECUTOR: '0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772',
    OPTIMISM_BRIDGE_EXECUTOR: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
    ARBITRUM_BRIDGE_EXECUTOR: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
    METIS_BRIDGE_EXECUTOR: '0x8EC77963068474a45016938Deb95E603Ca82a029',
    BASE_BRIDGE_EXECUTOR: '0xA9F30e6ED4098e9439B2ac8aEA2d3fc26BcEbb45',
    CROSSCHAIN_FORWARDER_POLYGON: '0x158a6bC04F0828318821baE797f50B0A1299d45b',
    CROSSCHAIN_FORWARDER_OPTIMISM: '0x5f5C02875a8e9B5A26fbd09040ABCfDeb2AA6711',
    CROSSCHAIN_FORWARDER_ARBITRUM: '0xd1B3E25fD7C8AE7CADDC6F71b461b79CD4ddcFa3',
    CROSSCHAIN_FORWARDER_METIS: '0x2fE52eF191F0BE1D98459BdaD2F1d3160336C08f',
    CROSSCHAIN_FORWARDER_BASE: '0x3215225538da1546FE0DA88ee13019f402078942',
  } as GovernanceV2).map(([key, value]) => [key, getAddress(value)]),
) as unknown as GovernanceV2;

export const misc = Object.fromEntries(
  Object.entries({
    ECOSYSTEM_RESERVE: '0x25F2226B597E8F9514B3F68F00f494cF4f286491',
    AAVE_ECOSYSTEM_RESERVE_CONTROLLER: '0x3d569673dAa0575c936c7c67c4E6AedA69CC630C',
    TRANSPARENT_PROXY_FACTORY_ETHEREUM: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN_ETHEREUM: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    PROXY_ADMIN_ETHEREUM_LONG: '0x86C3FfeE349A7cFf7cA88C449717B1b133bfb517',
    TRANSPARENT_PROXY_FACTORY_POLYGON: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN_POLYGON: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    TRANSPARENT_PROXY_FACTORY_AVALANCHE: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN_AVALANCHE: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    TRANSPARENT_PROXY_FACTORY_OPTIMISM: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN_OPTIMISM: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    TRANSPARENT_PROXY_FACTORY_ARBITRUM: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
    PROXY_ADMIN_ARBITRUM: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
    TRANSPARENT_PROXY_FACTORY_METIS: '0x1dad86dC5990BCE5bFe3A150A4E0ece990d6EBcB',
    PROXY_ADMIN_METIS: '0x1CabD986cBAbDf12E00128DFf03C80ee62C4fd97',
    TRANSPARENT_PROXY_FACTORY_BASE: '0x05225Cd708bCa9253789C1374e4337a019e99D56',
    PROXY_ADMIN_BASE: '0xc85b1E333aecc99340b2320493Fe2d22b8734795',
  } as Misc).map(([key, value]) => [key, getAddress(value)]),
) as unknown as Misc;
