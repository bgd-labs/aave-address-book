import {ChainId} from '@bgd-labs/toolbox';
import {UmbrellaConfig} from '../types';

export const umbrellaMainnetConfig: UmbrellaConfig = {
  name: 'Ethereum',
  chainId: ChainId.mainnet,
  UMBRELLA: '0xD400fc38ED4732893174325693a63C30ee3881a8',
  additionalAddresses: {
    UMBRELLA_BATCH_HELPER: '0xCe6Ced23118EDEb23054E06118a702797b13fc2F',
    UMBRELLA_CONFIG_ENGINE: '0x21f01c82Bc205c2A6F20E6694fd912cBccdcA208',
    DATA_AGGREGATION_HELPER: '0xAeB694261D4A36A060974044fB1f2d15CFB7851b',
    PERMISSIONED_PAYLOADS_CONTROLLER: '0xf86f77f7531b3374274e3f725e0a81d60bc4bb67',
    DEFICIT_OFFSET_CLINIC_STEWARD: '0x6c1DC85f2aE71C3DAcd6E44Bb57DEeF61b540a5A'
  }
};