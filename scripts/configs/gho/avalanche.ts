import {ChainId} from '@bgd-labs/toolbox';
import {GhoAddresses} from '../types';

export const ghoAvalanche: GhoAddresses = {
  name: 'Avalanche',
  chainId: ChainId.avalanche,
  addresses: {
    GHO_TOKEN: '0xfc421aD3C883Bf9E7C4f42dE845C4e4405799e73',
    GHO_CCIP_TOKEN_POOL: '0xDe6539018B095353A40753Dc54C91C68c9487D4E',
    GHO_AAVE_CORE_STEWARD: '0xA5Ba213867E175A182a5dd6A9193C6158738105A',
    GHO_BUCKET_STEWARD: '0x2Ce400703dAcc37b7edFA99D228b8E70a4d3831B',
    GHO_CCIP_STEWARD: '0x20fd5f3FCac8883a3A0A2bBcD658A2d2c6EFa6B6',
    RISK_COUNCIL: '0x8513e6F37dBc52De87b166980Fa3F50639694B60',
  },
};
