import {ChainId} from '@bgd-labs/toolbox';
import {PoolConfig} from '../types';

export const baseProtoV3: PoolConfig = {
  name: 'Base',
  chainId: ChainId.base,
  POOL_ADDRESSES_PROVIDER: '0xe20fCBdBfFC4Dd138cE8b2E6FBb6CB49777ad64D',
  additionalAddresses: {
    RISK_STEWARD: '0x085E34722e04567Df9E6d2c32e82fd74f3342e79',
    EDGE_RISK_STEWARD_CAPS: '0xB892202d9Ce2C16C565A492a5168689b215Eb269',
    EDGE_INJECTOR_CAPS: '0x4f84A364B66Eb6280350da011829a6BD02B4712f',
    EDGE_RISK_ORACLE: '0x239d3Bc5fa247337287cb03f53B8bc63DBBc332D',
    DEBT_SWAP_ADAPTER: '0xb12e82DF057BF16ecFa89D7D089dc7E5C1Dc057B',
    WITHDRAW_SWAP_ADAPTER: '0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9',
    SWAP_COLLATERAL_ADAPTER: '0x2E549104c516b8657A7D888494DfbAbD7C70b464',
    REPAY_WITH_COLLATERAL_ADAPTER: '0x63dfa7c09Dc2Ff4030d6B8Dc2ce6262BF898C8A4',
    LEGACY_STATIC_A_TOKEN_FACTORY: '0x940F9a5d5F9ED264990D0eaee1F3DD60B4Cb9A22',
    LEGACY_STATIC_A_TOKEN_ORACLE: '0xe63eAf6DAb1045689BD3a332bC596FfcF54A5C88',
    CONFIG_ENGINE: '0x655252250f4a453854040a49e8280951a76f3033',
    L2_ENCODER: '0x39e97c588B2907Fb67F44fea256Ae3BA064207C5',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x2f6571d3Eb9a4e350C68C36bCD2afe39530078E2',
    UI_INCENTIVE_DATA_PROVIDER: '0x91e04cf78e53aebe609e8a7f2003e7eecd743f2b',
    UI_POOL_DATA_PROVIDER: '0x68100bd5345ea474d93577127c11f39ff8463e93',
    WALLET_BALANCE_PROVIDER: '0x5779b29B0a34577d927E8D511B595ef9abbFAE82',
    WETH_GATEWAY: '0xa0d9C1E9E48Ca30c8d8C3B5D69FF5dc1f6DFfC24',
    STATA_FACTORY: '0x78d33BF0014ab169725F2Ea5a62b200F2977faeE',
    DUST_BIN: '0x3870D459d2fC2Edbb03E0DdeE6c0Ccb268caf202',
    CLINIC_STEWARD: '0x1a79098c3149020acdefb3ee44aa1d9509305530',
    POOL_EXPOSURE_STEWARD: '0x4f1f3e32f20847a4c9f002882eb607ad750b6115',
  },
};

export const baseSepoliaProtoV3: PoolConfig = {
  name: 'BaseSepolia',
  chainId: ChainId.base_sepolia,
  POOL_ADDRESSES_PROVIDER: '0xE4C23309117Aa30342BFaae6c95c6478e0A4Ad00',
  additionalAddresses: {
    STATA_FACTORY: '0x4Afb5ADe7Bd7a670B61f303ab0C740eE8350918f',
    CONFIG_ENGINE: '0xD3a3f523100e1eaa740A6eE72Ae94710A0fAcFCe',
    L2_ENCODER: '0x8eB0791E0981947df2eA074D2479dB9A258b0312',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x34473a6Ef69d92191d7b25352b5D266f3a5BAca2',
    UI_INCENTIVE_DATA_PROVIDER: '0xDB1412acf288D5bE057f8e90fd7b1BF4f84bB3B1',
    UI_POOL_DATA_PROVIDER: '0x6a9D64f93DB660EaCB2b6E9424792c630CdA87d8',
    WALLET_BALANCE_PROVIDER: '0x2c4D1F4EC7F4FfA09a5E1C9e74fD3A10f21Bd811',
    WETH_GATEWAY: '0x0568130e794429D2eEBC4dafE18f25Ff1a1ed8b6',
  },
};

export const baseSepoliaLidoProtoV3: PoolConfig = {
  name: 'BaseSepoliaLido',
  chainId: ChainId.base_sepolia,
  POOL_ADDRESSES_PROVIDER: '0x6f7E694fe5250Ce638fFE95524760422E6e41997',
  additionalAddresses: {
    CONFIG_ENGINE: '0x7e66C9c25E91200b8713d5E926b0e12496636dF5',
    L2_ENCODER: '0xEC239206602f299b5d0A7dDfd7A9ed1F2ebeE020',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0xDda880c5Cf474b68cc79f89fa2A2F8513015FF20',
    UI_INCENTIVE_DATA_PROVIDER: '0xAc5Cc0A193C6FAc2616c7c5FACfd1C9DB909371C',
    UI_POOL_DATA_PROVIDER: '0x912D4A80f8cA3959eB49Ce38f060c46323D1e3A4',
    WALLET_BALANCE_PROVIDER: '0x2a5208950631917efE7EbE969eC1be68EE46AB16',
    WETH_GATEWAY: '0x63bBa35193cB5E061E8F0318F8A1788EA34E5198',
  },
};
