// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3Sepolia {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x0496275d34753A48320CA58103d5220d394FF77F);

  IPool internal constant POOL = IPool(0xE7EC1B0015eb2ADEedb1B7f9F1Ce82F9DAD6dF08);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x9EB3fd3b5b405c29825dD5eEB7b31A08f9510397);

  IAaveOracle internal constant ORACLE = IAaveOracle(0x132C06E86CcCf93Afef7B33f0FF3e2E97EECf8f6);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xC7832d5ACDDbdA5a7c9d1Fa9F677f9a84b7a4125);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x3F7E88aD1938634150A3480ac5a58706F7a7655A);

  address internal constant ACL_ADMIN = 0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00;

  ICollector internal constant COLLECTOR = ICollector(0x3246D6476dCc255b64342911D267F6CA3013068d);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x74269d0f5f1C2C44663f0214f2EE42c00a144460;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x177F4611B27Cb66f5E6A51B4DD956f37A75F883B;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xfbC748B4f6FFB9997B8dcC10Fb7494620747a82c;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x61e11abA0Ea933700A74155C845b8ED6C200aCc8;

  address internal constant EMISSION_MANAGER = 0x139D4efdDAaC44dfbF1Fbe9b23A635663ebfD4Af;

  address internal constant WETH_GATEWAY = 0xe70cDC67C91d5519DD4682cA162E40480773255a;

  address internal constant FAUCET = 0x1f885520b7BD528E46b390040F12E753Dce43004;

  address internal constant WALLET_BALANCE_PROVIDER = 0x4f04218ECC7D2756f84836D2DC267293504cAbCc;

  address internal constant UI_POOL_DATA_PROVIDER = 0xe38c93180a6CE4173d88793c0671AD1Dd417c7d8;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x7cE1062e0688BC3D7699987A38bba84353F69881;
}

library AaveV3SepoliaAssets {
  address internal constant DAI_UNDERLYING = 0x68194a729C2450ad26072b3D33ADaCbcef39D574;

  address internal constant DAI_A_TOKEN = 0x67550Df3290415611F6C140c81Cd770Ff1742cb9;

  address internal constant DAI_V_TOKEN = 0x1badcb245082a0E90c41770d47C7B58CBA59af74;

  address internal constant DAI_S_TOKEN = 0x988Ccf511EB27EcE918133Ae5c0C43A953fc0cd2;

  address internal constant DAI_ORACLE = 0x32064632C1b5bC83D6C22285dA91f71edd7024Ee;

  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xF0D0017efa05d820C1c131818858D82EbFBf03d7;

  address internal constant LINK_UNDERLYING = 0x8a0E31de20651fe58A369fD6f76c21A8FF7f8d42;

  address internal constant LINK_A_TOKEN = 0xD21A6990E47a07574dD6a876f6B5557c990d5867;

  address internal constant LINK_V_TOKEN = 0x6B7a94087D56571B4f31765fBb3e761d95c34Da5;

  address internal constant LINK_S_TOKEN = 0x0142b02C8B24679dB7E8664c13946d56C940485c;

  address internal constant LINK_ORACLE = 0x6FA0c0DBAeaf41eC93cdC10f78Fd40A4D709bB4D;

  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x548cf45cF3c7f4E142aA73a4dc8C88bd26663F43;

  address internal constant USDC_UNDERLYING = 0xda9d4f9b69ac6C22e444eD9aF0CfC043b7a7f53f;

  address internal constant USDC_A_TOKEN = 0x55D45c6649a0Ff74097d66aa6A6ae18a66Bb2fF3;

  address internal constant USDC_V_TOKEN = 0x3600d5D4Ba52D4ae4327DD7cB1437bF56eEE6A76;

  address internal constant USDC_S_TOKEN = 0x65d31f6448888Ab440d175df42fa39A37788bcc5;

  address internal constant USDC_ORACLE = 0x01781CeCba4FAB7E0177c882Cc0EcFcCD5eE68A9;

  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x4528650653E323026C4CD22b9D2bb983971FC2e2;

  address internal constant WBTC_UNDERLYING = 0xf864F011C5A97fD8Da79baEd78ba77b47112935a;

  address internal constant WBTC_A_TOKEN = 0x89B6d1393D1066f88eAfd8BA50cE13307529FC95;

  address internal constant WBTC_V_TOKEN = 0x6a733204074bcd6294489FBaE41E6dACCcc7FA62;

  address internal constant WBTC_S_TOKEN = 0x80317461303dB2c803501F9C8A132aB9b7f2ABb8;

  address internal constant WBTC_ORACLE = 0x566F946211e0E5e082B36870380b58775403dAb9;

  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x548cf45cF3c7f4E142aA73a4dc8C88bd26663F43;

  address internal constant WETH_UNDERLYING = 0xD0dF82dE051244f04BfF3A8bB1f62E1cD39eED92;

  address internal constant WETH_A_TOKEN = 0xE1a933729068B0B51452baC510Ce94dd9AB57A11;

  address internal constant WETH_V_TOKEN = 0xA037E753163dC9c4B5D29e36869Ca3CC062bbAbD;

  address internal constant WETH_S_TOKEN = 0x27E0cF57CC88A592e44e8161c91D75Df0eeaBc9e;

  address internal constant WETH_ORACLE = 0xec8Ca7B0D6b397F781DC3798d0113C6f2456A2c5;

  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x548cf45cF3c7f4E142aA73a4dc8C88bd26663F43;

  address internal constant USDT_UNDERLYING = 0x0Bd5F04B456ab34a2aB3e9d556Fe5b3A41A0BC8D;

  address internal constant USDT_A_TOKEN = 0xFbE6E10f1E7B15e2e7904a5ca249a8b6dF8d4309;

  address internal constant USDT_V_TOKEN = 0x61b537b07845515E76C6a756B4F19E75F067363d;

  address internal constant USDT_S_TOKEN = 0xA3400e953c2048ebF341E6958381396D5056BBE6;

  address internal constant USDT_ORACLE = 0xeaE631A727f3C4B88aa247B0d3084e2ABB17D47D;

  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x4528650653E323026C4CD22b9D2bb983971FC2e2;

  address internal constant AAVE_UNDERLYING = 0x5bB220Afc6E2e008CB2302a83536A019ED245AA2;

  address internal constant AAVE_A_TOKEN = 0xD3B304653E6dFb264212f7dd427F9E926B2EaA05;

  address internal constant AAVE_V_TOKEN = 0x83EF80F0469cCF826B19f628Ed893072f037F920;

  address internal constant AAVE_S_TOKEN = 0x26EC7C9347Cd82E189d7B43BC72fFf33b9FeE300;

  address internal constant AAVE_ORACLE = 0x23DAb3c64F12B27b5d1a95835227eFbB3AA19631;

  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x548cf45cF3c7f4E142aA73a4dc8C88bd26663F43;

  address internal constant EURS_UNDERLYING = 0xe20cf465a163c395e7Dde1466Cdd1aBe695B4658;

  address internal constant EURS_A_TOKEN = 0x0C4b9F731696bEd1b0834F48A7f24e513dC3CfD7;

  address internal constant EURS_V_TOKEN = 0xE416C2a158537db54B279D2A81609F5571cae297;

  address internal constant EURS_S_TOKEN = 0x4b2D948A2769BAAb4709D04Afc455645acDaF301;

  address internal constant EURS_ORACLE = 0x9D846140818A1617A8842603b1E18B620dF1355E;

  address internal constant EURS_INTEREST_RATE_STRATEGY =
    0x4528650653E323026C4CD22b9D2bb983971FC2e2;
}
