import {ChainId} from '../../generator/chains';
import {PoolConfig} from '../types';

export const harmonyProtoV3: PoolConfig = {
  name: 'Harmony',
  chainId: ChainId.harmony,
  POOL_ADDRESSES_PROVIDER: '0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb',
  additionalAddresses: {
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x770ef9f4fe897e59daCc474EF11238303F9552b6',
    UI_INCENTIVE_DATA_PROVIDER: '0xf7a60467aBb8A3240A0382b22E1B03c7d4F59Da5',
    UI_POOL_DATA_PROVIDER: '0x1DcDA4de2Bf6c7AD9a34788D22aE6b7d55016e1f',
    WALLET_BALANCE_PROVIDER: '0xBc790382B3686abffE4be14A030A96aC6154023a',
    WETH_GATEWAY: '0xE387c6053CE8EC9f8C3fa5cE085Af73114a695d3',
  },
};
