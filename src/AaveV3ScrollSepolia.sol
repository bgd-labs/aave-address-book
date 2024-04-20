// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3ScrollSepolia {
  // https://sepolia-blockscout.scroll.io/address/0x52A27dC690F8652288194Dd2bc523863eBdEa236
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x52A27dC690F8652288194Dd2bc523863eBdEa236);

  // https://sepolia-blockscout.scroll.io/address/0x48914C788295b5db23aF2b5F0B3BE775C4eA9440
  IPool internal constant POOL = IPool(0x48914C788295b5db23aF2b5F0B3BE775C4eA9440);

  // https://sepolia-blockscout.scroll.io/address/0x63BB78Fbac521998BD6E33f1a960677c7a1d4F10
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x63BB78Fbac521998BD6E33f1a960677c7a1d4F10);

  // https://sepolia-blockscout.scroll.io/address/0x4B7C7D2EbcDc1015D35F617596318C15d9d24e59
  IAaveOracle internal constant ORACLE = IAaveOracle(0x4B7C7D2EbcDc1015D35F617596318C15d9d24e59);

  // https://sepolia-blockscout.scroll.io/address/0x0000000000000000000000000000000000000000
  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;

  // https://sepolia-blockscout.scroll.io/address/0xaE58b3Be9E159bDEc67Ada8507CA3001c80725Ee
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xaE58b3Be9E159bDEc67Ada8507CA3001c80725Ee);

  // https://sepolia-blockscout.scroll.io/address/0x166601A0Cc6Cf979e2f0eF94EC5363B6BC24061C
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x166601A0Cc6Cf979e2f0eF94EC5363B6BC24061C);

  // https://sepolia-blockscout.scroll.io/address/0xA5bf8BC3c35D9F92b038254B9B8675266f6b62c0
  address internal constant ACL_ADMIN = 0xA5bf8BC3c35D9F92b038254B9B8675266f6b62c0;

  // https://sepolia-blockscout.scroll.io/address/0x104Cd7695C9247096F7AD37d3258B63c9675A00e
  ICollector internal constant COLLECTOR = ICollector(0x104Cd7695C9247096F7AD37d3258B63c9675A00e);

  // https://sepolia-blockscout.scroll.io/address/0xa76F05D0cdf599E0186dec880F2FA480fd0c5280
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xa76F05D0cdf599E0186dec880F2FA480fd0c5280;

  // https://sepolia-blockscout.scroll.io/address/0x0Eae78c97347bf6FCF784Aa91CABC4aCdB5cc2dd
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x0Eae78c97347bf6FCF784Aa91CABC4aCdB5cc2dd;

  // https://sepolia-blockscout.scroll.io/address/0xAb8eaAE8383Abe28203cB6e6FAa0477B2fb97f07
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xAb8eaAE8383Abe28203cB6e6FAa0477B2fb97f07;

  // https://sepolia-blockscout.scroll.io/address/0xC696d1c66Aa9F42764eE44fCc454a07a24aCe256
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xC696d1c66Aa9F42764eE44fCc454a07a24aCe256;

  // https://sepolia-blockscout.scroll.io/address/0x01dd3Ad7D942406C47acd5b70cBad28fd377c6f2
  address internal constant EMISSION_MANAGER = 0x01dd3Ad7D942406C47acd5b70cBad28fd377c6f2;

  // https://sepolia-blockscout.scroll.io/address/0x2F826FD1a0071476330a58dD1A9B36bcF7da832d
  address internal constant FAUCET = 0x2F826FD1a0071476330a58dD1A9B36bcF7da832d;

  // https://sepolia-blockscout.scroll.io/address/0x3Bb33c67908D0d58F8d7349cBe726ff3b059e0fC
  address internal constant L2_ENCODER = 0x3Bb33c67908D0d58F8d7349cBe726ff3b059e0fC;

  // https://sepolia-blockscout.scroll.io/address/0xBf67A725F976d4A7C1fa9ea5303FD57D13CA0A37
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xBf67A725F976d4A7C1fa9ea5303FD57D13CA0A37;

  // https://sepolia-blockscout.scroll.io/address/0xDC55BcFC0963608401A4bA6298624E5895f8250a
  address internal constant UI_POOL_DATA_PROVIDER = 0xDC55BcFC0963608401A4bA6298624E5895f8250a;

  // https://sepolia-blockscout.scroll.io/address/0x6c68e975764a56e62AF3d1C8209F789779Eb763B
  address internal constant WALLET_BALANCE_PROVIDER = 0x6c68e975764a56e62AF3d1C8209F789779Eb763B;

  // https://sepolia-blockscout.scroll.io/address/0x57ce905CfD7f986A929A26b006f797d181dB706e
  address internal constant WETH_GATEWAY = 0x57ce905CfD7f986A929A26b006f797d181dB706e;
}

