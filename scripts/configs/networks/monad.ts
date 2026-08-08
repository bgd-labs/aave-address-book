import {ChainId} from '@aave-dao/toolbox';
import {NetworkAddresses} from 'scripts/configs/types';

export const monadAddresses: NetworkAddresses = {
  name: 'Monad',
  chainId: ChainId.monad,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0x2f09b9D890535c2b5c81b1b95F7f92eeed5B9d5D',
    PROTOCOL_GUARDIAN: '0xc887455536CBD4e615B745e70CaCde15B3117e74',
    AHAB_SAFE: '0xAA2461f0f0A3dE5fEAF3273eAe16DEF861cf594e',
    ALC_SAFE: '0xA1c93D2687f7014Aaf588c764E3Ce80aF016229b',
    TOKENLOGIC_EXECUTION_SAFE: '0x9DE1d45e2786b03498289959203F25b29B4D1193',
  },
};
