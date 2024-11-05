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
import {ChainId, getRPCUrl} from '@bgd-labs/rpc-env';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

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
  [ChainId.zksync]: zksync,
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

const clientCache: Record<number, Client> = {};

export function getClient(chainId: number) {
  if (!clientCache[chainId]) {
    let rpcURL;
    try {
      rpcURL = getRPCUrl(chainId as any);
    } catch (e) {
      // if we cannot find an rpc in env we'll pass undefined
      // which will select the most reliable public rpc
    }
    clientCache[chainId] = createClient({
      chain: CHAIN_ID_CHAIN_MAP[chainId],
      transport: http(rpcURL, commonConfig),
      ...batchConfig,
    });
  }
  return clientCache[chainId];
}
