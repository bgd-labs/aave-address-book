// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3ZkSync {
  // https://era.zksync.network//address/0xeFD2d8E445391BCD1543ce5Af3ed004DF200BeaD
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xeFD2d8E445391BCD1543ce5Af3ed004DF200BeaD);

  // https://era.zksync.network//address/0x75Bb7792be39f9CA9E7F4c7a6AFcF53e7F614Cb2
  IPool internal constant POOL = IPool(0x75Bb7792be39f9CA9E7F4c7a6AFcF53e7F614Cb2);

  // https://era.zksync.network//address/0x9311BF2E03436885bD7494E14e289A724c2ca2dF
  address internal constant POOL_IMPL = 0x9311BF2E03436885bD7494E14e289A724c2ca2dF;

  // https://era.zksync.network//address/0xFC7F20e641A8Df945Aca10091059036c36DDdD2f
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0xFC7F20e641A8Df945Aca10091059036c36DDdD2f);

  // https://era.zksync.network//address/0xFaC45F6a50Ac1BE938c3168B093f336943C7314B
  address internal constant POOL_CONFIGURATOR_IMPL = 0xFaC45F6a50Ac1BE938c3168B093f336943C7314B;

  // https://era.zksync.network//address/0xEe2Ed473Df336bFA993009F1CcE5AAF6cF20bb2f
  IAaveOracle internal constant ORACLE = IAaveOracle(0xEe2Ed473Df336bFA993009F1CcE5AAF6cF20bb2f);

  // https://era.zksync.network//address/0x85f51c46a9B867608714853415de502B9C0b07dd
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x85f51c46a9B867608714853415de502B9C0b07dd);

  // https://era.zksync.network//address/0xa1A966D108424530D4b7d2b78EEE182dB8b6fB56
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xa1A966D108424530D4b7d2b78EEE182dB8b6fB56);

  // https://era.zksync.network//address/0x04cE39789e11a49595cD0ECEf6f4Bd54ABF4d020
  address internal constant ACL_ADMIN = 0x04cE39789e11a49595cD0ECEf6f4Bd54ABF4d020;

  // https://era.zksync.network//address/0x7A0f281b41Cc9da52D2CAB2D23D3343277EbAf96
  ICollector internal constant COLLECTOR = ICollector(0x7A0f281b41Cc9da52D2CAB2D23D3343277EbAf96);

  // https://era.zksync.network//address/0xA0A6587a2291C63Bcb8ee9F3cB4C583e20ca4c42
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xA0A6587a2291C63Bcb8ee9F3cB4C583e20ca4c42;

  // https://era.zksync.network//address/0x58C1F5d7Ea1F419588CF8eC9D22cB982C7C630D4
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x58C1F5d7Ea1F419588CF8eC9D22cB982C7C630D4;

  // https://era.zksync.network//address/0x7c310e97Bdba5E7603D772df324B8dd33771c094
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x7c310e97Bdba5E7603D772df324B8dd33771c094;

  // https://era.zksync.network//address/0xc25037446067240880b7B6d81fae544309a5fE02
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xc25037446067240880b7B6d81fae544309a5fE02;

  // https://era.zksync.network//address/0x403622110c4B8Fd7eDAe600C6cBD75Ad97B3E919
  address internal constant EMISSION_MANAGER = 0x403622110c4B8Fd7eDAe600C6cBD75Ad97B3E919;

  // https://era.zksync.network//address/0x4b6016ce7a7e6bF48c20225322ae0458cf2d64D5
  address internal constant CONFIG_ENGINE = 0x4b6016ce7a7e6bF48c20225322ae0458cf2d64D5;

  // https://era.zksync.network//address/0xd18cEba655fA0A3C3f00Bb6C990de602AbbE2dB3
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0xd18cEba655fA0A3C3f00Bb6C990de602AbbE2dB3;

  // https://era.zksync.network//address/0xB88C5362F1e2fF122B3Cf1f4a4fb5F4b2167a271
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xB88C5362F1e2fF122B3Cf1f4a4fb5F4b2167a271;

  // https://era.zksync.network//address/0xff9D92509A5C60636718BE40Be5CA0b4fE3fACcD
  address internal constant UI_POOL_DATA_PROVIDER = 0xff9D92509A5C60636718BE40Be5CA0b4fE3fACcD;

  // https://era.zksync.network//address/0x3BE5B5E817440f0CDcA46f89518BE4a67875Acb3
  address internal constant WALLET_BALANCE_PROVIDER = 0x3BE5B5E817440f0CDcA46f89518BE4a67875Acb3;

  // https://era.zksync.network//address/0x9F07eEBdf3675f60dCeC65a092F1821Fb99726F3
  address internal constant WETH_GATEWAY = 0x9F07eEBdf3675f60dCeC65a092F1821Fb99726F3;

  // https://era.zksync.network//address/0x9416fA2036662565b0Aa26D18b4948F73A192C96
  address internal constant STATIC_A_TOKEN_FACTORY = 0x9416fA2036662565b0Aa26D18b4948F73A192C96;
}

