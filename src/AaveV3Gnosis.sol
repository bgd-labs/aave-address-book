// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3Gnosis {
  // https://blockscout.com/xdai/mainnet/address/0x36616cf17557639614c1cdDb356b1B83fc0B2132
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x36616cf17557639614c1cdDb356b1B83fc0B2132);

  // https://blockscout.com/xdai/mainnet/address/0xb50201558B00496A145fE76f7424749556E326D8
  IPool internal constant POOL = IPool(0xb50201558B00496A145fE76f7424749556E326D8);

  // https://blockscout.com/xdai/mainnet/address/0x7304979ec9E4EaA0273b6A037a31c4e9e5A75D16
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x7304979ec9E4EaA0273b6A037a31c4e9e5A75D16);

  // https://blockscout.com/xdai/mainnet/address/0xeb0a051be10228213BAEb449db63719d6742F7c4
  IAaveOracle internal constant ORACLE = IAaveOracle(0xeb0a051be10228213BAEb449db63719d6742F7c4);

  // https://blockscout.com/xdai/mainnet/address/0x0000000000000000000000000000000000000000
  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;

  // https://blockscout.com/xdai/mainnet/address/0x501B4c19dd9C2e06E94dA7b6D5Ed4ddA013EC741
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x501B4c19dd9C2e06E94dA7b6D5Ed4ddA013EC741);

  // https://blockscout.com/xdai/mainnet/address/0xEc710f59005f48703908bC519D552Df5B8472614
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xEc710f59005f48703908bC519D552Df5B8472614);

  // https://blockscout.com/xdai/mainnet/address/0x1dF462e2712496373A347f8ad10802a5E95f053D
  address internal constant ACL_ADMIN = 0x1dF462e2712496373A347f8ad10802a5E95f053D;

  // https://blockscout.com/xdai/mainnet/address/0x3e652E97ff339B73421f824F5b03d75b62F1Fb51
  ICollector internal constant COLLECTOR = ICollector(0x3e652E97ff339B73421f824F5b03d75b62F1Fb51);

  // https://blockscout.com/xdai/mainnet/address/0xaD4F91D26254B6B0C6346b390dDA2991FDE2F20d
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xaD4F91D26254B6B0C6346b390dDA2991FDE2F20d;

  // https://blockscout.com/xdai/mainnet/address/0x589750BA8aF186cE5B55391B0b7148cAD43a1619
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x589750BA8aF186cE5B55391B0b7148cAD43a1619;

  // https://blockscout.com/xdai/mainnet/address/0xBeC519531F0E78BcDdB295242fA4EC5251B38574
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xBeC519531F0E78BcDdB295242fA4EC5251B38574;

  // https://blockscout.com/xdai/mainnet/address/0x06C35Cfd3FC61eC2aC437f0d08840d5776b945af
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x06C35Cfd3FC61eC2aC437f0d08840d5776b945af;

  // https://blockscout.com/xdai/mainnet/address/0x41585C50524fb8c3899B43D7D797d9486AAc94DB
  address internal constant EMISSION_MANAGER = 0x41585C50524fb8c3899B43D7D797d9486AAc94DB;

  // https://blockscout.com/xdai/mainnet/address/0xab923C4BD40eab9824C0b86FD8562eEcb933b56a
  address internal constant L2_ENCODER = 0xab923C4BD40eab9824C0b86FD8562eEcb933b56a;

  // https://blockscout.com/xdai/mainnet/address/0x3238FC1d642b60F41a35f62570237656C85F4744
  address internal constant CONFIG_ENGINE = 0x3238FC1d642b60F41a35f62570237656C85F4744;

  // https://blockscout.com/xdai/mainnet/address/0x1236010CECea55998384e795B59815D871f5f94d
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x1236010CECea55998384e795B59815D871f5f94d;

  // https://blockscout.com/xdai/mainnet/address/0x73dDE2A75c06a108912bf7Ff600eDdCE9d96Ed25
  address internal constant RATES_FACTORY = 0x73dDE2A75c06a108912bf7Ff600eDdCE9d96Ed25;

  // https://blockscout.com/xdai/mainnet/address/0xCFDAdA7DCd2e785cF706BaDBC2B8Af5084d595e9
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xCFDAdA7DCd2e785cF706BaDBC2B8Af5084d595e9;

  // https://blockscout.com/xdai/mainnet/address/0x86E2938daE289763D4e09a7e42c5cCcA62Cf9809
  address internal constant UI_POOL_DATA_PROVIDER = 0x86E2938daE289763D4e09a7e42c5cCcA62Cf9809;

  // https://blockscout.com/xdai/mainnet/address/0x4172E6aAEC070ACB31aaCE343A58c93E4C70f44D
  address internal constant WALLET_BALANCE_PROVIDER = 0x4172E6aAEC070ACB31aaCE343A58c93E4C70f44D;

  // https://blockscout.com/xdai/mainnet/address/0xb7E51aA2A5f4dD478F183A593F67637ed6F1d1D9
  address internal constant WETH_GATEWAY = 0xb7E51aA2A5f4dD478F183A593F67637ed6F1d1D9;

  // https://blockscout.com/xdai/mainnet/address/0x33AE1f41546a2e05368Bf789b3d868813c0Ae658
  address internal constant CAPS_PLUS_RISK_STEWARD = 0x33AE1f41546a2e05368Bf789b3d868813c0Ae658;

  // https://blockscout.com/xdai/mainnet/address/0x3Ceaf9b6CAb92dFe6302D0CC3F1BA880C28d35e5
  address internal constant FREEZING_STEWARD = 0x3Ceaf9b6CAb92dFe6302D0CC3F1BA880C28d35e5;

  // https://blockscout.com/xdai/mainnet/address/0x02e9b27599C4Bf8f789d34b6E65C51092c3d9FA6
  address internal constant STATIC_A_TOKEN_FACTORY = 0x02e9b27599C4Bf8f789d34b6E65C51092c3d9FA6;
}

