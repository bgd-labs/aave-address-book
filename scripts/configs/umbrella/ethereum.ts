import {ChainId} from '@bgd-labs/toolbox';
import {UmbrellaConfig} from '../types';

export const umbrellaMainnetConfig: UmbrellaConfig = {
  name: 'Ethereum',
  chainId: ChainId.mainnet,
  UMBRELLA: '0xa6Cfa5803Da7851D6D9B7Dd97abF32DC53f7200d',
  additionalAddresses: {
    UMBRELLA_BATCH_HELPER: '0xCe6Ced23118EDEb23054E06118a702797b13fc2F',
    UMBRELLA_CONFIG_ENGINE: '0x0eb41d1f609EF1970a2F319C7a36BDa934d2c92a',
    DATA_AGGREGATION_HELPER: '0xAeB694261D4A36A060974044fB1f2d15CFB7851b'
  }
};