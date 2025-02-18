import {ChainId, ChainList} from '@bgd-labs/rpc-env';
import {describe, expect, it} from 'vitest';
import {flattenedAddresses, ListItem} from '../ui/src/utils/getAddresses';
import verified from './cache/verified.json';
import {writeFileSync} from 'fs';
import {Hex, PublicClient, zeroAddress} from 'viem';
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
    await sleep(1000);
    if (status === '1') checkProxyVerification(item, result);
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}

async function checkVerified(item: ListItem) {
  const params = {
    chainId: String(item.chainId),
    apikey: ETHERSCAN_API_KEY,
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
  return `https://api.etherscan.io/v2/api`;
}

const knownErrors = {
  1: {
    '0xD01ab9a6577E1D84F142e44D49380e23A340387d': true, // very old contracts we know will never be verified
    '0xb51EDdDD8c47856D81C8681EA71404Cec93E92c6': true, // etherscan issue - not detecting that it's verified
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
    '0x1283C5015B1Fb5616FA3aCb0C18e6879a02869cB': true, // etherscan issue - not detecting that it's verified
    '0xF089f77173A3009A98c45f49D547BF714A7B1e01': true, // etherscan issue - not detecting that it's verified
  },
  146: {
    '0x0846C28Dd54DEA4Fd7Fb31bcc5EB81673D68c695': true, // etherscan issue - not detecting that it's verified
  },
};

describe(
  'verification',
  () => {
    it('should have all contracts verified except for the known set of errors', async () => {
      const addressesToCheck = flattenedAddresses.filter(
        (item) =>
          ![ChainId.harmony, ChainId.fantom].includes(item.chainId as any) &&
          !ChainList[item.chainId].testnet &&
          !knownErrors[item.chainId]?.[item.value],
      );
      const errors: {item: ListItem}[] = [];
      let newVerified = false;
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
              result: {ContractName: string}[];
            };
            await sleep(300);
            if (status !== '1' || !result[0].ContractName) {
              errors.push({item});
              console.log(item.value, result);
            } else {
              newVerified = true;
              if (!verified[item.chainId]) verified[item.chainId] = {};
              verified[item.chainId][item.value] = {
                name: result[0].ContractName,
              };
            }
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
