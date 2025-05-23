import {ChainId} from '@bgd-labs/toolbox';
import {GovernanceConfig} from '../types';

export const governanceConfigFuji: GovernanceConfig = {
  name: 'Fuji',
  CHAIN_ID: ChainId.avalanche_fuji,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x5488A48E5C22175548E8d68622211F5928cBbf23',
    VOTING_MACHINE: '0x79Edd77c76F95b6b69907CaD1d8241F9DB0e3FD0',
    PAYLOADS_CONTROLLER: '0xf1842f9D6C3D9ec1153d7afCBb9cDBC537Ea5d15',
  },
};

export const governanceConfigAvalanche: GovernanceConfig = {
  name: 'Avalanche',
  CHAIN_ID: ChainId.avalanche,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x27FC7D54C893dA63C0AE6d57e1B2B13A70690928',
    CL_EMERGENCY_ORACLE: '0x41185495Bc8297a65DC46f94001DC7233775EbEe',
    VOTING_MACHINE: '0x4D1863d22D0ED8579f8999388BCC833CB057C2d6',
    PAYLOADS_CONTROLLER: '0x1140CB7CAfAcC745771C2Ea31e7B5C653c5d0B80',
    PC_DATA_HELPER: '0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A',
    VM_DATA_HELPER: '0x77976B51569896523EE215962Ee91ff236Fa50E8',
    GRANULAR_GUARDIAN: '0xc1162BCb2E5E3ca4725512008c7522dF8C8B7B65',
    GOVERNANCE_GUARDIAN: '0x360c0a69Ed2912351227a0b745f890CB2eBDbcFe',
  },
};
