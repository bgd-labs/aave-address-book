import {CHAIN_ID_CLIENT_MAP, ChainId} from '@bgd-labs/js-utils';
import {ListItem, flattenedAddresses} from './generator/getAddresses';
import {writeFileSync, readFileSync, existsSync} from 'fs';
import {Address} from 'viem';

const CHAIN_ID_API_KEY_MAP = {
  [ChainId.mainnet]: process.env.ETHERSCAN_API_KEY_MAINNET,
};

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function checkVerified(item: ListItem) {
  const params = {
    apikey: CHAIN_ID_API_KEY_MAP[ChainId.mainnet] || '',
    address: item.value,
    module: 'contract',
    action: 'getsourcecode',
  };

  const formattedParams = new URLSearchParams(params).toString();
  try {
    const request = await fetch(
      `${CHAIN_ID_CLIENT_MAP[item.chainId]?.chain?.blockExplorers?.default.apiUrl}?${formattedParams}`,
    );

    return await request.json();
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
  for (const item of flattenedAddresses.slice(0, 10)) {
    console.log(item);
    const {status, result} = await checkVerified(item);
    if (status !== '1') errors.push({item, error: result});
  }
  if (errors.length != 0) {
    console.log(errors);
    process.exit(1);
  }
}

main();
