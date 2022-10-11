import { ethers } from "ethers";

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
}

const RPC_PROVIDERS = {
  [ChainId.mainnet]: "https://rpc.flashbots.net",
  [ChainId.goerli]: "https://eth-goerli.public.blastapi.io",
  [ChainId.mumbai]: "https://polygon-mumbai.g.alchemy.com/v2/demo",
  [ChainId.polygon]: "https://polygon-rpc.com",
  [ChainId.fuji]: "https://api.avax-test.network/ext/bc/C/rpc",
  [ChainId.avalanche]: "https://api.avax.network/ext/bc/C/rpc",
  [ChainId.arbitrum_one]: "https://arb1.arbitrum.io/rpc",
  [ChainId.arbitrum_goerli]: "https://goerli-rollup.arbitrum.io/rpc",
  [ChainId.harmony]: "https://api.s0.t.hmny.io",
  [ChainId.optimism]: "https://mainnet.optimism.io",
  [ChainId.optimism_goerli]: "https://goerli.optimism.io",
  [ChainId.fantom]: "https://rpc.ftm.tools",
  [ChainId.fantom_testnet]: "https://rpc.testnet.fantom.network",
} as const;

export interface Pool {
  name: string;
  chainId: ChainId;
  addressProvider: string;
  version: number;
  testnet?: boolean;
  provider: ethers.providers.StaticJsonRpcProvider;
  // will be inlined in js pool export
  additionalAddresses?: {
    FAUCET?: string;
    WETH_GATEWAY?: string;
    REPAY_WITH_COLLATERAL_ADAPTER?: string;
    SWAP_COLLATERAL_ADAPTER?: string;
  };
}

export interface Token {
  symbol: string;
  underlyingAsset: string;
  aTokenAddress: string;
  stableDebtTokenAddress: string;
  variableDebtTokenAddress: string;
}

