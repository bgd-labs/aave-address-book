import {Chain, HttpTransportConfig, createClient, http} from 'viem';
import {
  mainnet,
  arbitrum,
  polygon,
  optimism,
  metis,
  base,
  baseSepolia,
  sepolia,
  bsc,
  avalanche,
  gnosis,
  polygonZkEvm,
  scroll,
  celo,
  avalancheFuji,
  optimismSepolia,
  scrollSepolia,
  arbitrumSepolia,
  // deprecated
  harmonyOne,
  fantomTestnet,
  fantom,
  zksync,
} from 'viem/chains';
import {Client} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

// @notice: fetched from alchemy private trpc api
// const data = await(await fetch('https://app-api.alchemy.com/trpc/config.getNetworkConfig')).json();
// data.result.data.reduce((acc,val) => {
//     acc[val.networkChainId] = val.kebabCaseId;
//     return acc;
// },{})
const alchemyNetworks: Record<number, string> = {
  1: 'eth-mainnet',
  3: 'eth-ropsten',
  4: 'eth-rinkeby',
  5: 'eth-goerli',
  10: 'opt-mainnet',
  42: 'eth-kovan',
  56: 'bnb-mainnet',
  69: 'opt-kovan',
  97: 'bnb-testnet',
  100: 'gnosis-mainnet',
  137: 'polygon-mainnet',
  204: 'opbnb-mainnet',
  250: 'fantom-mainnet',
  252: 'frax-mainnet',
  300: 'zksync-sepolia',
  324: 'zksync-mainnet',
  420: 'opt-goerli',
  592: 'astar-mainnet',
  747: 'flow-mainnet',
  1088: 'metis-mainnet',
  1101: 'polygonzkevm-mainnet',
  1301: 'unichain-sepolia',
  1442: 'polygonzkevm-testnet',
  1946: 'soneium-minato',
  2442: 'polygonzkevm-cardona',
  2522: 'frax-sepolia',
  4002: 'fantom-testnet',
  5611: 'opbnb-testnet',
  7000: 'zetachain-mainnet',
  7001: 'zetachain-testnet',
  8453: 'base-mainnet',
  10200: 'gnosis-chiado',
  11011: 'shape-sepolia',
  42161: 'arb-mainnet',
  42170: 'arbnova-mainnet',
  43113: 'avax-fuji',
  43114: 'avax-mainnet',
  59141: 'linea-sepolia',
  59144: 'linea-mainnet',
  80001: 'polygon-mumbai',
  80002: 'polygon-amoy',
  80084: 'berachain-bartio',
  81457: 'blast-mainnet',
  84531: 'base-goerli',
  84532: 'base-sepolia',
  421611: 'arb-rinkeby',
  421613: 'arb-goerli',
  421614: 'arb-sepolia',
  534351: 'scroll-sepolia',
  534352: 'scroll-mainnet',
  7777777: 'zora-mainnet',
  11155111: 'eth-sepolia',
  11155420: 'opt-sepolia',
  168587773: 'blast-sepolia',
  999999999: 'zora-sepolia',
};

const networkEnv: Record<number, string> = {
  [ChainId.mainnet]: 'RPC_MAINNET',
  [ChainId.optimism]: 'RPC_OPTIMISM',
  [ChainId.bnb]: 'RPC_BNB',
  [ChainId.gnosis]: 'RPC_GNOSIS',
  [ChainId.polygon]: 'RPC_POLYGON',
  [ChainId.fantom]: 'RPC_FANTOM',
  [ChainId.zkSync]: 'RPC_ZKSYNC',
  [ChainId.metis]: 'RPC_METIS',
  [ChainId.base]: 'RPC_BASE',
  [ChainId.arbitrum_one]: 'RPC_ARBITRUM',
  [ChainId.avalanche]: 'RPC_AVALANCHE',
  [ChainId.scroll]: 'RPC_SCROLL',
};

export const CHAIN_ID_CHAIN_MAP: Record<number, Chain> = {
  [ChainId.mainnet]: mainnet,
  [ChainId.sepolia]: sepolia,
  [ChainId.optimism]: optimism,
  [ChainId.optimism_sepolia]: optimismSepolia,
  [ChainId.bnb]: bsc,
  [ChainId.gnosis]: gnosis,
  [ChainId.polygon]: polygon,
  [ChainId.fantom]: fantom,
  [ChainId.fantom_testnet]: fantomTestnet,
  [ChainId.zkSync]: zksync,
  [ChainId.metis]: metis,
  [ChainId.base]: base,
  [ChainId.base_sepolia]: baseSepolia,
  [ChainId.arbitrum_one]: arbitrum,
  [ChainId.arbitrum_sepolia]: arbitrumSepolia,
  [ChainId.avalanche]: avalanche,
  [ChainId.fuji]: avalancheFuji,
  [ChainId.scroll]: scroll,
  [ChainId.scroll_sepolia]: scrollSepolia,
  [ChainId.harmony]: harmonyOne,
  [ChainId.zkEVM]: polygonZkEvm,
  [ChainId.celo]: celo,
};

/**
 * Selects a rpc based on a predefined priorization:
 * 1. env.RPC_URL_<network>
 * 2. alchemy if available
 */
function getRPCUrl(chainId: number): string | undefined {
  if (process.env[networkEnv[chainId]]) return process.env[networkEnv[chainId]];
  if (alchemyNetworks[chainId] && process.env.ALCHEMY_API_KEY)
    return `https://${alchemyNetworks[chainId]}.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`;
}

const clientCache: Record<number, Client> = {};

export function getClient(chainId: number) {
  if (!clientCache[chainId]) {
    clientCache[chainId] = createClient({
      chain: CHAIN_ID_CHAIN_MAP[chainId],
      transport: http(getRPCUrl(chainId), commonConfig),
      ...batchConfig,
    });
  }
  return clientCache[chainId];
}
