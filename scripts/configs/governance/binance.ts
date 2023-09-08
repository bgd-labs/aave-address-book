import {GovernanceConfig} from '../types';
import {ChainId} from '../../generator/chains';

export const governanceConfigBase: GovernanceConfig = {
  name: 'Binance',
  CHAIN_ID: ChainId.binance,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x9d33ee6543C9b2C8c183b8fb58fB089266cffA19',
  },
};
