import {createPublicClient, fallback, http} from 'viem';
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
  bsc,
  gnosis,
} from 'viem/chains';
import {ChainId} from './chains';

export const RPC_PROVIDERS = {
  [ChainId.mainnet]: createPublicClient({
    chain: mainnet,
    transport: fallback([
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
    transport: http('https://ethereum-sepolia.publicnode.com'),
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
  [ChainId.bnb]: createPublicClient({
    chain: bsc,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
  [ChainId.gnosis]: createPublicClient({
    chain: gnosis,
    transport: http(),
    batch: {
      multicall: true,
    },
  }),
} as const;
