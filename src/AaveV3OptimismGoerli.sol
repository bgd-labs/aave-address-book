// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3OptimismGoerli {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x0b8FAe5f9Bf5a1a5867FB5b39fF4C028b1C2ebA9);

  IPool internal constant POOL = IPool(0xCAd01dAdb7E97ae45b89791D986470F3dfC256f7);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x98EC9f3e5A0E5aDB16BAAdEB96a110BceeaC0067);

  IAaveOracle internal constant ORACLE = IAaveOracle(0x2366d0cE3f44D81f7b2D40C64288b5eAA7593049);

  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x861d7d4A46C63b92461631CC77a9f2aeAcFfA10d);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x3e965db7b1BaA260B65208e3F508eD84344ebd75);

  address internal constant ACL_ADMIN = 0xaDdfe0b2342800ebD67C30d1c2Bd479E4D498BD5;

  ICollector internal constant COLLECTOR = ICollector(0x026E3e3363843e16e3D6d21e068c981A4F55e5d2);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x062BB55A42875366DB1B7D227B73621C33a6cB6b;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x7675E8C3e91A11D721D0292331c5ee28ed8996ee;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xF8707057529639A3da9D951054DE89f66d01B3e9;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xf12460DD042d7F143c6c5ab7A0C5CeA24F7a20b7;

  address internal constant EMISSION_MANAGER = 0x936fF44bb41Fe8d6c3028A016D3255cB3296ECA0;

  address internal constant WETH_GATEWAY = 0x6f7f2440006221F893c587b88f01afc42B6F8d2e;

  address internal constant FAUCET = 0x777A5810352302A2D6d79d5B7323237c467845d9;

  address internal constant WALLET_BALANCE_PROVIDER = 0xb463057Eb60E1575e2a69aa17C63CCd2F3161a5f;

  address internal constant UI_POOL_DATA_PROVIDER = 0x9277eFbB991536a98a1aA8b735E9D26d887104C1;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x4157398c5abB5211F51F5B551E3e240c5568dbD4;

  address internal constant L2_ENCODER = 0x14AA09449fac437b5c0110614be2C08610e38f62;
}

