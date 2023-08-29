import {RPC_PROVIDERS} from './clients';

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

export function getChainName(chainId: ChainId) {
  return RPC_PROVIDERS[chainId].chain.name;
}
