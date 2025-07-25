import {Hex} from 'viem';
import {ChainId} from '@bgd-labs/toolbox';
import {NetworkAddresses} from '../types';

export const inkAddresses: NetworkAddresses = {
  name: 'Ink',
  chainId: ChainId.ink,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x5C2e738F6E27bCE0F7558051Bf90605dD6176900',
    PROTOCOL_GUARDIAN: '0x2e8090716C5a25332cf963d454250B88bf04E6dC'
  },
};
