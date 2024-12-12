import {ChainId} from '@bgd-labs/rpc-env';
import {GovernanceConfig} from '../types';

export const governanceConfigLinea: GovernanceConfig = {
  name: 'Linea',
  CHAIN_ID: ChainId.linea,
  ADDRESSES: {
    CROSS_CHAIN_CONTROLLER: '0x0D3f821e9741C8a8Bcac231162320251Db0cdf52',
    PAYLOADS_CONTROLLER: '0x61308f66DEF56EffFa25C8CB5408D6dDdB450149',
    PC_DATA_HELPER: '0x6d4F341d8Bb3Dc5ABe822Aa940F1884508C13f99',
    GRANULAR_GUARDIAN: '0x8CAdaAE6cd278c7C8FBaD5d6F55Ca6129A627E10',
    GOVERNANCE_GUARDIAN: '0x0BF186764D8333a938f35e5dD124a7b9b9dccDF9',
  },
};
