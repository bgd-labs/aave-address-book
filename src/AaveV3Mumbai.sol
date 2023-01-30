// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3Mumbai {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xeb7A892BB04A8f836bDEeBbf60897A7Af1Bf5d7F);

  IPool internal constant POOL = IPool(0x0b913A76beFF3887d35073b8e5530755D60F78C7);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x1147c3fE425bB6596D08Baba106167b190897821);

  IAaveOracle internal constant ORACLE = IAaveOracle(0xf0E6744a59177014738e1eF920dc676fb3b8CB62);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xacB5aDd3029C5004f726e8411033E6202Bc3dd01);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x18e94ec692587dEb6f64c3c8e234dB076aAf8A35);

  address internal constant ACL_ADMIN = 0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00;

  address internal constant COLLECTOR = 0x270EfFE95AE74FF6a6d839Ca1E7f89d1ddbdb920;

  ICollector internal constant COLLECTOR_CONTROLLER =
    ICollector(0xCF5D1aB9C3bfE512b86BBA04cba8d21D842Aa656);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x67D1846E97B6541bA730f0C24899B0Ba3Be0D087;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0xfaf04252248861B759709e10B1b746269370F0aa;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xF347E9FC8bD0a1Ad70F1AE6c1A499bbBaf4Cce6D;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xECA6044716E7489D58954FD68f709133E6cf65ce;

  address internal constant EMISSION_MANAGER = 0xC7C6294502d6f9d17A0023627D2417c9408D083A;

  address internal constant WETH_GATEWAY = 0x2a58E9bbb5434FdA7FF78051a4B82cb0EF669C17;

  address internal constant FAUCET = 0xB00b414F9E45ba73B44fFC3E3Ce64a806552cD02;

  address internal constant WALLET_BALANCE_PROVIDER = 0xdbaeF5FC90a979426E2cE5C3F0125430d0e2023e;

  address internal constant UI_POOL_DATA_PROVIDER = 0x928d9A76705aA6e4a6650BFb7E7912e413Fe7341;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xf7Dd602B3Cf90B2A20FC0F84E0419BeE104BdF16;
}
