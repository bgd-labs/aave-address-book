import {ethers} from 'ethers';

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
}

const RPC_PROVIDERS = {
  [ChainId.mainnet]: 'https://rpc.flashbots.net',
  [ChainId.goerli]: 'https://eth-goerli.public.blastapi.io',
  [ChainId.mumbai]: 'https://polygon-testnet.public.blastapi.io',
  [ChainId.polygon]: 'https://polygon-rpc.com',
  [ChainId.fuji]: 'https://api.avax-test.network/ext/bc/C/rpc',
  [ChainId.avalanche]: 'https://api.avax.network/ext/bc/C/rpc',
  [ChainId.arbitrum_one]: 'https://arb1.arbitrum.io/rpc',
  [ChainId.arbitrum_goerli]: 'https://goerli-rollup.arbitrum.io/rpc',
  [ChainId.harmony]: 'https://api.s0.t.hmny.io',
  [ChainId.optimism]: 'https://1rpc.io/op',
  [ChainId.optimism_goerli]: 'https://goerli.optimism.io',
  [ChainId.fantom]: 'https://rpc.ftm.tools',
  [ChainId.fantom_testnet]: 'https://rpc.ankr.com/fantom_testnet',
  [ChainId.sepolia]: 'https://rpc.sepolia.org/',
} as const;

