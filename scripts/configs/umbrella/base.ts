import {ChainId} from '@bgd-labs/toolbox';
import {UmbrellaConfig} from '../types';

export const umbrellaBaseSepoliaConfig: UmbrellaConfig = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  UMBRELLA: '0x5AC6C5C70934939d7Ad4aAB253aFD760Ad5E5313',
  additionalAddresses: {
    UMBRELLA_BATCH_HELPER: '0xcDfb3f2d924b02A78a51F43BC34610dC62ADCEC3',
    DATA_AGGREGATION_HELPER: '0xC4b9D54bA13156aD07A501d8C4D3f8B4d1827bE2'
  }
};