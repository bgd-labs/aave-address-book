// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from './AaveV2.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV2EthereumAMM {
  // https://etherscan.io/address/0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5
  ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    ILendingPoolAddressesProvider(0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5);

  // https://etherscan.io/address/0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB
  ILendingPool internal constant POOL = ILendingPool(0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB);

  // https://etherscan.io/address/0xb9184a4480830bf89B55b73631E287Df9079F466
  address internal constant POOL_IMPL = 0xb9184a4480830bf89B55b73631E287Df9079F466;

  // https://etherscan.io/address/0x23A875eDe3F1030138701683e42E9b16A7F87768
  ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
    ILendingPoolConfigurator(0x23A875eDe3F1030138701683e42E9b16A7F87768);

  // https://etherscan.io/address/0x9f3Cc7b6f5F75d97735763c22cb280dbF90f17a2
  address internal constant POOL_CONFIGURATOR_IMPL = 0x9f3Cc7b6f5F75d97735763c22cb280dbF90f17a2;

  // https://etherscan.io/address/0xA50ba011c48153De246E5192C8f9258A2ba79Ca9
  IAaveOracle internal constant ORACLE = IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9);

  // https://etherscan.io/address/0x8A32f49FFbA88aba6EFF96F45D8BD1D4b3f35c7D
  ILendingRateOracle internal constant LENDING_RATE_ORACLE =
    ILendingRateOracle(0x8A32f49FFbA88aba6EFF96F45D8BD1D4b3f35c7D);

  // https://etherscan.io/address/0xc443AD9DDE3cecfB9dfC5736578f447aFE3590ba
  IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IAaveProtocolDataProvider(0xc443AD9DDE3cecfB9dfC5736578f447aFE3590ba);

  // https://etherscan.io/address/0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A
  address internal constant POOL_ADMIN = 0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A;

  // https://etherscan.io/address/0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633
  address internal constant EMERGENCY_ADMIN = 0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633;

  // https://etherscan.io/address/0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c
  ICollector internal constant COLLECTOR = ICollector(0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c);

  // https://etherscan.io/address/0x368e6441bB27159c6e8e6d3bbd9147BEcBA915E3
  address internal constant LENDING_POOL_COLLATERAL_MANAGER =
    0x368e6441bB27159c6e8e6d3bbd9147BEcBA915E3;

  // https://etherscan.io/address/0xcfC26009618ec2Ca8787180116a37Caa354a465C
  address internal constant CONFIG_ENGINE = 0xcfC26009618ec2Ca8787180116a37Caa354a465C;

  // https://etherscan.io/address/0x3cd1dFB81C50A5300C60a181ED145a7286d81e0a
  address internal constant MIGRATION_HELPER = 0x3cd1dFB81C50A5300C60a181ED145a7286d81e0a;

  // https://etherscan.io/address/0x52D306e36E3B6B02c153d0266ff0f85d18BCD413
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x52D306e36E3B6B02c153d0266ff0f85d18BCD413;

  // https://etherscan.io/address/0x6e4D068105052C3877116DCF86f5FF36B7eCa2B8
  address internal constant RATES_FACTORY = 0x6e4D068105052C3877116DCF86f5FF36B7eCa2B8;

  // https://etherscan.io/address/0xD01ab9a6577E1D84F142e44D49380e23A340387d
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xD01ab9a6577E1D84F142e44D49380e23A340387d;

  // https://etherscan.io/address/0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A
  address internal constant UI_POOL_DATA_PROVIDER = 0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A;

  // https://etherscan.io/address/0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922
  address internal constant WALLET_BALANCE_PROVIDER = 0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922;

  // https://etherscan.io/address/0xbe9a7B3F2f54E18D7C0a17B03ad84Ac2D1D28eAC
  address internal constant WETH_GATEWAY = 0xbe9a7B3F2f54E18D7C0a17B03ad84Ac2D1D28eAC;
}

