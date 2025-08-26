import {ChainId, ChainList, getExplorer, getSourceCode} from '@bgd-labs/toolbox';
import {describe, expect, it} from 'vitest';
import {flattenedAddresses, ListItem} from '../ui/src/utils/getAddresses';
import verified from './cache/verified.json';
import {writeFileSync} from 'fs';
import {Address, Hex, PublicClient, zeroAddress} from 'viem';
import {getCode} from 'viem/actions';
import {getClient} from '../scripts/clients';

const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY as string;

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function checkProxyVerification(item: ListItem, guid: string) {
  const params = {
    chainId: String(item.chainId),
    apikey: ETHERSCAN_API_KEY,
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
    chainId: String(item.chainId),
    apikey: ETHERSCAN_API_KEY,
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
    await sleep(200);
    if (status === '1') checkProxyVerification(item, result);
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}

async function checkVerified(item: ListItem) {
  try {
    const source = await getSourceCode({
      chainId: item.chainId,
      apiKey: process.env.ETHERSCAN_API_KEY,
      address: item.value as Address,
      apiUrl: process.env.EXPLORER_PROXY,
    });
    if (!source.ContractName) {
      // etherscan returns proxy contracts as non verified if the proxy is not manually assigned
      // therefore we try to manually assign it
      if (['S_TOKEN', 'V_TOKEN', 'A_TOKEN'].includes(item.path[item.path.length - 1])) {
        await verifyProxy(item);
      }
    }
    return {status: '1', result: source};
  } catch (e) {
    console.error(e);
    return {status: '0', result: e};
  }
}

function getApiUrl(chainId: number) {
  if (chainId === ChainId.soneium) return `https://soneium.blockscout.com/api`;
  if (chainId === ChainId.ink) return `https://explorer.inkonchain.com/api/`;
  return getExplorer(chainId).api;
}

const knownErrors = {
  1: {
    '0xD01ab9a6577E1D84F142e44D49380e23A340387d': true, // very old contracts we know will never be verified
  },
  1101: {
    '0xF1c11BE0b4466728DDb7991A0Ac5265646ec9672': true, // very old contracts we know will never be verified
  },
  137: {
    '0x645654D59A5226CBab969b1f5431aA47CBf64ab8': true, // very old contracts we know will never be verified
  },
  43114: {
    '0x11979886A6dBAE27D7a72c49fCF3F23240D647bF': true, // very old contracts we know will never be verified
  },
  5000: {
    '0x14816fC7f443A9C834d30eeA64daD20C4f56fBCD': true, // gnosis safe, not sure why its not verified on etherscan (it is on routescan)
  },
};

describe('verification', {timeout: 500_000}, () => {
  it('should have all contracts verified except for the known set of errors', async () => {
    const addressesToCheck = flattenedAddresses.filter(
      (item) =>
        ![ChainId.harmony, ChainId.fantom].includes(item.chainId as any) &&
        !ChainList[item.chainId].testnet &&
        !knownErrors[item.chainId]?.[item.value] &&
        (!verified[item.chainId]?.[item.value] ||
          verified[item.chainId]?.[item.value] === zeroAddress),
    );
    const errors: {item: ListItem}[] = [];
    // unique set of addresses checked on this iteration
    // used to prevent double checking the same address
    const checked = new Set<string>();
    for (const item of addressesToCheck) {
      const hasBeenCheckedBefore = verified[item.chainId]?.[item.value];
      if (!hasBeenCheckedBefore && item.value !== zeroAddress) {
        const key = `${item.chainId}-${item.value}`;
        if (checked.has(key)) continue;
        checked.add(key);
        const client = getClient(item.chainId) as PublicClient;
        const hasCode = await getCode(client, {address: item.value as Hex});
        if (hasCode) {
          const {status, result} = (await checkVerified(item)) as {
            status: string;
            result: {ContractName: string};
          };
          if (status !== '1' || !result.ContractName) {
            errors.push({item});
            console.log(item.value, result);
          } else {
            if (!verified[item.chainId]) verified[item.chainId] = {};
            verified[item.chainId][item.value] = {
              name: result.ContractName,
            };
            writeFileSync('./tests/cache/verified.json', JSON.stringify(verified, null, 2), {
              encoding: 'utf-8',
            });
          }
        }
      }
    }
    expect(errors).toMatchSnapshot();
  });
});