library AaveV3ZkSyncAssets {
  // https://era.zksync.network//address/0x1d17CBcF0D6D143135aE902365D2E5e2A16538D4
  address internal constant USDC_UNDERLYING = 0x1d17CBcF0D6D143135aE902365D2E5e2A16538D4;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://era.zksync.network//address/0x97448808a366BDCC3A0fF84E36573dD8Ef1Ff5Fb
  address internal constant USDC_A_TOKEN = 0x97448808a366BDCC3A0fF84E36573dD8Ef1Ff5Fb;

  // https://era.zksync.network//address/0xb30d45038b1373827A0336cD6EB0b94723C76783
  address internal constant USDC_V_TOKEN = 0xb30d45038b1373827A0336cD6EB0b94723C76783;

  // https://era.zksync.network//address/0x9bC045f0aB33a498dA84F09fDAbd0C3c8Ed278c0
  address internal constant USDC_S_TOKEN = 0x9bC045f0aB33a498dA84F09fDAbd0C3c8Ed278c0;

  // https://era.zksync.network//address/0x162C97F6B4FA5a915A44D430bb7AE0eE716b3b87
  address internal constant USDC_ORACLE = 0x162C97F6B4FA5a915A44D430bb7AE0eE716b3b87;

  // https://era.zksync.network//address/0x7BcE25db0C430059C4277D6A747d7fd0C1214beA
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x7BcE25db0C430059C4277D6A747d7fd0C1214beA;

  // https://era.zksync.network//address/0x493257fD37EDB34451f62EDf8D2a0C418852bA4C
  address internal constant USDT_UNDERLYING = 0x493257fD37EDB34451f62EDf8D2a0C418852bA4C;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://era.zksync.network//address/0xa7d6B2dFe6cDB4c2D017294636065ac77265114c
  address internal constant USDT_A_TOKEN = 0xa7d6B2dFe6cDB4c2D017294636065ac77265114c;

  // https://era.zksync.network//address/0x02C39C4Ed5D7345fD96E9f83805467B9D3c33252
  address internal constant USDT_V_TOKEN = 0x02C39C4Ed5D7345fD96E9f83805467B9D3c33252;

  // https://era.zksync.network//address/0x3d58EC46eE7b50ff54E5277Bbb02A8fdE774F193
  address internal constant USDT_S_TOKEN = 0x3d58EC46eE7b50ff54E5277Bbb02A8fdE774F193;

  // https://era.zksync.network//address/0x92DaB7275859C5399a326874897daddb0F4ed7A4
  address internal constant USDT_ORACLE = 0x92DaB7275859C5399a326874897daddb0F4ed7A4;

  // https://era.zksync.network//address/0x7BcE25db0C430059C4277D6A747d7fd0C1214beA
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x7BcE25db0C430059C4277D6A747d7fd0C1214beA;

  // https://era.zksync.network//address/0x5AEa5775959fBC2557Cc8789bC1bf90A239D9a91
  address internal constant WETH_UNDERLYING = 0x5AEa5775959fBC2557Cc8789bC1bf90A239D9a91;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://era.zksync.network//address/0xe471A799FA3DC0738Cf9FB7346574843f5219C30
  address internal constant WETH_A_TOKEN = 0xe471A799FA3DC0738Cf9FB7346574843f5219C30;

  // https://era.zksync.network//address/0x912413f4Ab1fBFD31414DE2fB1b63816c95e4d91
  address internal constant WETH_V_TOKEN = 0x912413f4Ab1fBFD31414DE2fB1b63816c95e4d91;

  // https://era.zksync.network//address/0x415BeF014E69564Fe68f6b8d5fBbDE4310794C5d
  address internal constant WETH_S_TOKEN = 0x415BeF014E69564Fe68f6b8d5fBbDE4310794C5d;

  // https://era.zksync.network//address/0x6D41d1dc818112880b40e26BD6FD347E41008eDA
  address internal constant WETH_ORACLE = 0x6D41d1dc818112880b40e26BD6FD347E41008eDA;

  // https://era.zksync.network//address/0x7BcE25db0C430059C4277D6A747d7fd0C1214beA
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x7BcE25db0C430059C4277D6A747d7fd0C1214beA;

  // https://era.zksync.network//address/0x703b52F2b28fEbcB60E1372858AF5b18849FE867
  address internal constant wstETH_UNDERLYING = 0x703b52F2b28fEbcB60E1372858AF5b18849FE867;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://era.zksync.network//address/0x318CfbA2CDDBF6522d855A589938EC6f5B990Fc1
  address internal constant wstETH_A_TOKEN = 0x318CfbA2CDDBF6522d855A589938EC6f5B990Fc1;

  // https://era.zksync.network//address/0x29191BEa63b15E70E2f4c2647695aD1C8EdCb3d5
  address internal constant wstETH_V_TOKEN = 0x29191BEa63b15E70E2f4c2647695aD1C8EdCb3d5;

  // https://era.zksync.network//address/0x60a6E8f92482Fe6F11B57697Ca4f962c0cDA3369
  address internal constant wstETH_S_TOKEN = 0x60a6E8f92482Fe6F11B57697Ca4f962c0cDA3369;

  // https://era.zksync.network//address/0xB19d366dC599904Aa026440d4E805F0E13512682
  address internal constant wstETH_ORACLE = 0xB19d366dC599904Aa026440d4E805F0E13512682;

  // https://era.zksync.network//address/0x7BcE25db0C430059C4277D6A747d7fd0C1214beA
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0x7BcE25db0C430059C4277D6A747d7fd0C1214beA;

  // https://era.zksync.network//address/0x5A7d6b2F92C77FAD6CCaBd7EE0624E64907Eaf3E
  address internal constant ZK_UNDERLYING = 0x5A7d6b2F92C77FAD6CCaBd7EE0624E64907Eaf3E;

  uint8 internal constant ZK_DECIMALS = 18;

  // https://era.zksync.network//address/0xFA8789719Ff34325362FF901bb3B34f34Ce4768A
  address internal constant ZK_A_TOKEN = 0xFA8789719Ff34325362FF901bb3B34f34Ce4768A;

  // https://era.zksync.network//address/0xfaa231f2B7D0De0644b38a36deF591B3B8c7a409
  address internal constant ZK_V_TOKEN = 0xfaa231f2B7D0De0644b38a36deF591B3B8c7a409;

  // https://era.zksync.network//address/0x9EAAc5b543258E44a189D1dF02dD2CEAAb8Af7B0
  address internal constant ZK_S_TOKEN = 0x9EAAc5b543258E44a189D1dF02dD2CEAAb8Af7B0;

  // https://era.zksync.network//address/0xD1ce60dc8AE060DDD17cA8716C96f193bC88DD13
  address internal constant ZK_ORACLE = 0xD1ce60dc8AE060DDD17cA8716C96f193bC88DD13;

  // https://era.zksync.network//address/0x7BcE25db0C430059C4277D6A747d7fd0C1214beA
  address internal constant ZK_INTEREST_RATE_STRATEGY = 0x7BcE25db0C430059C4277D6A747d7fd0C1214beA;
}

