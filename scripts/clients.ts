import {HttpTransportConfig, createClient, http} from 'viem';
import {Client} from 'viem';
import {ChainList, getRPCUrl, getClient as rpcEnvGetClient} from '@bgd-labs/rpc-env';

const commonConfig: HttpTransportConfig = {timeout: 30_000, batch: true};
const batchConfig = {batch: {multicall: true}};

export function getClient(chainId: number) {
  return rpcEnvGetClient(chainId, {clientConfig: batchConfig, httpConfig: commonConfig});
}
