import { ethers } from "ethers";

export enum ChainId {
  mainnet = 1,
  ropsten = 3,
  rinkeby = 4,
  goerli = 5,
  kovan = 42,
  xdai = 100,
  polygon = 137,
  mumbai = 80001,
  avalanche = 43114,
  fuji = 43113, // avalanche test network
  arbitrum_one = 42161,
  arbitrum_rinkeby = 421611,
  fantom = 250,
  fantom_testnet = 4002,
  optimism = 10,
  optimism_kovan = 69,
  optimism_goerli = 420,
  harmony = 1666600000,
  harmony_testnet = 1666700000,
}

const RPC_PROVIDERS = {
  [ChainId.mainnet]:
    "https://eth-mainnet.gateway.pokt.network/v1/lb/62b3314e123e6f00397f19ca",
  [ChainId.mumbai]: "https://polygon-mumbai.g.alchemy.com/v2/demo",
  [ChainId.polygon]: "https://polygon-rpc.com",
  [ChainId.fuji]: "https://api.avax-test.network/ext/bc/C/rpc",
  [ChainId.avalanche]: "https://api.avax.network/ext/bc/C/rpc",
  [ChainId.arbitrum_one]: "https://arb1.arbitrum.io/rpc",
  [ChainId.harmony]: "https://api.s0.t.hmny.io",
  [ChainId.harmony_testnet]: "https://api.s0.pops.one",
  [ChainId.optimism_kovan]: "https://kovan.optimism.io",
  [ChainId.optimism]: "https://mainnet.optimism.io",
  [ChainId.fantom]: "https://rpc.ftm.tools",
  [ChainId.fantom_testnet]: "https://rpc.testnet.fantom.network",
} as const;

export interface Market {
  name: string;
  chainId: ChainId;
  addressProvider: string;
  version: number;
  testnet?: boolean;
  provider: ethers.providers.StaticJsonRpcProvider;
}

export interface Token {
  symbol: string;
  underlyingAsset: string;
  aTokenAddress: string;
  stableDebtTokenAddress: string;
  variableDebtTokenAddress: string;
}

export const markets: Market[] = [
  {
    name: "AaveV2Ethereum",
    chainId: ChainId.mainnet,
    addressProvider: "0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5",
    version: 2,
  },
  {
    name: "AaveV2EthereumAMM",
    chainId: ChainId.mainnet,
    addressProvider: "0xacc030ef66f9dfeae9cbb0cd1b25654b82cfa8d5",
    version: 2,
  },
  {
    name: "AaveV2EthereumArc",
    chainId: ChainId.mainnet,
    addressProvider: "0x6FdfafB66d39cD72CFE7984D3Bbcc76632faAb00",
    version: 2,
  },
  {
    name: "AaveV2Mumbai",
    chainId: ChainId.mumbai,
    addressProvider: "0x178113104fEcbcD7fF8669a0150721e231F0FD4B",
    version: 2,
    testnet: true,
  },
  {
    name: "AaveV3Mumbai",
    chainId: ChainId.mumbai,
    addressProvider: "0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV2Polygon",
    chainId: ChainId.polygon,
    addressProvider: "0xd05e3E715d945B59290df0ae8eF85c1BdB684744",
    version: 2,
  },
  {
    name: "AaveV3Polygon",
    chainId: ChainId.polygon,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV2Fuji",
    chainId: ChainId.fuji,
    addressProvider: "0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f",
    version: 2,
    testnet: true,
  },
  {
    name: "AaveV3Fuji",
    chainId: ChainId.fuji,
    addressProvider: "0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV2Avalanche",
    chainId: ChainId.avalanche,
    addressProvider: "0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f",
    version: 2,
  },
  {
    name: "AaveV3Avalanche",
    chainId: ChainId.avalanche,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  // seems to be a non up-to-date v3 market, being not fully compatible with v3
  // excluding it from the generator as it would make v3 markets inconsistent
  // {
  //   name: "AaveV3ArbitrumRinkeby",
  //   rpc: ARBITRUM_RINKEBY_RPC,
  //   addressProvider: "0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c",
  //   version: 3,
  //   testnet: true,
  // },
  {
    name: "AaveV3Arbitrum",
    chainId: ChainId.arbitrum_one,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3FantomTestnet",
    chainId: ChainId.fantom_testnet,
    addressProvider: "0xE339D30cBa24C70dCCb82B234589E3C83249e658",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV3Fantom",
    chainId: ChainId.fantom,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3HarmonyTestnet",
    chainId: ChainId.harmony_testnet,
    addressProvider: "0xd19443202328A66875a51560c28276868B8C61C2",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV3Harmony",
    chainId: ChainId.harmony,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3OptimismKovan",
    chainId: ChainId.optimism_kovan,
    addressProvider: "0xD15d36975A0200D11B8a8964F4F267982D2a1cFe",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV3Optimism",
    chainId: ChainId.optimism,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
].map((m) => ({
  ...m,
  // fix checksum
  provider: new ethers.providers.StaticJsonRpcProvider(
    RPC_PROVIDERS[m.chainId as keyof typeof RPC_PROVIDERS]
  ),
  addressProvider: ethers.utils.getAddress(m.addressProvider),
}));