library AaveV3ZkSyncEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant ETH_CORRELATED = 1;
}

library AaveV3ZkSyncExternalLibraries {
  // https://era.zksync.network//address/0xb9f1FdECc1169900a543CB8E9c1F24ee6dD7C665
  address internal constant FLASHLOAN_LOGIC = 0xb9f1FdECc1169900a543CB8E9c1F24ee6dD7C665;

  // https://era.zksync.network//address/0x8821156340E25f0d9f4ad79349944158b9B7370E
  address internal constant BORROW_LOGIC = 0x8821156340E25f0d9f4ad79349944158b9B7370E;

  // https://era.zksync.network//address/0x9E1c74428FAffDe164d2B6A4f707B0d0B177E69b
  address internal constant BRIDGE_LOGIC = 0x9E1c74428FAffDe164d2B6A4f707B0d0B177E69b;

  // https://era.zksync.network//address/0x94Eff35Bb1eF2089b61Ac8daeBff6987D45BEc53
  address internal constant E_MODE_LOGIC = 0x94Eff35Bb1eF2089b61Ac8daeBff6987D45BEc53;

  // https://era.zksync.network//address/0xd04CDe0FF78f3E5aa26d6eCB0b2cd62Ebc734821
  address internal constant LIQUIDATION_LOGIC = 0xd04CDe0FF78f3E5aa26d6eCB0b2cd62Ebc734821;

  // https://era.zksync.network//address/0xEe9A09200Ea8925bDB6CAA5739338D8716036f6F
  address internal constant POOL_LOGIC = 0xEe9A09200Ea8925bDB6CAA5739338D8716036f6F;

  // https://era.zksync.network//address/0x29292DcB190CB037105135a2c962F736c26787d8
  address internal constant SUPPLY_LOGIC = 0x29292DcB190CB037105135a2c962F736c26787d8;
}
