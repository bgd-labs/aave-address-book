import {HttpTransportConfig, createClient, http} from 'viem';
import {
  mainnet,
  arbitrum,
  polygon,
  optimism,
  metis,
  base,
  baseSepolia,
  sepolia,
  goerli,
  bsc,
  avalanche,
  gnosis,
  polygonZkEvm,
  scroll,
  celo,
  zkSync,
  avalancheFuji,
  polygonMumbai,
  arbitrumGoerli,
  optimismGoerli,
  optimismSepolia,
  scrollSepolia,
  arbitrumSepolia,
  // deprecated
  harmonyOne,
  fantomTestnet,
  fantom,
} from 'viem/chains';
import {Client} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

export const mainnetClient = createClient({
  chain: mainnet,
  transport: http(process.env.RPC_MAINNET, commonConfig),
  ...batchConfig,
});

export const arbitrumClient = createClient({
  chain: arbitrum,
  transport: http(process.env.RPC_ARBITRUM, commonConfig),
  ...batchConfig,
});

export const polygonClient = createClient({
  chain: polygon,
  transport: http(process.env.RPC_POLYGON, commonConfig),
  ...batchConfig,
});

export const optimismClient = createClient({
  chain: optimism,
  transport: http(process.env.RPC_OPTIMISM, commonConfig),
  ...batchConfig,
});

export const metisClient = createClient({
  chain: metis,
  transport: http(process.env.RPC_METIS, commonConfig),
  ...batchConfig,
});

export const baseClient = createClient({
  chain: base,
  transport: http(process.env.RPC_BASE, commonConfig),
  ...batchConfig,
});

export const bnbClient = createClient({
  chain: bsc,
  transport: http(process.env.RPC_BNB, commonConfig),
  ...batchConfig,
});

export const avalancheClient = createClient({
  chain: avalanche,
  transport: http(process.env.RPC_AVALANCHE, commonConfig),
  ...batchConfig,
});

export const gnosisClient = createClient({
  chain: gnosis,
  transport: http(process.env.RPC_GNOSIS, commonConfig),
  ...batchConfig,
});

export const scrollClient = createClient({
  chain: scroll,
  transport: http(process.env.RPC_SCROLL, commonConfig),
  ...batchConfig,
});

export const zkEVMClient = createClient({
  chain: polygonZkEvm,
  transport: http(process.env.RPC_ZKEVM, commonConfig),
  ...batchConfig,
});

export const celoClient = createClient({
  chain: celo,
  transport: http(process.env.RPC_CELO, commonConfig),
  ...batchConfig,
});

export const zkSyncClient = createClient({
  chain: zkSync,
  transport: http(process.env.RPC_ZKSYNC, commonConfig),
  ...batchConfig,
});

// testnets
export const fujiClient = createClient({
  chain: avalancheFuji,
  transport: http(process.env.RPC_FUJI, commonConfig),
  ...batchConfig,
});

export const mumbaiClient = createClient({
  chain: polygonMumbai,
  transport: http(process.env.RPC_MUMBAI, commonConfig),
  ...batchConfig,
});

export const sepoliaClient = createClient({
  chain: sepolia,
  transport: http(process.env.RPC_SEPOLIA, commonConfig),
  ...batchConfig,
});

export const goerliClient = createClient({
  chain: goerli,
  transport: http(process.env.RPC_GOERLI, commonConfig),
  ...batchConfig,
});

export const arbitrumGoerliClient = createClient({
  chain: arbitrumGoerli,
  transport: http(process.env.RPC_ARBITRUM_GOERLI, commonConfig),
  ...batchConfig,
});

export const arbitrumSepoliaClient = createClient({
  chain: arbitrumSepolia,
  transport: http(process.env.RPC_ARBITRUM_SEPOLIA, commonConfig),
  ...batchConfig,
});

export const optimismGoerliClient = createClient({
  chain: optimismGoerli,
  transport: http(process.env.RPC_OPTIMISM_GOERLI, commonConfig),
  ...batchConfig,
});

export const optimismSepoliaClient = createClient({
  chain: optimismSepolia,
  transport: http(process.env.RPC_OPTIMISM_SEPOLIA, commonConfig),
  ...batchConfig,
});

export const scrollSepoliaClient = createClient({
  chain: scrollSepolia,
  transport: http(process.env.RPC_SCROLL_SEPOLIA, commonConfig),
  ...batchConfig,
});

export const baseSepoliaClient = createClient({
  chain: baseSepolia,
  transport: http(process.env.RPC_BASE_SEPOLIA, commonConfig),
  ...batchConfig,
});

// deprecated

export const fantomTestnetClient = createClient({
  chain: fantomTestnet,
  transport: http(process.env.RPC_FANTOM_TESTNET, commonConfig),
  ...batchConfig,
});

export const fantomClient = createClient({
  chain: fantomTestnet,
  transport: http(process.env.RPC_FANTOM, commonConfig),
  ...batchConfig,
});

export const harmonyClient = createClient({
  chain: harmonyOne,
  transport: http(process.env.RPC_HARMONY, commonConfig),
  ...batchConfig,
});

export const CHAIN_ID_CLIENT_MAP: Record<number, Client> = {
  [ChainId.mainnet]: mainnetClient,
  [ChainId.arbitrum_one]: arbitrumClient,
  [ChainId.arbitrum_goerli]: arbitrumGoerliClient,
  [ChainId.arbitrum_sepolia]: arbitrumSepoliaClient,
  [ChainId.polygon]: polygonClient,
  [ChainId.optimism]: optimismClient,
  [ChainId.optimism_goerli]: optimismGoerliClient,
  [ChainId.optimism_sepolia]: optimismSepoliaClient,
  [ChainId.metis]: metisClient,
  [ChainId.base]: baseClient,
  [ChainId.base_sepolia]: baseSepoliaClient,
  [ChainId.sepolia]: sepoliaClient,
  [ChainId.goerli]: goerliClient,
  [ChainId.bnb]: bnbClient,
  [ChainId.avalanche]: avalancheClient,
  [ChainId.gnosis]: gnosisClient,
  [ChainId.scroll]: scrollClient,
  [ChainId.scroll_sepolia]: scrollSepoliaClient,
  [ChainId.zkEVM]: zkEVMClient,
  [ChainId.celo]: celoClient,
  [ChainId.zkSync]: zkSyncClient,
  [ChainId.fuji]: fujiClient,
  [ChainId.mumbai]: mumbaiClient,
  // deprecated
  [ChainId.harmony]: harmonyClient,
  [ChainId.fantom]: fantomClient,
  [ChainId.fantom_testnet]: fantomTestnetClient,
} as const;
