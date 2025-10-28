import {ChainId} from '@bgd-labs/toolbox';
import {GhoAddresses} from '../types';

export const ghoPlasma: GhoAddresses = {
  name: 'Plasma',
  chainId: ChainId.plasma,
  addresses: {
    GHO_TOKEN: '0xb77E872A68C62CfC0dFb02C067Ecc3DA23B4bbf3',
    GHO_CCIP_TOKEN_POOL: '0x360d8aa8F6b09B7BC57aF34db2Eb84dD87bf4d12',
    GHO_ORACLE: '0xb0e1c7830aA781362f79225559Aa068E6bDaF1d1',
    GHO_BUCKET_STEWARD: '0x2Ce400703dAcc37b7edFA99D228b8E70a4d3831B',
    GHO_CCIP_STEWARD: '0x20fd5f3FCac8883a3A0A2bBcD658A2d2c6EFa6B6',
    RISK_COUNCIL: '0x8513e6F37dBc52De87b166980Fa3F50639694B60',
  },
};
