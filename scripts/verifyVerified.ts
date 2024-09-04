import {CHAIN_ID_CLIENT_MAP, ChainId} from '@bgd-labs/js-utils';
import {ListItem, flattenedAddresses} from './generator/getAddresses';
import {writeFileSync, readFileSync, existsSync} from 'fs';
import {Address, zeroAddress} from 'viem';

const CHAIN_ID_API_KEY_MAP = {
  [ChainId.mainnet]: process.env.ETHERSCAN_API_KEY_MAINNET,
  [ChainId.polygon]: process.env.ETHERSCAN_API_KEY_POLYGON,
  [ChainId.arbitrum_one]: process.env.ETHERSCAN_API_KEY_ARBITRUM,
  [ChainId.optimism]: process.env.ETHERSCAN_API_KEY_OPTIMISM,
  [ChainId.scroll]: process.env.ETHERSCAN_API_KEY_SCROLL,
  [ChainId.bnb]: process.env.ETHERSCAN_API_KEY_BNB,
  [ChainId.base]: process.env.ETHERSCAN_API_KEY_BASE,
  [ChainId.zkSync]: process.env.ETHERSCAN_API_KEY_ZKSYNC,
  [ChainId.gnosis]: process.env.ETHERSCAN_API_KEY_GNOSIS,
};

function getApiUrl(chainId: number) {
  if (chainId === ChainId.metis)
    return `https://api.routescan.io/v2/network/mainnet/evm/1088/etherscan/api`;
  return CHAIN_ID_CLIENT_MAP[chainId]?.chain?.blockExplorers?.default.apiUrl;
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function checkProxyVerfication(item: ListItem, guid: string) {
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
    if (status === '1') checkProxyVerfication(item, result);
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
    const response = await request.json();
    if (response.status !== '1' || !response.result[0].ContractName) console.log(url);
    return response;
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}

const cachePath = './cache/verification.json';

async function main() {
  const cache: Record<number, Record<Address, boolean>> = existsSync(cachePath)
    ? JSON.parse(readFileSync(cachePath, 'utf-8'))
    : {};

  const errors: {item: ListItem; error: any}[] = [];
  for (const item of flattenedAddresses.filter(
    (item) => ![ChainId.harmony, ChainId.fantom].includes(item.chainId as any),
  )) {
    // skip contracts for which we have checked verification before
    if (cache[item.chainId]?.[item.value]) continue;
    // skip zero addresses
    if (item.value === zeroAddress) continue;
    const {status, result} = (await checkVerified(item)) as {
      status: string;
      result: {ContractName: string}[];
    };

    if (status !== '1' || !result[0].ContractName) {
      // etherscan returns proxy contracts as non verified if the proxy is not manually assigned
      // therefore we try to manually assign it
      if (['S_TOKEN', 'V_TOKEN', 'A_TOKEN'].includes(item.path[item.path.length - 1])) {
        await verifyProxy(item);
      }
      errors.push({item, error: result});
      console.log('errors', errors.length);
    } else {
      if (!cache[item.chainId]) cache[item.chainId] = {};
      cache[item.chainId][item.value] = {
        name: result[0].ContractName,
      };
      writeFileSync(cachePath, JSON.stringify(cache, null, 2), {encoding: 'utf-8'});
    }
    await sleep(200); // rate limit on etherscan api of 5 req/s
  }
  if (errors.length != 0) {
    writeFileSync('./cache/errors.json', JSON.stringify(errors, null, 2), {encoding: 'utf-8'});
    process.exit(1);
  }
}

main();
