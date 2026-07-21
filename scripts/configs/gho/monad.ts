import {ChainId} from '@aave-dao/toolbox';
import {GhoAddresses} from 'scripts/configs/types';

export const ghoMonad: GhoAddresses = {
  name: 'Monad',
  chainId: ChainId.monad,
  addresses: {
    GHO_TOKEN: '0xfc421aD3C883Bf9E7C4f42dE845C4e4405799e73',
    GHO_CCIP_TOKEN_POOL: '0xA5AE05b71c3F170E12E7620Fdf7679721aec1EC8',
    GHO_AAVE_CORE_STEWARD: '0xA5Ba213867E175A182a5dd6A9193C6158738105A',
    GHO_BUCKET_STEWARD: '0xDe6539018B095353A40753Dc54C91C68c9487D4E',
    GHO_CCIP_STEWARD: '0x360d8aa8F6b09B7BC57aF34db2Eb84dD87bf4d12',
    RISK_COUNCIL: '0x8513e6F37dBc52De87b166980Fa3F50639694B60',
  },
};
