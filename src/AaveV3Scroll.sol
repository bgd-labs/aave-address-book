// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';
library AaveV3Scroll {
  // https://scrollscan.com/address/0x69850D0B276776781C063771b161bd8894BCdD04
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x69850D0B276776781C063771b161bd8894BCdD04);

  // https://scrollscan.com/address/0x11fCfe756c05AD438e312a7fd934381537D3cFfe
  IPool internal constant POOL = IPool(0x11fCfe756c05AD438e312a7fd934381537D3cFfe);

  // https://scrollscan.com/address/0x32BCab42a2bb5AC577D24b425D46d8b8e0Df9b7f
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x32BCab42a2bb5AC577D24b425D46d8b8e0Df9b7f);

  // https://scrollscan.com/address/0x04421D8C506E2fA2371a08EfAaBf791F624054F3
  IAaveOracle internal constant ORACLE = IAaveOracle(0x04421D8C506E2fA2371a08EfAaBf791F624054F3);

  // https://scrollscan.com/address/0xfD0Ba55775C1e53f50736FA5528d8aa45FBcA391
  address internal constant PRICE_ORACLE_SENTINEL = 0xfD0Ba55775C1e53f50736FA5528d8aa45FBcA391;

  // https://scrollscan.com/address/0xc1ABF87FfAdf4908f4eC8dc54A25DCFEabAE4A24
  address internal constant ACL_ADMIN = 0xc1ABF87FfAdf4908f4eC8dc54A25DCFEabAE4A24;

  // https://scrollscan.com/address/0x7633F981D87dC6307227de9383D2ce7243158081
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x7633F981D87dC6307227de9383D2ce7243158081);

  // https://scrollscan.com/address/0xe2108b60623C6Dcf7bBd535bD15a451fd0811f7b
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xe2108b60623C6Dcf7bBd535bD15a451fd0811f7b);

  // https://scrollscan.com/address/0xcB2107Ace932591C57EB5D07A135F1F3Dd613Dc0
  address internal constant POOL_IMPL = 0xcB2107Ace932591C57EB5D07A135F1F3Dd613Dc0;

  // https://scrollscan.com/address/0x4816b2C2895f97fB918f1aE7Da403750a0eE372e
  address internal constant POOL_CONFIGURATOR_IMPL = 0x4816b2C2895f97fB918f1aE7Da403750a0eE372e;

  // https://scrollscan.com/address/0xa3f3100C4f1D0624DB9DB97b40C13885Ce297799
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xa3f3100C4f1D0624DB9DB97b40C13885Ce297799;

  // https://scrollscan.com/address/0x6091546836DAe0487A50E300da3F237727441D90
  address internal constant EMISSION_MANAGER = 0x6091546836DAe0487A50E300da3F237727441D90;

  // https://scrollscan.com/address/0x90eB541e1a431D8a30ED85A77675D1F001128cb5
  ICollector internal constant COLLECTOR = ICollector(0x90eB541e1a431D8a30ED85A77675D1F001128cb5);

  // https://scrollscan.com/address/0x92EDe4ABd9df4Bfb49b4d723e4c932e35c47C54C
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x92EDe4ABd9df4Bfb49b4d723e4c932e35c47C54C;

  // https://scrollscan.com/address/0x49bA16C08130FF8cFADE263B49387A8555bc057B
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x49bA16C08130FF8cFADE263B49387A8555bc057B;

  // https://scrollscan.com/address/0x8714E5ED2d8edD4E88eFf66637C3FE8eCf2B8C40
  address internal constant L2_ENCODER = 0x8714E5ED2d8edD4E88eFf66637C3FE8eCf2B8C40;

  // https://scrollscan.com/address/0xc4dcA550EF04FD0f8AbD4c384575Fb8a8123054e
  address internal constant CAPS_PLUS_RISK_STEWARD = 0xc4dcA550EF04FD0f8AbD4c384575Fb8a8123054e;

  // https://scrollscan.com/address/0x64093fe5f8Cf62aFb4377cf7EF4373537fe9155B
  address internal constant RISK_STEWARD = 0x64093fe5f8Cf62aFb4377cf7EF4373537fe9155B;

  // https://scrollscan.com/address/0xc68D0C511076283075bD5cc9aA61E43673135f37
  address internal constant FREEZING_STEWARD = 0xc68D0C511076283075bD5cc9aA61E43673135f37;

  // https://scrollscan.com/address/0xC0FE411b2606a06f64C1536E8F92FA6a9d5a89B8
  address internal constant CONFIG_ENGINE = 0xC0FE411b2606a06f64C1536E8F92FA6a9d5a89B8;

  // https://scrollscan.com/address/0xFBedc64AeE24921cb43004312B9eF367a4162b57
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0xFBedc64AeE24921cb43004312B9eF367a4162b57;

  // https://scrollscan.com/address/0x5d4D4007A4c6336550DdAa2a7c0d5e7972eebd16
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x5d4D4007A4c6336550DdAa2a7c0d5e7972eebd16;

  // https://scrollscan.com/address/0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9
  address internal constant UI_POOL_DATA_PROVIDER = 0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9;

  // https://scrollscan.com/address/0xE51642875Af07Fea1B03d821E41a9DB24bC4447E
  address internal constant WALLET_BALANCE_PROVIDER = 0xE51642875Af07Fea1B03d821E41a9DB24bC4447E;

  // https://scrollscan.com/address/0xE79Ca44408Dae5a57eA2a9594532f1E84d2edAa4
  address internal constant WETH_GATEWAY = 0xE79Ca44408Dae5a57eA2a9594532f1E84d2edAa4;

  // https://scrollscan.com/address/0x970b77b96D94966939a8F867c2BfC2aC0310C0e7
  address internal constant LEGACY_STATIC_A_TOKEN_FACTORY =
    0x970b77b96D94966939a8F867c2BfC2aC0310C0e7;
}
library AaveV3ScrollAssets {
  // https://scrollscan.com/address/0x5300000000000000000000000000000000000004
  address internal constant WETH_UNDERLYING = 0x5300000000000000000000000000000000000004;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://scrollscan.com/address/0xf301805bE1Df81102C957f6d4Ce29d2B8c056B2a
  address internal constant WETH_A_TOKEN = 0xf301805bE1Df81102C957f6d4Ce29d2B8c056B2a;

  // https://scrollscan.com/address/0xfD7344CeB1Df9Cf238EcD667f4A6F99c6Ef44a56
  address internal constant WETH_V_TOKEN = 0xfD7344CeB1Df9Cf238EcD667f4A6F99c6Ef44a56;

  // https://scrollscan.com/address/0x6bF14CB0A831078629D993FDeBcB182b21A8774C
  address internal constant WETH_ORACLE = 0x6bF14CB0A831078629D993FDeBcB182b21A8774C;

  // https://scrollscan.com/address/0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc;

  // https://scrollscan.com/address/0x6b9DfaC194fa78a1882680E2cE19194D006AeEfd
  address internal constant WETH_STATIC_A_TOKEN = 0x6b9DfaC194fa78a1882680E2cE19194D006AeEfd;

  // https://scrollscan.com/address/0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4
  address internal constant USDC_UNDERLYING = 0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://scrollscan.com/address/0x1D738a3436A8C49CefFbaB7fbF04B660fb528CbD
  address internal constant USDC_A_TOKEN = 0x1D738a3436A8C49CefFbaB7fbF04B660fb528CbD;

  // https://scrollscan.com/address/0x3d2E209af5BFa79297C88D6b57F89d792F6E28EE
  address internal constant USDC_V_TOKEN = 0x3d2E209af5BFa79297C88D6b57F89d792F6E28EE;

  // https://scrollscan.com/address/0x427Fd98dbD1DbC2D4e792350caBe7c9665F35bee
  address internal constant USDC_ORACLE = 0x427Fd98dbD1DbC2D4e792350caBe7c9665F35bee;

  // https://scrollscan.com/address/0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc;

  // https://scrollscan.com/address/0x9fA123bC7E6b61cC8a9D893673a4C6E5392FF4A7
  address internal constant USDC_STATIC_A_TOKEN = 0x9fA123bC7E6b61cC8a9D893673a4C6E5392FF4A7;

  // https://scrollscan.com/address/0xf610A9dfB7C89644979b4A0f27063E9e7d7Cda32
  address internal constant wstETH_UNDERLYING = 0xf610A9dfB7C89644979b4A0f27063E9e7d7Cda32;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://scrollscan.com/address/0x5B1322eeb46240b02e20062b8F0F9908d525B09c
  address internal constant wstETH_A_TOKEN = 0x5B1322eeb46240b02e20062b8F0F9908d525B09c;

  // https://scrollscan.com/address/0x8a035644322129800C3f747f54Db0F4d3c0A2877
  address internal constant wstETH_V_TOKEN = 0x8a035644322129800C3f747f54Db0F4d3c0A2877;

  // https://scrollscan.com/address/0x4EdAbf45e78363b8Dcd763bBbd05665c6e24975C
  address internal constant wstETH_ORACLE = 0x4EdAbf45e78363b8Dcd763bBbd05665c6e24975C;

  // https://scrollscan.com/address/0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc;

  // https://scrollscan.com/address/0x6e368c4dBf083e18a29aE63FC06AF9deDb3242F0
  address internal constant wstETH_STATIC_A_TOKEN = 0x6e368c4dBf083e18a29aE63FC06AF9deDb3242F0;

  // https://scrollscan.com/address/0x01f0a31698C4d065659b9bdC21B3610292a1c506
  address internal constant weETH_UNDERLYING = 0x01f0a31698C4d065659b9bdC21B3610292a1c506;

  uint8 internal constant weETH_DECIMALS = 18;

  // https://scrollscan.com/address/0xd80A5e16DBDC52Bd1C947CEDfA22c562Be9129C8
  address internal constant weETH_A_TOKEN = 0xd80A5e16DBDC52Bd1C947CEDfA22c562Be9129C8;

  // https://scrollscan.com/address/0x009D88C6a6B4CaA240b71C98BA93732e26F2A55A
  address internal constant weETH_V_TOKEN = 0x009D88C6a6B4CaA240b71C98BA93732e26F2A55A;

  // https://scrollscan.com/address/0x32f924C0e0F1Abf5D1ff35B05eBc5E844dEdD2A9
  address internal constant weETH_ORACLE = 0x32f924C0e0F1Abf5D1ff35B05eBc5E844dEdD2A9;

  // https://scrollscan.com/address/0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc
  address internal constant weETH_INTEREST_RATE_STRATEGY =
    0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc;

  // https://scrollscan.com/address/0xd29687c813D741E2F938F4aC377128810E217b1b
  address internal constant SCR_UNDERLYING = 0xd29687c813D741E2F938F4aC377128810E217b1b;

  uint8 internal constant SCR_DECIMALS = 18;

  // https://scrollscan.com/address/0x25718130C2a8eb94e2e1FAFB5f1cDd4b459aCf64
  address internal constant SCR_A_TOKEN = 0x25718130C2a8eb94e2e1FAFB5f1cDd4b459aCf64;

  // https://scrollscan.com/address/0xFFbA405BBF25B2e6C454d18165F2fd8786858c6B
  address internal constant SCR_V_TOKEN = 0xFFbA405BBF25B2e6C454d18165F2fd8786858c6B;

  // https://scrollscan.com/address/0x26f6F7C468EE309115d19Aa2055db5A74F8cE7A5
  address internal constant SCR_ORACLE = 0x26f6F7C468EE309115d19Aa2055db5A74F8cE7A5;

  // https://scrollscan.com/address/0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc
  address internal constant SCR_INTEREST_RATE_STRATEGY = 0xC37353E5766164D8654D3CB395acfDcA4c2E7Ddc;
}
library AaveV3ScrollEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant ETH_CORRELATED = 1;
}
library AaveV3ScrollExternalLibraries {
  // https://scrollscan.com/address/0xb32381feFFF45eE9F47fD2f2cF83C832637d6EF0
  address internal constant FLASHLOAN_LOGIC = 0xb32381feFFF45eE9F47fD2f2cF83C832637d6EF0;

  // https://scrollscan.com/address/0x4c52FE2162200bf26c314d7bbd8611699139d553
  address internal constant BORROW_LOGIC = 0x4c52FE2162200bf26c314d7bbd8611699139d553;

  // https://scrollscan.com/address/0x97dCbFaE5372A63128F141E8C0BC2c871Ca5F604
  address internal constant BRIDGE_LOGIC = 0x97dCbFaE5372A63128F141E8C0BC2c871Ca5F604;

  // https://scrollscan.com/address/0x88F864670De467aA73CD45325F9652C578C8AB85
  address internal constant E_MODE_LOGIC = 0x88F864670De467aA73CD45325F9652C578C8AB85;

  // https://scrollscan.com/address/0x80d16970B31243Fe67DaB028115f3E4c3E3510Ad
  address internal constant LIQUIDATION_LOGIC = 0x80d16970B31243Fe67DaB028115f3E4c3E3510Ad;

  // https://scrollscan.com/address/0xA58FB47bE9074828215A173564C0CD10f6F249bf
  address internal constant POOL_LOGIC = 0xA58FB47bE9074828215A173564C0CD10f6F249bf;

  // https://scrollscan.com/address/0x2b22E425C1322fbA0DbF17bb1dA25d71811EE7ba
  address internal constant SUPPLY_LOGIC = 0x2b22E425C1322fbA0DbF17bb1dA25d71811EE7ba;
}
