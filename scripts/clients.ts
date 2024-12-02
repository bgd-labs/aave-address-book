import {HttpTransportConfig, createClient, Client, http} from 'viem';
import {ChainList, getRPCUrl} from '@bgd-labs/rpc-env';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

const clientCache: Record<number, Client> = {};

export function getClient(chainId: number) {
  if (!clientCache[chainId]) {
    const rpcURL = getRPCUrl(chainId as any, {alchemyKey: process.env.ALCHEMY_API_KEY});
    const transport = http(rpcURL, commonConfig);
    const client = createClient({
      chain: ChainList[chainId],
      transport: transport,
      ...batchConfig,
    });

    clientCache[chainId] = client;
  }
  return clientCache[chainId];
}
