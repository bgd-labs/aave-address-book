import { ethers } from "ethers";

const RINKEBY_RPC = "https://rinkeby-light.eth.linkpool.io/";
const MAINNET_RPC = "https://rpc.flashbots.net/";
const MUMBAI_RPC = "https://polygon-mumbai.g.alchemy.com/v2/demo";
const POLYGON_RPC = "https://polygon-rpc.com";
const FUJI_RPC = "https://api.avax-test.network/ext/bc/C/rpc";
const AVALANCHE_RPC = "https://api.avax.network/ext/bc/C/rpc";
const ARBITRUM_RINKEBY_RPC = "https://rinkeby.arbitrum.io/rpc";
const ARBITRUM_RPC = "https://arb1.arbitrum.io/rpc";
const HARMONY_RPC = "https://api.s0.t.hmny.io";
const HARMONY_TESTNET_RPC = "https://api.s0.pops.one";
const OPTIMISM_KOVAN = "https://kovan.optimism.io";
const OPTIMISM_RPC = "https://mainnet.optimism.io";
const FANTOM_TESTNET_RPC = "https://rpc.testnet.fantom.network";
const FANTOM_RPC = "https://rpc.ftm.tools";

export interface Market {
  name: string;
  rpc: string;
  addressProvider: string;
  version: number;
  testnet?: boolean;
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
    name: "AaveV3Rinkeby",
    rpc: RINKEBY_RPC,
    addressProvider: "0xBA6378f1c1D046e9EB0F538560BA7558546edF3C",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV2Ethereum",
    rpc: MAINNET_RPC,
    addressProvider: "0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5",
    version: 2,
  },
  {
    name: "AaveV2EthereumAMM",
    rpc: MAINNET_RPC,
    addressProvider: "0xacc030ef66f9dfeae9cbb0cd1b25654b82cfa8d5",
    version: 2,
  },
  {
    name: "AaveV2Mumbai",
    rpc: MUMBAI_RPC,
    addressProvider: "0x178113104fEcbcD7fF8669a0150721e231F0FD4B",
    version: 2,
    testnet: true,
  },
  {
    name: "AaveV3Mumbai",
    rpc: MUMBAI_RPC,
    addressProvider: "0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV2Polygon",
    rpc: POLYGON_RPC,
    addressProvider: "0xd05e3E715d945B59290df0ae8eF85c1BdB684744",
    version: 2,
  },
  {
    name: "AaveV3Polygon",
    rpc: POLYGON_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV2Fuji",
    rpc: FUJI_RPC,
    addressProvider: "0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f",
    version: 2,
    testnet: true,
  },
  {
    name: "AaveV3Fuji",
    rpc: FUJI_RPC,
    addressProvider: "0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV2Avalanche",
    rpc: AVALANCHE_RPC,
    addressProvider: "0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f",
    version: 2,
  },
  {
    name: "AaveV3Avalanche",
    rpc: AVALANCHE_RPC,
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
    rpc: ARBITRUM_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3FantomTestnet",
    rpc: FANTOM_TESTNET_RPC,
    addressProvider: "0xE339D30cBa24C70dCCb82B234589E3C83249e658",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV3Fantom",
    rpc: FANTOM_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3HarmonyTestnet",
    rpc: HARMONY_TESTNET_RPC,
    addressProvider: "0xd19443202328A66875a51560c28276868B8C61C2",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV3Harmony",
    rpc: HARMONY_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
  {
    name: "AaveV3OptimismKovan",
    rpc: OPTIMISM_KOVAN,
    addressProvider: "0xD15d36975A0200D11B8a8964F4F267982D2a1cFe",
    version: 3,
    testnet: true,
  },
  {
    name: "AaveV3Optimism",
    rpc: OPTIMISM_RPC,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
  },
].map((m) => ({
  ...m,
  // fix checksum
  addressProvider: ethers.utils.getAddress(m.addressProvider),
}));
