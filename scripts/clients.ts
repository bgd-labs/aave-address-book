import {HttpTransportConfig, createClient, http} from 'viem';
import {Client} from 'viem';
import {ChainList, getRPCUrl} from '@bgd-labs/rpc-env';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

const clientCache: Record<number, Client> = {};

export function getClient(chainId: number) {
  if (!clientCache[chainId]) {
    const rpcURL = getRPCUrl(chainId as any, {alchemyKey: process.env.ALCHEMY_API_KEY});

    clientCache[chainId] = createClient({
      chain: ChainList[chainId],
      transport: http(rpcURL, commonConfig),
      ...batchConfig,
    });
  }
  return clientCache[chainId];
}
