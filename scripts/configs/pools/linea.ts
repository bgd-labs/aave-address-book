import {ChainId} from '@bgd-labs/rpc-env';
import {PoolConfig} from '../types';

export const lineaProtoV3: PoolConfig = {
  name: 'Linea',
  chainId: ChainId.linea,
  POOL_ADDRESSES_PROVIDER: '0x89502c3731F69DDC95B65753708A07F8Cd0373F4',
  additionalAddresses: {
    CONFIG_ENGINE: '0x6c23bAF050ec192afc0B967a93b83e6c5405df43',
    RISK_STEWARD: '0x3238FC1d642b60F41a35f62570237656C85F4744',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x96dFCCB3F9ACDaF6c8f8a35E814023C3484d1eA2',
    UI_INCENTIVE_DATA_PROVIDER: '0x117684358D990E42Eb1649E7e8C4691951dc1E71',
    UI_POOL_DATA_PROVIDER: '0xf751969521E20A972A0776CDB0497Fad0F773F1F',
    WALLET_BALANCE_PROVIDER: '0xff75B6da14FfbbfD355Daf7a2731456b3562Ba6D',
    WETH_GATEWAY: '0x4758213271BFdC72224A7a8742dC865fC97756e1',
    STATA_FACTORY: '0x28ad75CA21793835b975130e9FdA149A476a2b7c',
  },
};