export const pools: Pool[] = [
  {
    name: "AaveV2Ethereum",
    chainId: ChainId.mainnet,
    addressProvider: "0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5",
    version: 2,
    additionalAddresses: {
      WETH_GATEWAY: "0xEFFC18fC3b7eb8E676dac549E0c693ad50D1Ce31",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0x80Aca0C645fEdABaa20fd2Bf0Daf57885A309FE6",
      SWAP_COLLATERAL_ADAPTER: "0x135896DE8421be2ec868E0b811006171D9df802A",
    },
  },
  {
    name: "AaveV2EthereumAMM",
    chainId: ChainId.mainnet,
    addressProvider: "0xacc030ef66f9dfeae9cbb0cd1b25654b82cfa8d5",
    version: 2,
    additionalAddresses: {
      WETH_GATEWAY: "0x1C4a4e31231F71Fc34867D034a9E68f6fC798249",
      WALLET_BALANCE_PROVIDER: "0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922",
      UI_POOL_DATA_PROVIDER: "0x30375522F67a6308630d49A694ca1491fA2D3BC6",
    },
  },
  {
    name: "AaveV2EthereumArc",
    chainId: ChainId.mainnet,
    addressProvider: "0x6FdfafB66d39cD72CFE7984D3Bbcc76632faAb00",
    version: 2,
  },
  {
    name: "AaveV2Goerli",
    chainId: ChainId.goerli,
    addressProvider: "0x5E52dEc931FFb32f609681B8438A51c675cc232d",
    version: 2,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0x3bd3a20Ac9Ff1dda1D99C0dFCE6D65C4960B3627",
      FAUCET: "0x681860075529352da2C94082Eb66c59dF958e89C",
    },
  },
  {
    name: "AaveV3Goerli",
    chainId: ChainId.goerli,
    addressProvider: "0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D",
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0xd5B55D3Ed89FDa19124ceB5baB620328287b915d",
      FAUCET: "0x1ca525Cd5Cb77DB5Fa9cBbA02A0824e283469DBe",
    },
  },
  {
    name: "AaveV2Mumbai",
    chainId: ChainId.mumbai,
    addressProvider: "0x178113104fEcbcD7fF8669a0150721e231F0FD4B",
    version: 2,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0xee9eE614Ad26963bEc1Bec0D2c92879ae1F209fA",
      FAUCET: "0x0b3C23243106A69449e79C14c58BB49E358f9B10",
    },
  },
  {
    name: "AaveV3Mumbai",
    chainId: ChainId.mumbai,
    addressProvider: "0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6",
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0x2a58E9bbb5434FdA7FF78051a4B82cb0EF669C17",
      FAUCET: "0xc1eB89DA925cc2Ae8B36818d26E12DDF8F8601b0",
    },
  },
  {
    name: "AaveV2Polygon",
    chainId: ChainId.polygon,
    addressProvider: "0xd05e3E715d945B59290df0ae8eF85c1BdB684744",
    version: 2,
    additionalAddresses: {
      WETH_GATEWAY: "0xAeBF56223F044a73A513FAD7E148A9075227eD9b",
      SWAP_COLLATERAL_ADAPTER: "0x35784a624D4FfBC3594f4d16fA3801FeF063241c",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0xE84cF064a0a65290Ae5673b500699f3753063936",
    },
  },
  {
    name: "AaveV3Polygon",
    chainId: ChainId.polygon,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
    additionalAddresses: {
      WETH_GATEWAY: "0x1e4b7A6b903680eab0c5dAbcb8fD429cD2a9598c",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0xA125561fca253f19eA93970534Bb0364ea74187a",
      SWAP_COLLATERAL_ADAPTER: "0x301F221bc732907E2da2dbBFaA8F8F6847c170c3",
    },
  },
  {
    name: "AaveV2Fuji",
    chainId: ChainId.fuji,
    addressProvider: "0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f",
    version: 2,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0x1648C14DbB6ccdd5846969cE23DeEC4C66a03335",
      FAUCET: "0x90E5BAc5A98fff59617080848959f44eACB4Cd7B",
    },
  },
  {
    name: "AaveV3Fuji",
    chainId: ChainId.fuji,
    addressProvider: "0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29",
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0x8f57153F18b7273f9A814b93b31Cb3f9b035e7C2",
      FAUCET: "0x127277bF2F5fA186bfC6b3a0ca00baefB5472d3a",
    },
  },
  {
    name: "AaveV2Avalanche",
    chainId: ChainId.avalanche,
    addressProvider: "0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f",
    version: 2,
    additionalAddresses: {
      WETH_GATEWAY: "0xC27d4dBefc2C0CE57916a699971b58a3BD9C7d5b",
      SWAP_COLLATERAL_ADAPTER: "0x2EcF2a2e74B19Aab2a62312167aFF4B78E93B6C5",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0x935b362EE3E1f342cc48118C528AAbee5118F6e6",
    },
  },
  {
    name: "AaveV3Avalanche",
    chainId: ChainId.avalanche,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
    additionalAddresses: {
      WETH_GATEWAY: "0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0x8a743090e9759E758d15a4CFd18408fb6332c625",
      SWAP_COLLATERAL_ADAPTER: "0xF7fC20D9D1D8DFE55F5F2c3180272a5747dD327F",
    },
  },
  {
    name: "AaveV3Arbitrum",
    chainId: ChainId.arbitrum_one,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
    additionalAddresses: {
      WETH_GATEWAY: "0xB5Ee21786D28c5Ba61661550879475976B707099",
      SWAP_COLLATERAL_ADAPTER: "0xAE9f94BD98eC2831a1330e0418bE0fDb5C95C2B9",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0x32FdC26aFFA1eB331263Bcdd59F2e46eCbCC2E24",
    },
  },
  {
    name: "AaveV3ArbitrumGoerli",
    chainId: ChainId.arbitrum_goerli,
    addressProvider: "0xF8aa90E66B8BAe13f2e4aDe6104abAb8eeDaBfdc",
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0xBCca2fc5F30A65cE2155d739364f3fc8F57E6999",
      FAUCET: "0x98256500C9f1CE77e4C925b7bbF1588515E34422",
    },
  },
  {
    name: "AaveV3FantomTestnet",
    chainId: ChainId.fantom_testnet,
    addressProvider: "0xE339D30cBa24C70dCCb82B234589E3C83249e658",
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0x87770f04Bbece8092d777860907798138825f303",
      FAUCET: "0x02D538e56A729C535F83b2DA20Ddf9AD7281FE6c",
    },
  },
  {
    name: "AaveV3Fantom",
    chainId: ChainId.fantom,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
    additionalAddresses: {
      WETH_GATEWAY: "0x1DcDA4de2Bf6c7AD9a34788D22aE6b7d55016e1f",
      SWAP_COLLATERAL_ADAPTER: "0xe387c6053ce8ec9f8c3fa5ce085af73114a695d3",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0x1408401B2A7E28cB747b3e258D0831Fc926bAC51",
    },
  },
  // RPC highly unreliable
  // {
  //   name: "AaveV3HarmonyTestnet",
  //   chainId: ChainId.harmony_testnet,
  //   addressProvider: "0xd19443202328A66875a51560c28276868B8C61C2",
  //   version: 3,
  //   testnet: true,
  // },
  {
    name: "AaveV3Harmony",
    chainId: ChainId.harmony,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
    additionalAddresses: {
      WETH_GATEWAY: "0xE387c6053CE8EC9f8C3fa5cE085Af73114a695d3",
    },
  },
  {
    name: "AaveV3Optimism",
    chainId: ChainId.optimism,
    addressProvider: "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb",
    version: 3,
    additionalAddresses: {
      WETH_GATEWAY: "0x76D3030728e52DEB8848d5613aBaDE88441cbc59",
      SWAP_COLLATERAL_ADAPTER: "0xC7524B08101dBe695d7ad671a332760b5d967Cbd",
      REPAY_WITH_COLLATERAL_ADAPTER:
        "0x70371a494f73A8Df658C5cd29E2C1601787e1009",
    },
  },
  {
    name: "AaveV3OptimismGoerli",
    chainId: ChainId.optimism_goerli,
    addressProvider: "0x74a328ED938160D702378Daeb7aB2504714B4E4b",
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: "0x6f7f2440006221F893c587b88f01afc42B6F8d2e",
      FAUCET: "0xC52eA1F19C22E5a3725105BC0cf4988614e84D98",
    },
  },
].map((m) => ({
  ...m,
  // fix checksum
  provider: new ethers.providers.StaticJsonRpcProvider(
    RPC_PROVIDERS[m.chainId as keyof typeof RPC_PROVIDERS],
    m.chainId
  ),
  rpc: RPC_PROVIDERS[m.chainId as keyof typeof RPC_PROVIDERS],
  addressProvider: ethers.utils.getAddress(m.addressProvider),
}));