export interface Pool {
  name: string;
  chainId: ChainId;
  addressProvider: string;
  version: number;
  testnet?: boolean;
  provider: ethers.providers.StaticJsonRpcProvider;
  // will be inlined in js pool export
  additionalAddresses: {
    FAUCET?: string;
    WETH_GATEWAY?: string;
    REPAY_WITH_COLLATERAL_ADAPTER?: string;
    SWAP_COLLATERAL_ADAPTER?: string;
    POOL_ADDRESSES_PROVIDER_REGISTRY?: string;
    LISTING_ENGINE?: string;
    MIGRATION_HELPER?: string;
    UI_POOL_DATA_PROVIDER?: string;
    L2_ENCODER?: string;
    PROOF_OF_RESERVE?: string;
    PROOF_OF_RESERVE_AGGREGATOR?: string;
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
    name: 'AaveV2Ethereum',
    chainId: ChainId.mainnet,
    addressProvider: '0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5',
    version: 2,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x52D306e36E3B6B02c153d0266ff0f85d18BCD413',
      WETH_GATEWAY: '0xEFFC18fC3b7eb8E676dac549E0c693ad50D1Ce31',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x80Aca0C645fEdABaa20fd2Bf0Daf57885A309FE6',
      SWAP_COLLATERAL_ADAPTER: '0x135896DE8421be2ec868E0b811006171D9df802A',
      MIGRATION_HELPER: '0xb748952c7bc638f31775245964707bcc5ddfabfc',
      WALLET_BALANCE_PROVIDER: '0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922',
      UI_POOL_DATA_PROVIDER: '0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A',
      UI_INCENTIVE_DATA_PROVIDER: '0xD01ab9a6577E1D84F142e44D49380e23A340387d',
    },
  },
  {
    name: 'AaveV3Ethereum',
    chainId: ChainId.mainnet,
    addressProvider: '0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0xbaA999AC55EAce41CcAE355c77809e68Bb345170',
      WETH_GATEWAY: '0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C',
      RATES_FACTORY: '0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x1809f186D680f239420B56948C58F8DbbCdf1E18',
      SWAP_COLLATERAL_ADAPTER: '0x872fBcb1B582e8Cd0D0DD4327fBFa0B4C2730995',
      LISTING_ENGINE: '0xC51e6E38d406F98049622Ca54a6096a23826B426',
      WALLET_BALANCE_PROVIDER: '0xC7be5307ba715ce89b152f3Df0658295b3dbA8E2',
      UI_POOL_DATA_PROVIDER: '0x91c0eA31b49B69Ea18607702c5d9aC360bf3dE7d',
      UI_INCENTIVE_DATA_PROVIDER: '0x162A7AC02f547ad796CA549f757e2b8d1D9b10a6',
    },
  },
  {
    name: 'AaveV2EthereumAMM',
    chainId: ChainId.mainnet,
    addressProvider: '0xacc030ef66f9dfeae9cbb0cd1b25654b82cfa8d5',
    version: 2,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x52D306e36E3B6B02c153d0266ff0f85d18BCD413',
      WETH_GATEWAY: '0x1C4a4e31231F71Fc34867D034a9E68f6fC798249',
      WALLET_BALANCE_PROVIDER: '0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922',
      UI_POOL_DATA_PROVIDER: '0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A',
      UI_INCENTIVE_DATA_PROVIDER: '0xD01ab9a6577E1D84F142e44D49380e23A340387d',
    },
  },
  {
    name: 'AaveV2EthereumArc',
    chainId: ChainId.mainnet,
    addressProvider: '0x6FdfafB66d39cD72CFE7984D3Bbcc76632faAb00',
    version: 2,
    additionalAddresses: {
      PERMISSION_MANAGER: '0xF4a1F5fEA79C3609514A417425971FadC10eCfBE',
    },
  },
  {
    name: 'AaveV2Goerli',
    chainId: ChainId.goerli,
    addressProvider: '0x5E52dEc931FFb32f609681B8438A51c675cc232d',
    version: 2,
    testnet: true,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x3465454D658019f8A0eABD3bC61d2d1Dd3a0735F',
      WETH_GATEWAY: '0x3bd3a20Ac9Ff1dda1D99C0dFCE6D65C4960B3627',
      WALLET_BALANCE_PROVIDER: '0xf1E4A6E7FA07421FD5139Ba0848290A27e22db7f',
      UI_POOL_DATA_PROVIDER: '0xaaa2872d1F7f5ceb630Cb736BcA34Ff1e121992b',
      UI_INCENTIVE_DATA_PROVIDER: '0xA2E05bE2090b3658A264bdf1C39387f5Dba367Ec',
      FAUCET: '0x681860075529352da2C94082Eb66c59dF958e89C',
    },
  },
  {
    name: 'AaveV3Sepolia',
    chainId: ChainId.sepolia,
    addressProvider: '0x0496275d34753A48320CA58103d5220d394FF77F',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0xe70cDC67C91d5519DD4682cA162E40480773255a',
      FAUCET: '0x1f885520b7BD528E46b390040F12E753Dce43004',
      WALLET_BALANCE_PROVIDER: '0x4f04218ECC7D2756f84836D2DC267293504cAbCc',
      UI_POOL_DATA_PROVIDER: '0xe38c93180a6CE4173d88793c0671AD1Dd417c7d8',
      UI_INCENTIVE_DATA_PROVIDER: '0x7cE1062e0688BC3D7699987A38bba84353F69881',
    },
  },
  {
    name: 'AaveV3Goerli',
    chainId: ChainId.goerli,
    addressProvider: '0xC911B590248d127aD18546B186cC6B324e99F02c',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0x2A498323aCaD2971a8b1936fD7540596dC9BBacD',
      FAUCET: '0xA70D8aD6d26931d0188c642A66de3B6202cDc5FA',
      WALLET_BALANCE_PROVIDER: '0xe0bb4593f74B804B9aBd9a2Ec6C71663cEE64E29',
      UI_POOL_DATA_PROVIDER: '0xb00A75686293Fea5DA122E8361f6815A0B0AF48E',
      UI_INCENTIVE_DATA_PROVIDER: '0xf4Ce3624c8D047aF8b069D044f00bF6774B4dEc0',
    },
  },
  {
    name: 'AaveV3GoerliGho',
    chainId: ChainId.goerli,
    addressProvider: '0x4dd5ab8Fb385F2e12aDe435ba7AFA812F1d364D0',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0x9c402E3b0D123323F0FCed781b8184Ec7E02Dd31',
      FAUCET: '0x1265305F033156bbF8Ba54fE45DD5685BEc4Cc44',
      WALLET_BALANCE_PROVIDER: '0x03C8d0c46834921c4468C15A03E5d76Ae5CA3133',
      UI_POOL_DATA_PROVIDER: '0x3De59b6901e7Ad0A19621D49C5b52cC9a4977e52',
      UI_INCENTIVE_DATA_PROVIDER: '0xF67B25977cEFf3563BF7F24A531D6CEAe6870a9d',
    },
  },
  {
    name: 'AaveV2Mumbai',
    chainId: ChainId.mumbai,
    addressProvider: '0x178113104fEcbcD7fF8669a0150721e231F0FD4B',
    version: 2,
    testnet: true,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0xE6ef11C967898F9525D550014FDEdCFAB63536B5',
      WETH_GATEWAY: '0xee9eE614Ad26963bEc1Bec0D2c92879ae1F209fA',
      FAUCET: '0x0b3C23243106A69449e79C14c58BB49E358f9B10',
      WALLET_BALANCE_PROVIDER: '0xEe7c0172c200e12AFEa3C34837052ec52F3f367A',
      UI_POOL_DATA_PROVIDER: '0xb36a91b1deF63B603896290F6a888c774328519A',
      UI_INCENTIVE_DATA_PROVIDER: '0x070a7D8F4d7A7A87452C5BaBaB3158e08411907E',
    },
  },
  {
    name: 'AaveV3Mumbai',
    chainId: ChainId.mumbai,
    addressProvider: '0xeb7A892BB04A8f836bDEeBbf60897A7Af1Bf5d7F',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0x2a58E9bbb5434FdA7FF78051a4B82cb0EF669C17',
      FAUCET: '0xB00b414F9E45ba73B44fFC3E3Ce64a806552cD02',
      WALLET_BALANCE_PROVIDER: '0xdbaeF5FC90a979426E2cE5C3F0125430d0e2023e',
      UI_POOL_DATA_PROVIDER: '0x928d9A76705aA6e4a6650BFb7E7912e413Fe7341',
      UI_INCENTIVE_DATA_PROVIDER: '0xf7Dd602B3Cf90B2A20FC0F84E0419BeE104BdF16',
    },
  },
  {
    name: 'AaveV2Polygon',
    chainId: ChainId.polygon,
    addressProvider: '0xd05e3E715d945B59290df0ae8eF85c1BdB684744',
    version: 2,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x3ac4e9aa29940770aeC38fe853a4bbabb2dA9C19',
      WETH_GATEWAY: '0xAeBF56223F044a73A513FAD7E148A9075227eD9b',
      SWAP_COLLATERAL_ADAPTER: '0x35784a624D4FfBC3594f4d16fA3801FeF063241c',
      REPAY_WITH_COLLATERAL_ADAPTER: '0xE84cF064a0a65290Ae5673b500699f3753063936',
      MIGRATION_HELPER: '0x3db487975aB1728DB5787b798866c2021B24ec52',
      WALLET_BALANCE_PROVIDER: '0x34aa032bC416Cf2CdC45c0C8f065b1F19463D43e',
      UI_POOL_DATA_PROVIDER: '0x204f2Eb81D996729829debC819f7992DCEEfE7b1',
      UI_INCENTIVE_DATA_PROVIDER: '0x645654D59A5226CBab969b1f5431aA47CBf64ab8',
    },
  },
  {
    name: 'AaveV3Polygon',
    chainId: ChainId.polygon,
    addressProvider: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
      WETH_GATEWAY: '0x1e4b7A6b903680eab0c5dAbcb8fD429cD2a9598c',
      RATES_FACTORY: '0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x10D2fA27166d94894d850a9a851EE06870F14b09',
      SWAP_COLLATERAL_ADAPTER: '0x6a4b2b595d369c963493Fc704CF48e42FAd8260b',
      LISTING_ENGINE: '0xE202F2fc4b6A37Ba53cfD15bE42a762A645FCA07',
      WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
      UI_POOL_DATA_PROVIDER: '0xC69728f11E9E6127733751c8410432913123acf1',
      UI_INCENTIVE_DATA_PROVIDER: '0x874313A46e4957D29FAAC43BF5Eb2B144894f557',
    },
  },
  {
    name: 'AaveV2Fuji',
    chainId: ChainId.fuji,
    addressProvider: '0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f',
    version: 2,
    testnet: true,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x04A6Fa9999E3C807Ee7b6Ca58eFAb93713d405BF',
      WETH_GATEWAY: '0x1648C14DbB6ccdd5846969cE23DeEC4C66a03335',
      FAUCET: '0x90E5BAc5A98fff59617080848959f44eACB4Cd7B',
      WALLET_BALANCE_PROVIDER: '0x3f5A507B33260a3869878B31FB90F04F451d28e3',
      UI_POOL_DATA_PROVIDER: '0x88b4013f8C50e61ab027Cc253ab9a50663e2dF45',
      UI_INCENTIVE_DATA_PROVIDER: '0x9842E5B7b7C6cEDfB1952a388e050582Ff95645b',
    },
  },
  {
    name: 'AaveV3Fuji',
    chainId: ChainId.fuji,
    addressProvider: '0x220c6A7D868FC38ECB47d5E69b99e9906300286A',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0x8f57153F18b7273f9A814b93b31Cb3f9b035e7C2',
      FAUCET: '0x66B3b92Fb1b2635504Cd5f878E26ABD8826aAf1E',
      WALLET_BALANCE_PROVIDER: '0xd2495B9f9F78092858e09e294Ed5c17Dbc5fCfA8',
      UI_POOL_DATA_PROVIDER: '0x08D07a855306400c8e499664f7f5247046274C77',
      UI_INCENTIVE_DATA_PROVIDER: '0xD764968BdAAdD2120F0E48a16fB29a6c73c13340',
    },
  },
  {
    name: 'AaveV2Avalanche',
    chainId: ChainId.avalanche,
    addressProvider: '0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f',
    version: 2,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x4235E22d9C3f28DCDA82b58276cb6370B01265C2',
      WETH_GATEWAY: '0xC27d4dBefc2C0CE57916a699971b58a3BD9C7d5b',
      SWAP_COLLATERAL_ADAPTER: '0x2EcF2a2e74B19Aab2a62312167aFF4B78E93B6C5',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x935b362EE3E1f342cc48118C528AAbee5118F6e6',
      MIGRATION_HELPER: '0xf50a080aC535e531EC33cC05b227E910De2fb1fA',
      WALLET_BALANCE_PROVIDER: '0x73e4898a1Bfa9f710B6A6AB516403A6299e01fc6',
      UI_POOL_DATA_PROVIDER: '0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A',
      UI_INCENTIVE_DATA_PROVIDER: '0x11979886A6dBAE27D7a72c49fCF3F23240D647bF',
      PROOF_OF_RESERVE: '0x7fc3FCb14eF04A48Bb0c12f0c39CD74C249c37d8',
      PROOF_OF_RESERVE_AGGREGATOR: '0x80f2c02224a2E548FC67c0bF705eBFA825dd5439',
    },
  },
  {
    name: 'AaveV3Avalanche',
    chainId: ChainId.avalanche,
    addressProvider: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
      WETH_GATEWAY: '0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7',
      RATES_FACTORY: '0xDd81E6F85358292075B78fc8D5830BE8434aF8BA',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x4fB0Ba43a5415f312cf5FA10d16Ff6dbA697d9aA',
      SWAP_COLLATERAL_ADAPTER: '0x00e39085C877328619FDB2a47d995c516a5fA869',
      LISTING_ENGINE: '0x49581e5575F49263f556b91daf8fb41D7854D94B',
      WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
      UI_POOL_DATA_PROVIDER: '0xF71DBe0FAEF1473ffC607d4c555dfF0aEaDb878d',
      UI_INCENTIVE_DATA_PROVIDER: '0x265d414f80b0fca9505710e6F16dB4b67555D365',
      PROOF_OF_RESERVE: '0xab22988D93d5F942fC6B6c6Ea285744809D1d9Cc',
      PROOF_OF_RESERVE_AGGREGATOR: '0x80f2c02224a2E548FC67c0bF705eBFA825dd5439',
    },
  },
  {
    name: 'AaveV3Arbitrum',
    chainId: ChainId.arbitrum_one,
    addressProvider: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
      WETH_GATEWAY: '0xB5Ee21786D28c5Ba61661550879475976B707099',
      SWAP_COLLATERAL_ADAPTER: '0xb20bd14259089e63d1f49d8d887ABA783Ce5dAc2',
      RATES_FACTORY: '0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896',
      REPAY_WITH_COLLATERAL_ADAPTER: '0xB0526BFb4047aE1147DC7caAF3F1653904C2D568',
      LISTING_ENGINE: '0x0EfdfC1A940DE4E7E6acC9Bb801481f81B17fd20',
      WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
      UI_POOL_DATA_PROVIDER: '0x145dE30c929a065582da84Cf96F88460dB9745A7',
      UI_INCENTIVE_DATA_PROVIDER: '0xDA67AF3403555Ce0AE3ffC22fDb7354458277358',
      L2_ENCODER: '0x9abADECD08572e0eA5aF4d47A9C7984a5AA503dC',
    },
  },
  {
    name: 'AaveV3ArbitrumGoerli',
    chainId: ChainId.arbitrum_goerli,
    addressProvider: '0x4EEE0BB72C2717310318f27628B3c8a708E4951C',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0xBCca2fc5F30A65cE2155d739364f3fc8F57E6999',
      FAUCET: '0x0E0effeEFD42C108288b0EcDDc901222a4149e08',
      WALLET_BALANCE_PROVIDER: '0x39fDBFDBF1127F31F485a1228D44010F5130cCAC',
      UI_POOL_DATA_PROVIDER: '0x583F04c0C4BDE3D7706e939F3Ea890Be9A20A5CF',
      UI_INCENTIVE_DATA_PROVIDER: '0xB9107870a2e22b9cd4B51ED5483212Cb9eAE0329',
      L2_ENCODER: '0xE8BA4db946a310A1Aca92571A53D3bdE834B5409',
    },
  },
  {
    name: 'AaveV3FantomTestnet',
    chainId: ChainId.fantom_testnet,
    addressProvider: '0xC809bea009Ca8DAA680f6A1c4Ca020D550210736',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0x87770f04Bbece8092d777860907798138825f303',
      FAUCET: '0x77523cB4402d241e324Bcf1EcEa91C4f63033B1b',
      WALLET_BALANCE_PROVIDER: '0x4E2e1F992A2ba1137fB6e1FcfbEdcaC95cA788e5',
      UI_POOL_DATA_PROVIDER: '0x9a00043F98941DD4e02E1c7e78676df64F5e37a6',
      UI_INCENTIVE_DATA_PROVIDER: '0xFBBdDFfFFcFBD55a6DF325d2be47077875Ef9eB9',
    },
  },
  {
    name: 'AaveV3Fantom',
    chainId: ChainId.fantom,
    addressProvider: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
      WETH_GATEWAY: '0x1DcDA4de2Bf6c7AD9a34788D22aE6b7d55016e1f',
      SWAP_COLLATERAL_ADAPTER: '0xE387c6053CE8EC9f8C3fa5cE085Af73114a695d3',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x1408401B2A7E28cB747b3e258D0831Fc926bAC51',
      WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
      UI_POOL_DATA_PROVIDER: '0xddf65434502E459C22263BE2ed7cF0f1FaFD44c0',
      UI_INCENTIVE_DATA_PROVIDER: '0x67Da261c14fd94cE7fDd77a0A8476E5b244089A9',
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
    name: 'AaveV3Harmony',
    chainId: ChainId.harmony,
    addressProvider: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
      WETH_GATEWAY: '0xE387c6053CE8EC9f8C3fa5cE085Af73114a695d3',
      WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
      UI_POOL_DATA_PROVIDER: '0x1DcDA4de2Bf6c7AD9a34788D22aE6b7d55016e1f',
      UI_INCENTIVE_DATA_PROVIDER: '0xf7a60467aBb8A3240A0382b22E1B03c7d4F59Da5',
    },
  },
  {
    name: 'AaveV3Optimism',
    chainId: ChainId.optimism,
    addressProvider: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
    version: 3,
    additionalAddresses: {
      POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
      WETH_GATEWAY: '0x76D3030728e52DEB8848d5613aBaDE88441cbc59',
      SWAP_COLLATERAL_ADAPTER: '0xBC2Ff189e0349Ca73D9b78c172FC2B40025abE2a',
      RATES_FACTORY: '0xDd81E6F85358292075B78fc8D5830BE8434aF8BA',
      REPAY_WITH_COLLATERAL_ADAPTER: '0x66d340EB9D3dCe0f78e813E2F991B7CE54a1a28c',
      LISTING_ENGINE: '0x7A9A9c14B35E58ffa1cC84aB421acE0FdcD289E3',
      WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
      UI_POOL_DATA_PROVIDER: '0xbd83DdBE37fc91923d59C8c1E0bDe0CccCa332d5',
      UI_INCENTIVE_DATA_PROVIDER: '0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7',
      L2_ENCODER: '0x9abADECD08572e0eA5aF4d47A9C7984a5AA503dC',
    },
  },
  {
    name: 'AaveV3OptimismGoerli',
    chainId: ChainId.optimism_goerli,
    addressProvider: '0x0b8FAe5f9Bf5a1a5867FB5b39fF4C028b1C2ebA9',
    version: 3,
    testnet: true,
    additionalAddresses: {
      WETH_GATEWAY: '0x6f7f2440006221F893c587b88f01afc42B6F8d2e',
      FAUCET: '0x777A5810352302A2D6d79d5B7323237c467845d9',
      WALLET_BALANCE_PROVIDER: '0xb463057Eb60E1575e2a69aa17C63CCd2F3161a5f',
      UI_POOL_DATA_PROVIDER: '0x9277eFbB991536a98a1aA8b735E9D26d887104C1',
      UI_INCENTIVE_DATA_PROVIDER: '0x4157398c5abB5211F51F5B551E3e240c5568dbD4',
      L2_ENCODER: '0x14AA09449fac437b5c0110614be2C08610e38f62',
    },
  },
].map((m) => ({
  ...m,
  provider: new ethers.providers.StaticJsonRpcProvider(
    RPC_PROVIDERS[m.chainId as keyof typeof RPC_PROVIDERS],
    m.chainId
  ),
  rpc: RPC_PROVIDERS[m.chainId as keyof typeof RPC_PROVIDERS],
  // fix checksums
  addressProvider: ethers.utils.getAddress(m.addressProvider),
  additionalAddresses: Object.keys(m.additionalAddresses).reduce((acc, key) => {
    acc[key] = ethers.utils.getAddress(
      m.additionalAddresses[key as keyof Pool['additionalAddresses']] as string
    );
    return acc;
  }, {} as {[key: string]: string}) as Pool['additionalAddresses'],
}));
