import {HttpTransportConfig} from 'viem';
import {getClient as rpcEnvGetClient} from '@bgd-labs/toolbox';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

export function getClient(chainId: number) {
  return rpcEnvGetClient(chainId, {
    clientConfig: batchConfig,
    httpConfig: commonConfig,
    providerConfig: {
      alchemyKey: process.env.ALCHEMY_API_KEY,
      quicknodeEndpointName: process.env.QUICKNODE_ENDPOINT_NAME,
      quicknodeToken: process.env.QUICKNODE_TOKEN,
    },
  });
}
