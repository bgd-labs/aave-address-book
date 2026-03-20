import {ChainId} from '@bgd-labs/toolbox';
import {PoolV4Config} from '../types';

export const ethereumDevnetV4Pool: PoolV4Config = {
  name: 'EthereumDevnet',
  chainId: ChainId.mainnet,
  deployJson: 'scripts/configs/v4/devnet.json',
};