library AaveV3GnosisAssets {
  // https://blockscout.com/xdai/mainnet/address/0x6A023CCd1ff6F2045C3309768eAd9E68F978f6e1
  address internal constant WETH_UNDERLYING = 0x6A023CCd1ff6F2045C3309768eAd9E68F978f6e1;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://blockscout.com/xdai/mainnet/address/0xa818F1B57c201E092C4A2017A91815034326Efd1
  address internal constant WETH_A_TOKEN = 0xa818F1B57c201E092C4A2017A91815034326Efd1;

  // https://blockscout.com/xdai/mainnet/address/0x0c0fce05F2314540EcB095bF4D069e5E0ED90fF8
  address internal constant WETH_V_TOKEN = 0x0c0fce05F2314540EcB095bF4D069e5E0ED90fF8;

  // https://blockscout.com/xdai/mainnet/address/0x436D82d905b014926a2375C576500B6fea0D2496
  address internal constant WETH_S_TOKEN = 0x436D82d905b014926a2375C576500B6fea0D2496;

  // https://blockscout.com/xdai/mainnet/address/0xa767f745331D267c7751297D982b050c93985627
  address internal constant WETH_ORACLE = 0xa767f745331D267c7751297D982b050c93985627;

  // https://blockscout.com/xdai/mainnet/address/0xD84d86083010FB683f1e8fA3809ee8DC90A4C4DB
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xD84d86083010FB683f1e8fA3809ee8DC90A4C4DB;

  // https://blockscout.com/xdai/mainnet/address/0xD843FB478c5aA9759FeA3f3c98D467e2F136190a
  address internal constant WETH_STATA_TOKEN = 0xD843FB478c5aA9759FeA3f3c98D467e2F136190a;

  // https://blockscout.com/xdai/mainnet/address/0x6C76971f98945AE98dD7d4DFcA8711ebea946eA6
  address internal constant wstETH_UNDERLYING = 0x6C76971f98945AE98dD7d4DFcA8711ebea946eA6;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://blockscout.com/xdai/mainnet/address/0x23e4E76D01B2002BE436CE8d6044b0aA2f68B68a
  address internal constant wstETH_A_TOKEN = 0x23e4E76D01B2002BE436CE8d6044b0aA2f68B68a;

  // https://blockscout.com/xdai/mainnet/address/0x9D881f67F20B49243c98f53d2B9E91E39d02Ae09
  address internal constant wstETH_V_TOKEN = 0x9D881f67F20B49243c98f53d2B9E91E39d02Ae09;

  // https://blockscout.com/xdai/mainnet/address/0x5CBc43c339F5202D2dcB59583D33cA8498b75031
  address internal constant wstETH_S_TOKEN = 0x5CBc43c339F5202D2dcB59583D33cA8498b75031;

  // https://blockscout.com/xdai/mainnet/address/0xcb0670258e5961CCA85D8F71D29C1167Ef20De99
  address internal constant wstETH_ORACLE = 0xcb0670258e5961CCA85D8F71D29C1167Ef20De99;

  // https://blockscout.com/xdai/mainnet/address/0x9E57695Dab0DCdb42BC220ff1E9eb2e22a31209b
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0x9E57695Dab0DCdb42BC220ff1E9eb2e22a31209b;

  // https://blockscout.com/xdai/mainnet/address/0xECfD0638175e291BA3F784A58FB9D38a25418904
  address internal constant wstETH_STATA_TOKEN = 0xECfD0638175e291BA3F784A58FB9D38a25418904;

  // https://blockscout.com/xdai/mainnet/address/0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb
  address internal constant GNO_UNDERLYING = 0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb;

  uint8 internal constant GNO_DECIMALS = 18;

  // https://blockscout.com/xdai/mainnet/address/0xA1Fa064A85266E2Ca82DEe5C5CcEC84DF445760e
  address internal constant GNO_A_TOKEN = 0xA1Fa064A85266E2Ca82DEe5C5CcEC84DF445760e;

  // https://blockscout.com/xdai/mainnet/address/0xBc59E99198DbA71985A66E1713cC89FFEC53f7FC
  address internal constant GNO_V_TOKEN = 0xBc59E99198DbA71985A66E1713cC89FFEC53f7FC;

  // https://blockscout.com/xdai/mainnet/address/0x1A126F613D7705E59ADb39909b25E1223aDF05dd
  address internal constant GNO_S_TOKEN = 0x1A126F613D7705E59ADb39909b25E1223aDF05dd;

  // https://blockscout.com/xdai/mainnet/address/0x22441d81416430A54336aB28765abd31a792Ad37
  address internal constant GNO_ORACLE = 0x22441d81416430A54336aB28765abd31a792Ad37;

  // https://blockscout.com/xdai/mainnet/address/0x777fDAB3C03aA63d7d7CbCbaB22724cEe50F1731
  address internal constant GNO_INTEREST_RATE_STRATEGY = 0x777fDAB3C03aA63d7d7CbCbaB22724cEe50F1731;

  // https://blockscout.com/xdai/mainnet/address/0x2D737e2B0e175f05D0904C208d6C4e40da570f65
  address internal constant GNO_STATA_TOKEN = 0x2D737e2B0e175f05D0904C208d6C4e40da570f65;

  // https://blockscout.com/xdai/mainnet/address/0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83
  address internal constant USDC_UNDERLYING = 0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://blockscout.com/xdai/mainnet/address/0xc6B7AcA6DE8a6044E0e32d0c841a89244A10D284
  address internal constant USDC_A_TOKEN = 0xc6B7AcA6DE8a6044E0e32d0c841a89244A10D284;

  // https://blockscout.com/xdai/mainnet/address/0x5F6f7B0a87CA3CF3d0b431Ae03EF3305180BFf4d
  address internal constant USDC_V_TOKEN = 0x5F6f7B0a87CA3CF3d0b431Ae03EF3305180BFf4d;

  // https://blockscout.com/xdai/mainnet/address/0x8220133C3a631de3C7A5B679A2417BD61431FEcf
  address internal constant USDC_S_TOKEN = 0x8220133C3a631de3C7A5B679A2417BD61431FEcf;

  // https://blockscout.com/xdai/mainnet/address/0x26C31ac71010aF62E6B486D1132E266D6298857D
  address internal constant USDC_ORACLE = 0x26C31ac71010aF62E6B486D1132E266D6298857D;

  // https://blockscout.com/xdai/mainnet/address/0x345f7fcd88207fe060AD03c2656A23A3Ab596479
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x345f7fcd88207fe060AD03c2656A23A3Ab596479;

  // https://blockscout.com/xdai/mainnet/address/0x270bA1f35D8b87510D24F693fcCc0da02e6E4EeB
  address internal constant USDC_STATA_TOKEN = 0x270bA1f35D8b87510D24F693fcCc0da02e6E4EeB;

  // https://blockscout.com/xdai/mainnet/address/0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d
  address internal constant WXDAI_UNDERLYING = 0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d;

  uint8 internal constant WXDAI_DECIMALS = 18;

  // https://blockscout.com/xdai/mainnet/address/0xd0Dd6cEF72143E22cCED4867eb0d5F2328715533
  address internal constant WXDAI_A_TOKEN = 0xd0Dd6cEF72143E22cCED4867eb0d5F2328715533;

  // https://blockscout.com/xdai/mainnet/address/0x281963D7471eCdC3A2Bd4503e24e89691cfe420D
  address internal constant WXDAI_V_TOKEN = 0x281963D7471eCdC3A2Bd4503e24e89691cfe420D;

  // https://blockscout.com/xdai/mainnet/address/0xaC8b1cE0548C69318920C3e0b21Db296d5770D57
  address internal constant WXDAI_S_TOKEN = 0xaC8b1cE0548C69318920C3e0b21Db296d5770D57;

  // https://blockscout.com/xdai/mainnet/address/0x678df3415fc31947dA4324eC63212874be5a82f8
  address internal constant WXDAI_ORACLE = 0x678df3415fc31947dA4324eC63212874be5a82f8;

  // https://blockscout.com/xdai/mainnet/address/0x345f7fcd88207fe060AD03c2656A23A3Ab596479
  address internal constant WXDAI_INTEREST_RATE_STRATEGY =
    0x345f7fcd88207fe060AD03c2656A23A3Ab596479;

  // https://blockscout.com/xdai/mainnet/address/0x7f0EAE87Df30C468E0680c83549D0b3DE7664D4B
  address internal constant WXDAI_STATA_TOKEN = 0x7f0EAE87Df30C468E0680c83549D0b3DE7664D4B;

  // https://blockscout.com/xdai/mainnet/address/0xcB444e90D8198415266c6a2724b7900fb12FC56E
  address internal constant EURe_UNDERLYING = 0xcB444e90D8198415266c6a2724b7900fb12FC56E;

  uint8 internal constant EURe_DECIMALS = 18;

  // https://blockscout.com/xdai/mainnet/address/0xEdBC7449a9b594CA4E053D9737EC5Dc4CbCcBfb2
  address internal constant EURe_A_TOKEN = 0xEdBC7449a9b594CA4E053D9737EC5Dc4CbCcBfb2;

  // https://blockscout.com/xdai/mainnet/address/0xb96404e475f337A7E98e4a541C9b71309BB66c5A
  address internal constant EURe_V_TOKEN = 0xb96404e475f337A7E98e4a541C9b71309BB66c5A;

  // https://blockscout.com/xdai/mainnet/address/0x916E13857FeeD0d982Df148DBe8d8542519aB96e
  address internal constant EURe_S_TOKEN = 0x916E13857FeeD0d982Df148DBe8d8542519aB96e;

  // https://blockscout.com/xdai/mainnet/address/0xab70BCB260073d036d1660201e9d5405F5829b7a
  address internal constant EURe_ORACLE = 0xab70BCB260073d036d1660201e9d5405F5829b7a;

  // https://blockscout.com/xdai/mainnet/address/0x6c3b7e7B8b9609D57C70C3F630228F979EAbb450
  address internal constant EURe_INTEREST_RATE_STRATEGY =
    0x6c3b7e7B8b9609D57C70C3F630228F979EAbb450;

  // https://blockscout.com/xdai/mainnet/address/0x8418D17640a74F1614AC3E1826F29e78714488a1
  address internal constant EURe_STATA_TOKEN = 0x8418D17640a74F1614AC3E1826F29e78714488a1;

  // https://blockscout.com/xdai/mainnet/address/0xaf204776c7245bF4147c2612BF6e5972Ee483701
  address internal constant sDAI_UNDERLYING = 0xaf204776c7245bF4147c2612BF6e5972Ee483701;

  uint8 internal constant sDAI_DECIMALS = 18;

  // https://blockscout.com/xdai/mainnet/address/0x7a5c3860a77a8DC1b225BD46d0fb2ac1C6D191BC
  address internal constant sDAI_A_TOKEN = 0x7a5c3860a77a8DC1b225BD46d0fb2ac1C6D191BC;

  // https://blockscout.com/xdai/mainnet/address/0x8Fe06E1D8Aff42Bf6812CacF7854A2249a00bED7
  address internal constant sDAI_V_TOKEN = 0x8Fe06E1D8Aff42Bf6812CacF7854A2249a00bED7;

  // https://blockscout.com/xdai/mainnet/address/0xa2E0335175Da40b081717FfD394C0E1de738cb9B
  address internal constant sDAI_S_TOKEN = 0xa2E0335175Da40b081717FfD394C0E1de738cb9B;

  // https://blockscout.com/xdai/mainnet/address/0x1D0f881Ce1a646E2f27Dec3c57Fa056cB838BCC2
  address internal constant sDAI_ORACLE = 0x1D0f881Ce1a646E2f27Dec3c57Fa056cB838BCC2;

  // https://blockscout.com/xdai/mainnet/address/0x6c3b7e7B8b9609D57C70C3F630228F979EAbb450
  address internal constant sDAI_INTEREST_RATE_STRATEGY =
    0x6c3b7e7B8b9609D57C70C3F630228F979EAbb450;

  // https://blockscout.com/xdai/mainnet/address/0xf3f45960f8dE00D8ED614D445a5a268c6F6Dec4f
  address internal constant sDAI_STATA_TOKEN = 0xf3f45960f8dE00D8ED614D445a5a268c6F6Dec4f;
}

library AaveV3GnosisEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant ETH_CORRELATED = 1;
}
