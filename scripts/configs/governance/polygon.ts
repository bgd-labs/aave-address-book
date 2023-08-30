import {ChainId} from '../../generator/chains';
import {GovernanceConfig} from '../types';

export const governanceConfigMumbai: GovernanceConfig = {
  name: 'Mumbai',
  CHAIN_ID: ChainId.mumbai,
  CROSS_CHAIN_CONTROLLER: '0xe521cB5e23DbF8248c0B0C3C2503feA3C4c7Caff',
  VOTING_MACHINE: '0x05D0215cFC8D4B726085ADDb1ce43bC5C70f9D8f',
  PAYLOADS_CONTROLLER: '0x92041C9904d1F0b8100D1d7e01B760d2cF1Fb426',
};

export const governanceConfigPolygon: GovernanceConfig = {
  name: 'Polygon',
  CHAIN_ID: ChainId.polygon,
  CROSS_CHAIN_CONTROLLER: '0xFb79B297CF95d912Ace0eF41866691eE6aeA19E2',
};