library AaveV2EthereumAMMAssets {
  // https://etherscan.io/address/0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
  address internal constant WETH_UNDERLYING = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xf9Fb4AD91812b704Ba883B11d2B576E890a6730A
  address internal constant WETH_A_TOKEN = 0xf9Fb4AD91812b704Ba883B11d2B576E890a6730A;

  // https://etherscan.io/address/0xA4C273d9A0C1fe2674F0E845160d6232768a3064
  address internal constant WETH_V_TOKEN = 0xA4C273d9A0C1fe2674F0E845160d6232768a3064;

  // https://etherscan.io/address/0xdb838A27f91b112D722c854636F2c23720ea007E
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xdb838A27f91b112D722c854636F2c23720ea007E;

  // https://etherscan.io/address/0x6B175474E89094C44Da98b954EedeAC495271d0F
  address internal constant DAI_UNDERLYING = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

  uint8 internal constant DAI_DECIMALS = 18;

  // https://etherscan.io/address/0x79bE75FFC64DD58e66787E4Eae470c8a1FD08ba4
  address internal constant DAI_A_TOKEN = 0x79bE75FFC64DD58e66787E4Eae470c8a1FD08ba4;

  // https://etherscan.io/address/0x3F4fA4937E72991367DC32687BC3278f095E7EAa
  address internal constant DAI_V_TOKEN = 0x3F4fA4937E72991367DC32687BC3278f095E7EAa;

  // https://etherscan.io/address/0xd486FE27AAB0b3CAd1462D767292dd7a84F06E58
  address internal constant DAI_ORACLE = 0xd486FE27AAB0b3CAd1462D767292dd7a84F06E58;

  // https://etherscan.io/address/0xA57cDBfE9FA29Ad842f53100d68789999c04AA36
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xA57cDBfE9FA29Ad842f53100d68789999c04AA36;

  // https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
  address internal constant USDC_UNDERLYING = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://etherscan.io/address/0xd24946147829DEaA935bE2aD85A3291dbf109c80
  address internal constant USDC_A_TOKEN = 0xd24946147829DEaA935bE2aD85A3291dbf109c80;

  // https://etherscan.io/address/0xCFDC74b97b69319683fec2A4Ef95c4Ab739F1B12
  address internal constant USDC_V_TOKEN = 0xCFDC74b97b69319683fec2A4Ef95c4Ab739F1B12;

  // https://etherscan.io/address/0x9f2817536Cfd48BF59243d9D8802a5670F5Be05d
  address internal constant USDC_ORACLE = 0x9f2817536Cfd48BF59243d9D8802a5670F5Be05d;

  // https://etherscan.io/address/0xA57cDBfE9FA29Ad842f53100d68789999c04AA36
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0xA57cDBfE9FA29Ad842f53100d68789999c04AA36;

  // https://etherscan.io/address/0xdAC17F958D2ee523a2206206994597C13D831ec7
  address internal constant USDT_UNDERLYING = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://etherscan.io/address/0x17a79792Fe6fE5C95dFE95Fe3fCEE3CAf4fE4Cb7
  address internal constant USDT_A_TOKEN = 0x17a79792Fe6fE5C95dFE95Fe3fCEE3CAf4fE4Cb7;

  // https://etherscan.io/address/0xDcFE9BfC246b02Da384de757464a35eFCa402797
  address internal constant USDT_V_TOKEN = 0xDcFE9BfC246b02Da384de757464a35eFCa402797;

  // https://etherscan.io/address/0xEfF57B0c8987eea8C491bdDD2F64c1c21297Cf74
  address internal constant USDT_ORACLE = 0xEfF57B0c8987eea8C491bdDD2F64c1c21297Cf74;

  // https://etherscan.io/address/0x2223cd25f60F3e4035fcEfE44612773AFEbFd8ab
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x2223cd25f60F3e4035fcEfE44612773AFEbFd8ab;

  // https://etherscan.io/address/0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599
  address internal constant WBTC_UNDERLYING = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;

  uint8 internal constant WBTC_DECIMALS = 8;

  // https://etherscan.io/address/0x13B2f6928D7204328b0E8E4BCd0379aA06EA21FA
  address internal constant WBTC_A_TOKEN = 0x13B2f6928D7204328b0E8E4BCd0379aA06EA21FA;

  // https://etherscan.io/address/0x3b99fdaFdfE70d65101a4ba8cDC35dAFbD26375f
  address internal constant WBTC_V_TOKEN = 0x3b99fdaFdfE70d65101a4ba8cDC35dAFbD26375f;

  // https://etherscan.io/address/0xFD858c8bC5ac5e10f01018bC78471bb0DC392247
  address internal constant WBTC_ORACLE = 0xFD858c8bC5ac5e10f01018bC78471bb0DC392247;

  // https://etherscan.io/address/0xd102F58BF7B2509A2d8664be7C4A90102526B5c6
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0xd102F58BF7B2509A2d8664be7C4A90102526B5c6;

  // https://etherscan.io/address/0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11
  address internal constant UNI_DAI_WETH_UNDERLYING = 0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11;

  uint8 internal constant UNI_DAI_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x9303EabC860a743aABcc3A1629014CaBcc3F8D36
  address internal constant UNI_DAI_WETH_A_TOKEN = 0x9303EabC860a743aABcc3A1629014CaBcc3F8D36;

  // https://etherscan.io/address/0x23bcc861b989762275165d08B127911F09c71628
  address internal constant UNI_DAI_WETH_V_TOKEN = 0x23bcc861b989762275165d08B127911F09c71628;

  // https://etherscan.io/address/0x66A6b87A18DB78086acda75b7720DC47CdABcC05
  address internal constant UNI_DAI_WETH_ORACLE = 0x66A6b87A18DB78086acda75b7720DC47CdABcC05;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_DAI_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xBb2b8038a1640196FbE3e38816F3e67Cba72D940
  address internal constant UNI_WBTC_WETH_UNDERLYING = 0xBb2b8038a1640196FbE3e38816F3e67Cba72D940;

  uint8 internal constant UNI_WBTC_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xc58F53A8adff2fB4eb16ED56635772075E2EE123
  address internal constant UNI_WBTC_WETH_A_TOKEN = 0xc58F53A8adff2fB4eb16ED56635772075E2EE123;

  // https://etherscan.io/address/0x02aAeB4C7736177242Ee0f71f6f6A0F057Aba87d
  address internal constant UNI_WBTC_WETH_V_TOKEN = 0x02aAeB4C7736177242Ee0f71f6f6A0F057Aba87d;

  // https://etherscan.io/address/0x7004BB6F2013F13C54899309cCa029B49707E547
  address internal constant UNI_WBTC_WETH_ORACLE = 0x7004BB6F2013F13C54899309cCa029B49707E547;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_WBTC_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xDFC14d2Af169B0D36C4EFF567Ada9b2E0CAE044f
  address internal constant UNI_AAVE_WETH_UNDERLYING = 0xDFC14d2Af169B0D36C4EFF567Ada9b2E0CAE044f;

  uint8 internal constant UNI_AAVE_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xe59d2FF6995a926A574390824a657eEd36801E55
  address internal constant UNI_AAVE_WETH_A_TOKEN = 0xe59d2FF6995a926A574390824a657eEd36801E55;

  // https://etherscan.io/address/0x859ED7D9E92d1fe42fF95C3BC3a62F7cB59C373E
  address internal constant UNI_AAVE_WETH_V_TOKEN = 0x859ED7D9E92d1fe42fF95C3BC3a62F7cB59C373E;

  // https://etherscan.io/address/0xB525547968610395B60085bDc8033FFeaEaa5F64
  address internal constant UNI_AAVE_WETH_ORACLE = 0xB525547968610395B60085bDc8033FFeaEaa5F64;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_AAVE_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xB6909B960DbbE7392D405429eB2b3649752b4838
  address internal constant UNI_BAT_WETH_UNDERLYING = 0xB6909B960DbbE7392D405429eB2b3649752b4838;

  uint8 internal constant UNI_BAT_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xA1B0edF4460CC4d8bFAA18Ed871bFF15E5b57Eb4
  address internal constant UNI_BAT_WETH_A_TOKEN = 0xA1B0edF4460CC4d8bFAA18Ed871bFF15E5b57Eb4;

  // https://etherscan.io/address/0x3Fbef89A21Dc836275bC912849627b33c61b09b4
  address internal constant UNI_BAT_WETH_V_TOKEN = 0x3Fbef89A21Dc836275bC912849627b33c61b09b4;

  // https://etherscan.io/address/0xB394D8a1CE721630Cbea8Ec110DCEf0D283EDE3a
  address internal constant UNI_BAT_WETH_ORACLE = 0xB394D8a1CE721630Cbea8Ec110DCEf0D283EDE3a;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_BAT_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xAE461cA67B15dc8dc81CE7615e0320dA1A9aB8D5
  address internal constant UNI_DAI_USDC_UNDERLYING = 0xAE461cA67B15dc8dc81CE7615e0320dA1A9aB8D5;

  uint8 internal constant UNI_DAI_USDC_DECIMALS = 18;

  // https://etherscan.io/address/0xE340B25fE32B1011616bb8EC495A4d503e322177
  address internal constant UNI_DAI_USDC_A_TOKEN = 0xE340B25fE32B1011616bb8EC495A4d503e322177;

  // https://etherscan.io/address/0x925E3FDd927E20e33C3177C4ff6fb72aD1133C87
  address internal constant UNI_DAI_USDC_V_TOKEN = 0x925E3FDd927E20e33C3177C4ff6fb72aD1133C87;

  // https://etherscan.io/address/0x3B148Fa5E8297DB64262442052b227328730EA81
  address internal constant UNI_DAI_USDC_ORACLE = 0x3B148Fa5E8297DB64262442052b227328730EA81;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_DAI_USDC_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x3dA1313aE46132A397D90d95B1424A9A7e3e0fCE
  address internal constant UNI_CRV_WETH_UNDERLYING = 0x3dA1313aE46132A397D90d95B1424A9A7e3e0fCE;

  uint8 internal constant UNI_CRV_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x0ea20e7fFB006d4Cfe84df2F72d8c7bD89247DB0
  address internal constant UNI_CRV_WETH_A_TOKEN = 0x0ea20e7fFB006d4Cfe84df2F72d8c7bD89247DB0;

  // https://etherscan.io/address/0xF3f1a76cA6356a908CdCdE6b2AC2eaace3739Cd0
  address internal constant UNI_CRV_WETH_V_TOKEN = 0xF3f1a76cA6356a908CdCdE6b2AC2eaace3739Cd0;

  // https://etherscan.io/address/0x10F7078e2f29802D2AC78045F61A69aE0883535A
  address internal constant UNI_CRV_WETH_ORACLE = 0x10F7078e2f29802D2AC78045F61A69aE0883535A;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_CRV_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xa2107FA5B38d9bbd2C461D6EDf11B11A50F6b974
  address internal constant UNI_LINK_WETH_UNDERLYING = 0xa2107FA5B38d9bbd2C461D6EDf11B11A50F6b974;

  uint8 internal constant UNI_LINK_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xb8db81B84d30E2387de0FF330420A4AAA6688134
  address internal constant UNI_LINK_WETH_A_TOKEN = 0xb8db81B84d30E2387de0FF330420A4AAA6688134;

  // https://etherscan.io/address/0xeDe4052ed8e1F422F4E5062c679f6B18693fEcdc
  address internal constant UNI_LINK_WETH_V_TOKEN = 0xeDe4052ed8e1F422F4E5062c679f6B18693fEcdc;

  // https://etherscan.io/address/0x30adCEfA5d483284FD79E1eFd54ED3e0A8eaA632
  address internal constant UNI_LINK_WETH_ORACLE = 0x30adCEfA5d483284FD79E1eFd54ED3e0A8eaA632;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_LINK_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xC2aDdA861F89bBB333c90c492cB837741916A225
  address internal constant UNI_MKR_WETH_UNDERLYING = 0xC2aDdA861F89bBB333c90c492cB837741916A225;

  uint8 internal constant UNI_MKR_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x370adc71f67f581158Dc56f539dF5F399128Ddf9
  address internal constant UNI_MKR_WETH_A_TOKEN = 0x370adc71f67f581158Dc56f539dF5F399128Ddf9;

  // https://etherscan.io/address/0xf36C394775285F89bBBDF09533421E3e81e8447c
  address internal constant UNI_MKR_WETH_V_TOKEN = 0xf36C394775285F89bBBDF09533421E3e81e8447c;

  // https://etherscan.io/address/0xEBF4A448ff3D835F8FA883941a3E9D5E74B40B5E
  address internal constant UNI_MKR_WETH_ORACLE = 0xEBF4A448ff3D835F8FA883941a3E9D5E74B40B5E;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_MKR_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x8Bd1661Da98EBDd3BD080F0bE4e6d9bE8cE9858c
  address internal constant UNI_REN_WETH_UNDERLYING = 0x8Bd1661Da98EBDd3BD080F0bE4e6d9bE8cE9858c;

  uint8 internal constant UNI_REN_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xA9e201A4e269d6cd5E9F0FcbcB78520cf815878B
  address internal constant UNI_REN_WETH_A_TOKEN = 0xA9e201A4e269d6cd5E9F0FcbcB78520cf815878B;

  // https://etherscan.io/address/0x2A8d5B1c1de15bfcd5EC41368C0295c60D8Da83c
  address internal constant UNI_REN_WETH_V_TOKEN = 0x2A8d5B1c1de15bfcd5EC41368C0295c60D8Da83c;

  // https://etherscan.io/address/0xe2f7C06906A9dB063C28EB5c71B6Ab454e5222dD
  address internal constant UNI_REN_WETH_ORACLE = 0xe2f7C06906A9dB063C28EB5c71B6Ab454e5222dD;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_REN_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x43AE24960e5534731Fc831386c07755A2dc33D47
  address internal constant UNI_SNX_WETH_UNDERLYING = 0x43AE24960e5534731Fc831386c07755A2dc33D47;

  uint8 internal constant UNI_SNX_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x38E491A71291CD43E8DE63b7253E482622184894
  address internal constant UNI_SNX_WETH_A_TOKEN = 0x38E491A71291CD43E8DE63b7253E482622184894;

  // https://etherscan.io/address/0xfd15008efA339A2390B48d2E0Ca8Abd523b406d3
  address internal constant UNI_SNX_WETH_V_TOKEN = 0xfd15008efA339A2390B48d2E0Ca8Abd523b406d3;

  // https://etherscan.io/address/0x29bfee7E90572Abf1088a58a145a10D051b78E46
  address internal constant UNI_SNX_WETH_ORACLE = 0x29bfee7E90572Abf1088a58a145a10D051b78E46;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_SNX_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xd3d2E2692501A5c9Ca623199D38826e513033a17
  address internal constant UNI_UNI_WETH_UNDERLYING = 0xd3d2E2692501A5c9Ca623199D38826e513033a17;

  uint8 internal constant UNI_UNI_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x3D26dcd840fCC8e4B2193AcE8A092e4a65832F9f
  address internal constant UNI_UNI_WETH_A_TOKEN = 0x3D26dcd840fCC8e4B2193AcE8A092e4a65832F9f;

  // https://etherscan.io/address/0x0D878FbB01fbEEa7ddEFb896d56f1D3167af919F
  address internal constant UNI_UNI_WETH_V_TOKEN = 0x0D878FbB01fbEEa7ddEFb896d56f1D3167af919F;

  // https://etherscan.io/address/0xC2E93e8121237A885A00627975eB06C7BF9808d6
  address internal constant UNI_UNI_WETH_ORACLE = 0xC2E93e8121237A885A00627975eB06C7BF9808d6;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_UNI_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc
  address internal constant UNI_USDC_WETH_UNDERLYING = 0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc;

  uint8 internal constant UNI_USDC_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x391E86e2C002C70dEe155eAceB88F7A3c38f5976
  address internal constant UNI_USDC_WETH_A_TOKEN = 0x391E86e2C002C70dEe155eAceB88F7A3c38f5976;

  // https://etherscan.io/address/0x26625d1dDf520fC8D975cc68eC6E0391D9d3Df61
  address internal constant UNI_USDC_WETH_V_TOKEN = 0x26625d1dDf520fC8D975cc68eC6E0391D9d3Df61;

  // https://etherscan.io/address/0x71c4a2173CE3620982DC8A7D870297533360Da4E
  address internal constant UNI_USDC_WETH_ORACLE = 0x71c4a2173CE3620982DC8A7D870297533360Da4E;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_USDC_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x004375Dff511095CC5A197A54140a24eFEF3A416
  address internal constant UNI_WBTC_USDC_UNDERLYING = 0x004375Dff511095CC5A197A54140a24eFEF3A416;

  uint8 internal constant UNI_WBTC_USDC_DECIMALS = 18;

  // https://etherscan.io/address/0x2365a4890eD8965E564B7E2D27C38Ba67Fec4C6F
  address internal constant UNI_WBTC_USDC_A_TOKEN = 0x2365a4890eD8965E564B7E2D27C38Ba67Fec4C6F;

  // https://etherscan.io/address/0x36dA0C5dC23397CBf9D13BbD74E93C04f99633Af
  address internal constant UNI_WBTC_USDC_V_TOKEN = 0x36dA0C5dC23397CBf9D13BbD74E93C04f99633Af;

  // https://etherscan.io/address/0x11f4ba2227F21Dc2A9F0b0e6Ea740369d580a212
  address internal constant UNI_WBTC_USDC_ORACLE = 0x11f4ba2227F21Dc2A9F0b0e6Ea740369d580a212;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_WBTC_USDC_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x2fDbAdf3C4D5A8666Bc06645B8358ab803996E28
  address internal constant UNI_YFI_WETH_UNDERLYING = 0x2fDbAdf3C4D5A8666Bc06645B8358ab803996E28;

  uint8 internal constant UNI_YFI_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x5394794Be8b6eD5572FCd6b27103F46b5F390E8f
  address internal constant UNI_YFI_WETH_A_TOKEN = 0x5394794Be8b6eD5572FCd6b27103F46b5F390E8f;

  // https://etherscan.io/address/0xDf70Bdf01a3eBcd0D918FF97390852A914a92Df7
  address internal constant UNI_YFI_WETH_V_TOKEN = 0xDf70Bdf01a3eBcd0D918FF97390852A914a92Df7;

  // https://etherscan.io/address/0x664223b8Bb0934aE0970e601F452f75AaCe9Aa2A
  address internal constant UNI_YFI_WETH_ORACLE = 0x664223b8Bb0934aE0970e601F452f75AaCe9Aa2A;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant UNI_YFI_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x1efF8aF5D577060BA4ac8A29A13525bb0Ee2A3D5
  address internal constant BPT_WBTC_WETH_UNDERLYING = 0x1efF8aF5D577060BA4ac8A29A13525bb0Ee2A3D5;

  uint8 internal constant BPT_WBTC_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0x358bD0d980E031E23ebA9AA793926857703783BD
  address internal constant BPT_WBTC_WETH_A_TOKEN = 0x358bD0d980E031E23ebA9AA793926857703783BD;

  // https://etherscan.io/address/0xF655DF3832859cfB0AcfD88eDff3452b9Aa6Db24
  address internal constant BPT_WBTC_WETH_V_TOKEN = 0xF655DF3832859cfB0AcfD88eDff3452b9Aa6Db24;

  // https://etherscan.io/address/0x4CA8D8fC2b4fCe8A2dcB71Da884bba042d48E067
  address internal constant BPT_WBTC_WETH_ORACLE = 0x4CA8D8fC2b4fCe8A2dcB71Da884bba042d48E067;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant BPT_WBTC_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x59A19D8c652FA0284f44113D0ff9aBa70bd46fB4
  address internal constant BPT_BAL_WETH_UNDERLYING = 0x59A19D8c652FA0284f44113D0ff9aBa70bd46fB4;

  uint8 internal constant BPT_BAL_WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xd109b2A304587569c84308c55465cd9fF0317bFB
  address internal constant BPT_BAL_WETH_A_TOKEN = 0xd109b2A304587569c84308c55465cd9fF0317bFB;

  // https://etherscan.io/address/0xF41A5Cc7a61519B08056176d7B4b87AB34dF55AD
  address internal constant BPT_BAL_WETH_V_TOKEN = 0xF41A5Cc7a61519B08056176d7B4b87AB34dF55AD;

  // https://etherscan.io/address/0x2e4e78936b100be6Ef85BCEf7FB25bC770B02B85
  address internal constant BPT_BAL_WETH_ORACLE = 0x2e4e78936b100be6Ef85BCEf7FB25bC770B02B85;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant BPT_BAL_WETH_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0x50379f632ca68D36E50cfBC8F78fe16bd1499d1e
  address internal constant GUNI_DAI_USDC_UNDERLYING = 0x50379f632ca68D36E50cfBC8F78fe16bd1499d1e;

  uint8 internal constant GUNI_DAI_USDC_DECIMALS = 18;

  // https://etherscan.io/address/0xd145c6ae8931ed5Bca9b5f5B7dA5991F5aB63B5c
  address internal constant GUNI_DAI_USDC_A_TOKEN = 0xd145c6ae8931ed5Bca9b5f5B7dA5991F5aB63B5c;

  // https://etherscan.io/address/0x40533CC601Ec5b79B00D76348ADc0c81d93d926D
  address internal constant GUNI_DAI_USDC_V_TOKEN = 0x40533CC601Ec5b79B00D76348ADc0c81d93d926D;

  // https://etherscan.io/address/0x7843eA2E3e60b24cc12B56C5627Adc7F9f0749D6
  address internal constant GUNI_DAI_USDC_ORACLE = 0x7843eA2E3e60b24cc12B56C5627Adc7F9f0749D6;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant GUNI_DAI_USDC_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;

  // https://etherscan.io/address/0xD2eeC91055F07fE24C9cCB25828ecfEFd4be0c41
  address internal constant GUNI_USDC_USDT_UNDERLYING = 0xD2eeC91055F07fE24C9cCB25828ecfEFd4be0c41;

  uint8 internal constant GUNI_USDC_USDT_DECIMALS = 18;

  // https://etherscan.io/address/0xCa5DFDABBfFD58cfD49A9f78Ca52eC8e0591a3C5
  address internal constant GUNI_USDC_USDT_A_TOKEN = 0xCa5DFDABBfFD58cfD49A9f78Ca52eC8e0591a3C5;

  // https://etherscan.io/address/0x0B7c7d9c5548A23D0455d1edeC541cc2AD955a9d
  address internal constant GUNI_USDC_USDT_V_TOKEN = 0x0B7c7d9c5548A23D0455d1edeC541cc2AD955a9d;

  // https://etherscan.io/address/0x399e3bb2BBd49c570aa6edc6ac390E0D0aCbbD5e
  address internal constant GUNI_USDC_USDT_ORACLE = 0x399e3bb2BBd49c570aa6edc6ac390E0D0aCbbD5e;

  // https://etherscan.io/address/0x52E39422cd86a12a13773D86af5FdBF5665989aD
  address internal constant GUNI_USDC_USDT_INTEREST_RATE_STRATEGY =
    0x52E39422cd86a12a13773D86af5FdBF5665989aD;
}
