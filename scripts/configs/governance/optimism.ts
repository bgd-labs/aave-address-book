import {ChainId} from '@bgd-labs/rpc-env';
import {GovernanceConfig} from '../types';

export const governanceConfigOptimism: GovernanceConfig = {
  name: 'Optimism',
  CHAIN_ID: ChainId.optimism,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x48A9FE90bce5EEd790f3F4Ce192d1C0B351fd4Ca',
    PAYLOADS_CONTROLLER: '0x0E1a3Af1f9cC76A62eD31eDedca291E63632e7c4',
    PC_DATA_HELPER: '0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A',
    GRANULAR_GUARDIAN: '0x6c5264C380C7022e54f585c4E354ffb6f221a03b',
    GOVERNANCE_GUARDIAN: '0x360c0a69Ed2912351227a0b745f890CB2eBDbcFe',
  },
};