library AaveV3ScrollSepoliaAssets {
  // https://sepolia-blockscout.scroll.io/address/0x7984E363c38b590bB4CA35aEd5133Ef2c6619C40
  address internal constant DAI_UNDERLYING = 0x7984E363c38b590bB4CA35aEd5133Ef2c6619C40;

  uint8 internal constant DAI_DECIMALS = 18;

  // https://sepolia-blockscout.scroll.io/address/0x99Cb50E6bE36C8096e6731ED7738d93090B710DD
  address internal constant DAI_A_TOKEN = 0x99Cb50E6bE36C8096e6731ED7738d93090B710DD;

  // https://sepolia-blockscout.scroll.io/address/0x09F9A7cd11BE8468064b06FF20Dce43E0A434a2A
  address internal constant DAI_V_TOKEN = 0x09F9A7cd11BE8468064b06FF20Dce43E0A434a2A;

  // https://sepolia-blockscout.scroll.io/address/0x94Bb76d2420C1F083c53061CA862619D6056fdFE
  address internal constant DAI_S_TOKEN = 0x94Bb76d2420C1F083c53061CA862619D6056fdFE;

  // https://sepolia-blockscout.scroll.io/address/0x58A5C0E02CF344c538F4Cf8d3EFC51e7c134B31A
  address internal constant DAI_ORACLE = 0x58A5C0E02CF344c538F4Cf8d3EFC51e7c134B31A;

  // https://sepolia-blockscout.scroll.io/address/0x85AD5a4a0974b6092d1F7369eC39c8b2255b8e6f
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0x85AD5a4a0974b6092d1F7369eC39c8b2255b8e6f;

  // https://sepolia-blockscout.scroll.io/address/0x279cBF5B7e3651F03CB9b71A9E7A3c924b267801
  address internal constant LINK_UNDERLYING = 0x279cBF5B7e3651F03CB9b71A9E7A3c924b267801;

  uint8 internal constant LINK_DECIMALS = 18;

  // https://sepolia-blockscout.scroll.io/address/0x55DD1cDFE13fCa68F6D14D452E2a20cABe191841
  address internal constant LINK_A_TOKEN = 0x55DD1cDFE13fCa68F6D14D452E2a20cABe191841;

  // https://sepolia-blockscout.scroll.io/address/0x2f42470c67aA2f6D7d2855FBB691179a6Dba4822
  address internal constant LINK_V_TOKEN = 0x2f42470c67aA2f6D7d2855FBB691179a6Dba4822;

  // https://sepolia-blockscout.scroll.io/address/0x89Bb2A2904E89A90559e423Ec8ec00cc2E127146
  address internal constant LINK_S_TOKEN = 0x89Bb2A2904E89A90559e423Ec8ec00cc2E127146;

  // https://sepolia-blockscout.scroll.io/address/0x01BdbF85210e113db2216e837D9b1e401eb7003e
  address internal constant LINK_ORACLE = 0x01BdbF85210e113db2216e837D9b1e401eb7003e;

  // https://sepolia-blockscout.scroll.io/address/0x9a8D012c2e26cE911AD211976aa06Ca020487389
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x9a8D012c2e26cE911AD211976aa06Ca020487389;

  // https://sepolia-blockscout.scroll.io/address/0x2C9678042D52B97D27f2bD2947F7111d93F3dD0D
  address internal constant USDC_UNDERLYING = 0x2C9678042D52B97D27f2bD2947F7111d93F3dD0D;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://sepolia-blockscout.scroll.io/address/0x6E4A1BcBd3C3038e6957207cadC1A17092DC7ba3
  address internal constant USDC_A_TOKEN = 0x6E4A1BcBd3C3038e6957207cadC1A17092DC7ba3;

  // https://sepolia-blockscout.scroll.io/address/0x6ED2eB0A4141975A8A33558234137265f36055f7
  address internal constant USDC_V_TOKEN = 0x6ED2eB0A4141975A8A33558234137265f36055f7;

  // https://sepolia-blockscout.scroll.io/address/0x307a974951cb1a06635432c40C8efDbc5C67446D
  address internal constant USDC_S_TOKEN = 0x307a974951cb1a06635432c40C8efDbc5C67446D;

  // https://sepolia-blockscout.scroll.io/address/0xB1732127A07B05e6Ea1FA53c8B791560Ff768439
  address internal constant USDC_ORACLE = 0xB1732127A07B05e6Ea1FA53c8B791560Ff768439;

  // https://sepolia-blockscout.scroll.io/address/0x9c41A3E545126Cc2c160634405E00461Ec30F709
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x9c41A3E545126Cc2c160634405E00461Ec30F709;

  // https://sepolia-blockscout.scroll.io/address/0x5EA79f3190ff37418d42F9B2618688494dBD9693
  address internal constant WBTC_UNDERLYING = 0x5EA79f3190ff37418d42F9B2618688494dBD9693;

  uint8 internal constant WBTC_DECIMALS = 8;

  // https://sepolia-blockscout.scroll.io/address/0x43AE2a14AD923915aa85d683D1b7d0d320ae87B2
  address internal constant WBTC_A_TOKEN = 0x43AE2a14AD923915aa85d683D1b7d0d320ae87B2;

  // https://sepolia-blockscout.scroll.io/address/0x52a011bF32a85D952aa259D85b705b7cF040836f
  address internal constant WBTC_V_TOKEN = 0x52a011bF32a85D952aa259D85b705b7cF040836f;

  // https://sepolia-blockscout.scroll.io/address/0x0e78aC6Bf2a391bbBD15C3DEFadeC7B5d9f00343
  address internal constant WBTC_S_TOKEN = 0x0e78aC6Bf2a391bbBD15C3DEFadeC7B5d9f00343;

  // https://sepolia-blockscout.scroll.io/address/0xb09f1850207Af7AFcd564632bB541B7b3c776006
  address internal constant WBTC_ORACLE = 0xb09f1850207Af7AFcd564632bB541B7b3c776006;

  // https://sepolia-blockscout.scroll.io/address/0x9a8D012c2e26cE911AD211976aa06Ca020487389
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x9a8D012c2e26cE911AD211976aa06Ca020487389;

  // https://sepolia-blockscout.scroll.io/address/0xb123dCe044EdF0a755505d9623Fba16C0F41cae9
  address internal constant WETH_UNDERLYING = 0xb123dCe044EdF0a755505d9623Fba16C0F41cae9;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://sepolia-blockscout.scroll.io/address/0x9E8CEC4F2F4596141B62e88966D7167E9db555aD
  address internal constant WETH_A_TOKEN = 0x9E8CEC4F2F4596141B62e88966D7167E9db555aD;

  // https://sepolia-blockscout.scroll.io/address/0xD502CD7A595ec36992b0601fae0A4b50A88084D4
  address internal constant WETH_V_TOKEN = 0xD502CD7A595ec36992b0601fae0A4b50A88084D4;

  // https://sepolia-blockscout.scroll.io/address/0xeab312503904945BfeC5d56dFaC03d69Ef11DdE5
  address internal constant WETH_S_TOKEN = 0xeab312503904945BfeC5d56dFaC03d69Ef11DdE5;

  // https://sepolia-blockscout.scroll.io/address/0xA0579Ea869d26CE4dfED0b65b54A08A4BdF3F5A8
  address internal constant WETH_ORACLE = 0xA0579Ea869d26CE4dfED0b65b54A08A4BdF3F5A8;

  // https://sepolia-blockscout.scroll.io/address/0x9a8D012c2e26cE911AD211976aa06Ca020487389
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x9a8D012c2e26cE911AD211976aa06Ca020487389;

  // https://sepolia-blockscout.scroll.io/address/0x186C0C26c45A8DA1Da34339ee513624a9609156d
  address internal constant USDT_UNDERLYING = 0x186C0C26c45A8DA1Da34339ee513624a9609156d;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://sepolia-blockscout.scroll.io/address/0x54Cb3ba40705d7CCB18c1C24edD8B602a88eF4CE
  address internal constant USDT_A_TOKEN = 0x54Cb3ba40705d7CCB18c1C24edD8B602a88eF4CE;

  // https://sepolia-blockscout.scroll.io/address/0x4cB0Dd10789208630F4def0DAAB4161f4Bb7b09D
  address internal constant USDT_V_TOKEN = 0x4cB0Dd10789208630F4def0DAAB4161f4Bb7b09D;

  // https://sepolia-blockscout.scroll.io/address/0x197E7980a9A5b2BE23345A492612FBb53317fb1D
  address internal constant USDT_S_TOKEN = 0x197E7980a9A5b2BE23345A492612FBb53317fb1D;

  // https://sepolia-blockscout.scroll.io/address/0x2d00F2DBA40e677E23AC442B5ab932Ce699d163e
  address internal constant USDT_ORACLE = 0x2d00F2DBA40e677E23AC442B5ab932Ce699d163e;

  // https://sepolia-blockscout.scroll.io/address/0x9c41A3E545126Cc2c160634405E00461Ec30F709
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x9c41A3E545126Cc2c160634405E00461Ec30F709;

  // https://sepolia-blockscout.scroll.io/address/0xfc2921bE7B2762F0E87039905d6019B0fF5978a8
  address internal constant AAVE_UNDERLYING = 0xfc2921bE7B2762F0E87039905d6019B0fF5978a8;

  uint8 internal constant AAVE_DECIMALS = 18;

  // https://sepolia-blockscout.scroll.io/address/0xC5209E1325A0DBeb28143D82e7E1DE709456Fc8a
  address internal constant AAVE_A_TOKEN = 0xC5209E1325A0DBeb28143D82e7E1DE709456Fc8a;

  // https://sepolia-blockscout.scroll.io/address/0x7AE95AD823943283c3D5b7E9bE5E24414ba980cD
  address internal constant AAVE_V_TOKEN = 0x7AE95AD823943283c3D5b7E9bE5E24414ba980cD;

  // https://sepolia-blockscout.scroll.io/address/0xD6CB6AE9f09eD5ffE6e0374482F9D64707Df061C
  address internal constant AAVE_S_TOKEN = 0xD6CB6AE9f09eD5ffE6e0374482F9D64707Df061C;

  // https://sepolia-blockscout.scroll.io/address/0x79fb53cF4Ba1B59E07Eeed92D641F8374DaAFC8f
  address internal constant AAVE_ORACLE = 0x79fb53cF4Ba1B59E07Eeed92D641F8374DaAFC8f;

  // https://sepolia-blockscout.scroll.io/address/0x9a8D012c2e26cE911AD211976aa06Ca020487389
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x9a8D012c2e26cE911AD211976aa06Ca020487389;

  // https://sepolia-blockscout.scroll.io/address/0xDf40f3a3566b4271450083f1Ad5732590BA47575
  address internal constant EURS_UNDERLYING = 0xDf40f3a3566b4271450083f1Ad5732590BA47575;

  uint8 internal constant EURS_DECIMALS = 2;

  // https://sepolia-blockscout.scroll.io/address/0xD49d1CF2886B1c95A94e8a9066E8b298646716b6
  address internal constant EURS_A_TOKEN = 0xD49d1CF2886B1c95A94e8a9066E8b298646716b6;

  // https://sepolia-blockscout.scroll.io/address/0x2160F75FB89A6C35Bd59Ecf120B26f459956c925
  address internal constant EURS_V_TOKEN = 0x2160F75FB89A6C35Bd59Ecf120B26f459956c925;

  // https://sepolia-blockscout.scroll.io/address/0x5D77C7207385a3D2A731f13E555066B209a2b9fc
  address internal constant EURS_S_TOKEN = 0x5D77C7207385a3D2A731f13E555066B209a2b9fc;

  // https://sepolia-blockscout.scroll.io/address/0xC6C58919440AD9daBF04D85b29820477AE7E808E
  address internal constant EURS_ORACLE = 0xC6C58919440AD9daBF04D85b29820477AE7E808E;

  // https://sepolia-blockscout.scroll.io/address/0x9c41A3E545126Cc2c160634405E00461Ec30F709
  address internal constant EURS_INTEREST_RATE_STRATEGY =
    0x9c41A3E545126Cc2c160634405E00461Ec30F709;
}

library AaveV3ScrollSepoliaEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant STABLECOINS = 1;
}
