import {ChainId} from '@bgd-labs/rpc-env';
import {PoolConfig} from '../types';

export const metisProtoV3: PoolConfig = {
  name: 'Metis',
  chainId: ChainId.metis,
  POOL_ADDRESSES_PROVIDER: '0xB9FABd7500B2C6781c35Dd48d54f81fc2299D7AF',
  additionalAddresses: {
    CAPS_PLUS_RISK_STEWARD: '0x5f4d15d761528c57a5C30c43c1DAb26Fc5452731',
    RISK_STEWARD: '0x58226D26658F19724cB881E9F747EeDC846BB1c9',
    FREEZING_STEWARD: '0x2C77153fF4a1e83A8d8D750735FB101ECB55949f',
    L2_ENCODER: '0x9f3A1B399A9074eBA63Dc4fc274bE2A2b2d80cB9',
    CONFIG_ENGINE: '0x45918bB1D3F73904a30Ffc3eD11CdB1c05eBF726',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x9E7B73ffD9D2026F3ff4212c29E209E09C8A91F5',
    UI_INCENTIVE_DATA_PROVIDER: '0xE92cd6164CE7DC68e740765BC1f2a091B6CBc3e4',
    UI_POOL_DATA_PROVIDER: '0xc0179321f0825c3e0F59Fe7Ca4E40557b97797a3',
    WALLET_BALANCE_PROVIDER: '0x1df710eb1E2FD9C21494aF2BFb1F210a4185885b',
    LEGACY_STATIC_A_TOKEN_FACTORY: '0x9C62AdC332888F56998542415c38D7CDf3Ff7619',
  },
};
