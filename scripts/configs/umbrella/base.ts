import {ChainId} from '@bgd-labs/rpc-env';
import {UmbrellaConfig} from '../types';

export const umbrellaBaseSepoliaConfig: UmbrellaConfig = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  UMBRELLA: '0x5AC6C5C70934939d7Ad4aAB253aFD760Ad5E5313',
  additionalAddresses: {
    UMBRELLA_BATCH_HELPER: '0xcDfb3f2d924b02A78a51F43BC34610dC62ADCEC3',
    DATA_AGGREGATION_HELPER: '0x62858E5b1aAa5d2DdEEeB57e99E73fFAcC8154f6'
  }
};