import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const celoAddresses: NetworkAddresses = {
  name: 'Celo',
  chainId: ChainId.celo,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x1Be33D186a081eFDf15310e4bdEd81E828C47f9b',
    PROXY_ADMIN: '0x54BDcc37c4143f944A3EE51C892a6cBDF305E7a0',
    PROTOCOL_GUARDIAN: '0x88E7aB6ee481Cf92e548c0e1169F824F99142c85',
    AFC_SAFE: '0x22740deBa78d5a0c24C58C740e3715ec29de1bFa',
    MASIV_SAFE: '0xdef1FA4CEfe67365ba046a7C630D6B885298E210',
  },
};
