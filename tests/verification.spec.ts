import {ChainId} from '@bgd-labs/rpc-env';
import {describe, expect, it} from 'vitest';
import {CHAIN_ID_CHAIN_MAP} from '../scripts/clients';
import {flattenedAddresses, ListItem} from '../ui/src/utils/getAddresses';
import verified from './cache/verified.json';
import {writeFileSync} from 'fs';
import {zeroAddress} from 'viem';

const CHAIN_ID_API_KEY_MAP = {
  [ChainId.mainnet]: process.env.ETHERSCAN_API_KEY_MAINNET,
  [ChainId.sepolia]: process.env.ETHERSCAN_API_KEY_MAINNET,
  [ChainId.polygon]: process.env.ETHERSCAN_API_KEY_POLYGON,
  [ChainId.zkEVM]: process.env.ETHERSCAN_API_KEY_ZKEVM,
  [ChainId.arbitrum_one]: process.env.ETHERSCAN_API_KEY_ARBITRUM,
  [ChainId.optimism]: process.env.ETHERSCAN_API_KEY_OPTIMISM,
  [ChainId.scroll]: process.env.ETHERSCAN_API_KEY_SCROLL,
  [ChainId.scroll_sepolia]: process.env.ETHERSCAN_API_KEY_SCROLL,
  [ChainId.bnb]: process.env.ETHERSCAN_API_KEY_BNB,
  [ChainId.base]: process.env.ETHERSCAN_API_KEY_BASE,
  [ChainId.base_sepolia]: process.env.ETHERSCAN_API_KEY_BASE,
  [ChainId.zksync]: process.env.ETHERSCAN_API_KEY_ZKSYNC,
  [ChainId.gnosis]: process.env.ETHERSCAN_API_KEY_GNOSIS,
};

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function checkProxyVerification(item: ListItem, guid: string) {
  const params = {
    apikey: CHAIN_ID_API_KEY_MAP[item.chainId] || '',
    module: 'contract',
    action: 'checkproxyverification',
    guid,
  };
  const formattedParams = new URLSearchParams(params).toString();
  const url = `${getApiUrl(item.chainId)}?${formattedParams}`;
  try {
    const request = await fetch(url);
    const {status} = await request.json();
    if (status === '1')
      console.log(
        'successfully verified proxy. Please rerun the script in a few minutes as you need to wait till etherscan prunes its cache.',
      );
  } catch (e) {}
}

async function verifyProxy(item: ListItem) {
  const params = {
    apikey: CHAIN_ID_API_KEY_MAP[item.chainId] || '',
    module: 'contract',
    action: 'verifyproxycontract',
  };
  const formattedParams = new URLSearchParams(params).toString();
  const url = `${getApiUrl(item.chainId)}?${formattedParams}`;
  try {
    const request = await fetch(url, {
      method: 'POST',
      body: new URLSearchParams({
        address: item.value,
      }),
    });

    const {status, result} = await request.json();
    await sleep(1000);
    if (status === '1') checkProxyVerification(item, result);
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}

async function checkVerified(item: ListItem) {
  const params = {
    apikey: CHAIN_ID_API_KEY_MAP[item.chainId] || '',
    address: item.value,
    module: 'contract',
    action: 'getsourcecode',
  };

  const formattedParams = new URLSearchParams(params).toString();
  const url = `${getApiUrl(item.chainId)}?${formattedParams}`;
  try {
    const request = await fetch(url);
    const {status, result} = await request.json();
    if (status !== '1' || !result[0].ContractName) {
      // etherscan returns proxy contracts as non verified if the proxy is not manually assigned
      // therefore we try to manually assign it
      if (['S_TOKEN', 'V_TOKEN', 'A_TOKEN'].includes(item.path[item.path.length - 1])) {
        await verifyProxy(item);
      }
    }
    return {status, result};
  } catch (e) {
    console.error(e);
    return {status: '0', result: e};
  }
}

function getApiUrl(chainId: number) {
  if (chainId === ChainId.metis)
    return `https://api.routescan.io/v2/network/mainnet/evm/1088/etherscan/api`;
  return CHAIN_ID_CHAIN_MAP[chainId].blockExplorers?.default.apiUrl;
}

describe(
  'verification',
  () => {
    it('should have all contracts verified except for the known set of errors', async () => {
      const addressesToCheck = flattenedAddresses.filter(
        (item) =>
          ![ChainId.harmony, ChainId.fantom].includes(item.chainId as any) &&
          !CHAIN_ID_CHAIN_MAP[item.chainId].testnet,
      );
      const errors: {item: ListItem; error: any}[] = [];
      let newVerified = false;
      for (const item of addressesToCheck) {
        const hasBeenCheckedBefore = verified[item.chainId][item.value];
        if (!hasBeenCheckedBefore && item.value !== zeroAddress) {
          const {status, result} = (await checkVerified(item)) as {
            status: string;
            result: {ContractName: string}[];
          };
          if (status !== '1' || !result[0].ContractName) {
            errors.push({item, error: result});
          } else {
            newVerified = true;
            if (!verified[item.chainId]) verified[item.chainId] = {};
            verified[item.chainId][item.value] = {
              name: result[0].ContractName,
            };
          }
        }
      }
      if (newVerified) {
        writeFileSync('./tests/cache/verified.json', JSON.stringify(verified, null, 2), {
          encoding: 'utf-8',
        });
      }
      expect(errors).toMatchSnapshot();
    });
  },
  {timeout: 120_000},
);