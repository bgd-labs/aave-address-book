import {CHAIN_ID_CLIENT_MAP} from '@bgd-labs/js-utils';
import {writeFileSync} from 'fs';
import {flattenedAddresses} from './generator/getAddresses';

const addresses = flattenedAddresses.filter(
  (item) => !CHAIN_ID_CLIENT_MAP[item.chainId].chain?.testnet,
);

const safe = `address,name,chainId\n${addresses
  .sort((a, b) => a.chainId! - b.chainId!)
  .map((address) => `${address.value},${address.path.join(' ')},${address.chainId}`)
  .join('\n')}`;

writeFileSync(`./safe.csv`, safe);
