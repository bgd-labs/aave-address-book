import {HttpTransportConfig, createClient, Client, http} from 'viem';
import {ChainList, getRPCUrl} from '@bgd-labs/rpc-env';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

const clientCache: Record<number, Client> = {};

const set = (obj, path, value) => {
  // Regex explained: https://regexr.com/58j0k
  const pathArray = Array.isArray(path) ? path : path.match(/([^[.\]])+/g);

  pathArray.reduce((acc, key, i) => {
    if (acc[key] === undefined) acc[key] = {};
    if (i === pathArray.length - 1) acc[key] = value;
    return acc[key];
  }, obj);
};

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
