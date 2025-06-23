import { ChainId } from '@bgd-labs/toolbox';
import { UmbrellaConfig } from '../types';

export const umbrellaBaseSepoliaConfig: UmbrellaConfig = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  UMBRELLA: '0x5AC6C5C70934939d7Ad4aAB253aFD760Ad5E5313',
  additionalAddresses: {
    UMBRELLA_BATCH_HELPER: '0xcDfb3f2d924b02A78a51F43BC34610dC62ADCEC3',
    DATA_AGGREGATION_HELPER: '0x139FAF11d09605d840cBd1b1FBE4Adf5FEac70a2',
    PERMISSIONED_PAYLOADS_CONTROLLER: '0x9F9c7F84C043Fe3366E8567352FB6ab352222b7d',
  }
};