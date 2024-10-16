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
  zksync,
} from 'viem/chains';
import {Client} from 'viem';
import {ChainId} from '@bgd-labs/js-utils';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

// fetched from their private trpc api
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
  1: 'RPC_URL_MAINNET',
  10: 'RPC_URL_OPTIMISM',
  56: 'RPC_URL_BNB',
  100: 'RPC_URL_GNOSIS',
  137: 'RPC_URL_POLYGON',
  250: 'RPC_URL_FANTOM',
  324: 'RPC_URL_ZKSYNC',
  42161: 'RPC_URL_ARBITRUM',
  43114: 'RPC_URL_AVALANCHE',
  534352: 'RPC_URL_SCROLL',
};

export const CHAIN_ID_CHAIN_MAP: Record<number, Chain> = {
  1: mainnet,
  10: optimism,
  56: bsc,
  100: gnosis,
  137: polygon,
  250: fantom,
  324: zksync,
  42161: arbitrum,
  43114: avalanche,
  534352: scroll,
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
