import {ChainId} from '@bgd-labs/toolbox';
import {PoolConfig} from '../types';

export const mantleProtoV3: PoolConfig = {
  name: 'Mantle',
  chainId: ChainId.mantle,
  POOL_ADDRESSES_PROVIDER: '0x2aB3580a805fB10CbAd567212C70e26C1B6769eC',
  additionalAddresses: {
    CONFIG_ENGINE: '0xea9989569Cf2D860597b4d649c9A963c15ab84fa',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0xe892E40C92c2E4D281Be59b2E6300F271d824E75',
    UI_INCENTIVE_DATA_PROVIDER: '0x01d678F1bbE148C96e7501F1Ac41661904F84F61',
    UI_POOL_DATA_PROVIDER: '0x4F6f44325828D2A40724A0a966F33d75cD1DF7c1',
    WALLET_BALANCE_PROVIDER: '0x4758213271BFdC72224A7a8742dC865fC97756e1',
    WETH_GATEWAY: '0xde35f7711295Dfd0CD8bd94d46f65b8Acb182520',
    L2_ENCODER: '0x4A49351ED179b23af08523Af98a8ca95C712b9d9',
    STATA_FACTORY: '0x7cCC8a3DF66a2cDEa6c0629412378752Db5014EA',
    RISK_STEWARD: '0x3238FC1d642b60F41a35f62570237656C85F4744',
    DUST_BIN: '0x7485FB1552BB107fFc923f41E548e8e3FFea5E45',
  },
  initial: {
    COLLECTOR: '0x29B8Edc8a5158e8eBD7Dea3473517AB079260a0b',
    DEFAULT_A_TOKEN_IMPL: '0xd8247C7926841337E8adf9fD9E87026992C45062',
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL: '0x294daB91f3539f5a74Ed995a59235eE62A14A345',
  },
};
