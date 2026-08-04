import {ChainId} from '@aave-dao/toolbox';
import {NetworkAddresses} from 'scripts/configs/types';

export const megaEthAddresses: NetworkAddresses = {
  name: 'MegaEth',
  chainId: ChainId.megaeth,
  addresses: {
    TRANSPARENT_PROXY_FACTORY: '0xEB0682d148e874553008730f0686ea89db7DA412',
    PROTOCOL_GUARDIAN: '0x8126eAd44383cb52Cf6A1bb70F1b4d7399DE34ef',
    ALC_SAFE: '0xA1c93D2687f7014Aaf588c764E3Ce80aF016229b',
  },
};
