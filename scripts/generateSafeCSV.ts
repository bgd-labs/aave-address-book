import {writeFileSync} from 'fs';
import {flattenedAddresses} from '../ui/src/utils/getAddresses';
import {CHAIN_ID_CHAIN_MAP} from './clients';

const addresses = flattenedAddresses.filter((item) => !CHAIN_ID_CHAIN_MAP[item.chainId].testnet);

const safe = `address,name,chainId\n${addresses
  .sort((a, b) => a.chainId! - b.chainId!)
  .map((address) => `${address.value},${address.path.join(' ')},${address.chainId}`)
  .join('\n')}`;

writeFileSync(`./safe.csv`, safe);
