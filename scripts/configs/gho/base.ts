import {ChainId} from '@bgd-labs/toolbox';
import {GhoAddresses} from '../types';

export const ghoBase: GhoAddresses = {
  name: 'Base',
  chainId: ChainId.base,
  addresses: {
    GHO_TOKEN: '0x6Bb7a212910682DCFdbd5BCBb3e28FB4E8da10Ee',
    GHO_CCIP_TOKEN_POOL: '0x98217A06721Ebf727f2C8d9aD7718ec28b7aAe34',
    GHO_AAVE_CORE_STEWARD: '0xC5BcC58BE6172769ca1a78B8A45752E3C5059c39',
    GHO_BUCKET_STEWARD: '0x3c47237479e7569653eF9beC4a7Cd2ee3F78b396',
    GHO_CCIP_STEWARD: '0xB94Ab28c6869466a46a42abA834ca2B3cECCA5eB',
    RISK_COUNCIL: '0x8513e6F37dBc52De87b166980Fa3F50639694B60',
  },
};