library AaveV3OptimismGoerliAssets {
  address internal constant DAI_UNDERLYING = 0xD9662ae38fB577a3F6843b6b8EB5af3410889f3A;
  address internal constant DAI_A_TOKEN = 0x844f622596D061B8AeB0bf265bDfbdafd5Fb7856;
  address internal constant DAI_V_TOKEN = 0x52FdB081Bba0B6Cf64AEC0fD78127EE07462B51e;
  address internal constant DAI_S_TOKEN = 0x68D2a5be0A4d0Fd6B4e3d2ff7544BDc4B227717B;
  address internal constant DAI_ORACLE = 0xfAe9463b2dEf2AbAF908d0697e7CCEe0407185f1;
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0x62527eDa8EC3E3a0ff8DcbA4625fA2dce5829da6;
  address internal constant LINK_UNDERLYING = 0x14cd1A7b8c547bD4A2f531ba1BF11B6c4f2b96db;
  address internal constant LINK_A_TOKEN = 0x29C81A0F7791733E99EC723D30C4f5d77dd5740C;
  address internal constant LINK_V_TOKEN = 0xd22D39EB883995964CaB0e7e1210c2A4310cd18f;
  address internal constant LINK_S_TOKEN = 0x540346baF4b1eBf176673aeFc45a492F248B5613;
  address internal constant LINK_ORACLE = 0x5A04220725D3479A910c9712159b576A19947eC9;
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x32BB31484151627da35C460c60f6Bb309cAdA06e;
  address internal constant USDC_UNDERLYING = 0xcbce2891F86b69b3eF61dF8CE69e3522a0483FB3;
  address internal constant USDC_A_TOKEN = 0x1FE5C2C6e1e0207D0Bd5Ee7B8C83b7c5e51D5e49;
  address internal constant USDC_V_TOKEN = 0x45b3190E739E26f44cEB115558c08B76a6831fA5;
  address internal constant USDC_S_TOKEN = 0x80b54134B96C9C2716995068c208Bf174b4116D1;
  address internal constant USDC_ORACLE = 0x6ADC023eEDbD7d55809b7f021425415FF7e4B3dB;
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x3A1ED60315BEF296ad37CcFc01fA4698C7F31f73;
  address internal constant WBTC_UNDERLYING = 0xe786Ce31c4c68B1aa004fCed5066775a788993CB;
  address internal constant WBTC_A_TOKEN = 0x1eEC581e03B87a1C1B2c2900d0d83FF39eA4e240;
  address internal constant WBTC_V_TOKEN = 0x2D8044e5A9CFB5b86f8a49823f84fe67AD7013b7;
  address internal constant WBTC_S_TOKEN = 0xD32dFf72F217a56e2d1E36ac9e22052285aE3B2a;
  address internal constant WBTC_ORACLE = 0x3d14c2Bb0C02A992046217283768109d800a2423;
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x32BB31484151627da35C460c60f6Bb309cAdA06e;
  address internal constant WETH_UNDERLYING = 0xc5Bf9eb35c7d3a90816436E2a124bdd136e09fFD;
  address internal constant WETH_A_TOKEN = 0xF8793d992E2f4De3Eaf7cE65c71e81Bcc0f235Af;
  address internal constant WETH_V_TOKEN = 0x44c178F854738dAeE97CE3739060d8BFBf2d844c;
  address internal constant WETH_S_TOKEN = 0xa9D767984631B9C3EE28b4568121fC70dC312883;
  address internal constant WETH_ORACLE = 0x22437f5745838DBea26Aa3c439cC137fc5C2E56F;
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x32BB31484151627da35C460c60f6Bb309cAdA06e;
  address internal constant USDT_UNDERLYING = 0x8a06022A41B6b64dAefC68260371472fcB351081;
  address internal constant USDT_A_TOKEN = 0x93439F0BF30Bd85385087068dd9D958Dcb9f32d5;
  address internal constant USDT_V_TOKEN = 0xdc22Bae995EFC48af7B364B672AdB02F6BD0F632;
  address internal constant USDT_S_TOKEN = 0x73b3AE5A8316223560E3dC29ae97F19a402c3aa3;
  address internal constant USDT_ORACLE = 0x0707F6C1B4281EB5580bec1dA1cEa2ddAb6E91e6;
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x3A1ED60315BEF296ad37CcFc01fA4698C7F31f73;
  address internal constant AAVE_UNDERLYING = 0x7B16EB8CE4143B1bEA183082E1D50e7519980F79;
  address internal constant AAVE_A_TOKEN = 0x3A94d605ebC265Aa57Ce6dD01dD532dceeb5Cd87;
  address internal constant AAVE_V_TOKEN = 0x5a51cBAba718c5ad13A5BedAD096fc0E4414E7F5;
  address internal constant AAVE_S_TOKEN = 0xF133c5B244c95f108b549C6eB768797e2Ea83605;
  address internal constant AAVE_ORACLE = 0x443C1A5D8d2C5E87d7d1Cc9BB21Dbb2787BE5dD0;
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x32BB31484151627da35C460c60f6Bb309cAdA06e;
  address internal constant SUSD_UNDERLYING = 0x4f8758F0e15d62426D36cA6c08f6b30ab678cEC7;
  address internal constant SUSD_A_TOKEN = 0xDFABA2957a78f91dadd1F467059EaeaD01c0B0A7;
  address internal constant SUSD_V_TOKEN = 0x806ce529eECb69E09a365d2728793317644A23DD;
  address internal constant SUSD_S_TOKEN = 0x51c0f4A1ED8C2986f29Ef853e60F493C872E701B;
  address internal constant SUSD_ORACLE = 0x04d339Ac1A4A2e830ea54750c248e489b82C392D;
  address internal constant SUSD_INTEREST_RATE_STRATEGY =
    0x3A1ED60315BEF296ad37CcFc01fA4698C7F31f73;
}
