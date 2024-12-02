import {HttpTransportConfig, createClient, http, custom} from 'viem';
import {Client} from 'viem';
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

export const rpcResponseCache = {};

/**
 * This client is a custom proxy which will fetch data once and store it forever
 * @param chainId
 * @returns
 */
export function getClient(chainId: number) {
  if (!clientCache[chainId]) {
    const rpcURL = getRPCUrl(chainId as any, {alchemyKey: process.env.ALCHEMY_API_KEY});
    const transport = http(rpcURL, commonConfig);
    const client = createClient({
      chain: ChainList[chainId],
      transport: transport,
      ...batchConfig,
    });

    const proxy = new Proxy(client, {
      get(target, p, receiver) {
        const origMethod = Reflect.get(target, p, receiver);

        if (typeof origMethod === 'function')
          return async function (...args) {
            const cache = rpcResponseCache[chainId]?.[JSON.stringify(args)];
            if (cache) {
              console.log('cache hit');
              return cache;
            }

            const result = await origMethod.apply(this, args);
            set(rpcResponseCache, [chainId, JSON.stringify(args)], result);
            return result;
          };
        return Reflect.get(target, p, receiver);
      },
    });

    clientCache[chainId] = proxy;
  }
  return clientCache[chainId];
}
