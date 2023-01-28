// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3Avalanche {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

  IPool internal constant POOL = IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

  IAaveOracle internal constant ORACLE = IAaveOracle(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

  address internal constant ACL_ADMIN = 0xa35b76E4935449E33C56aB24b23fcd3246f13470;

  address internal constant COLLECTOR = 0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0;

  ICollector internal constant COLLECTOR_CONTROLLER =
    ICollector(0xaCbE7d574EF8dC39435577eb638167Aca74F79f0);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x929EC64c34a17401F460460D4B9390518E5B473e;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0xa5ba6E5EC19a1Bf23C857991c857dB62b2Aa187B;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x81387c40EB75acB02757C1Ae55D5936E78c9dEd3;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x52A1CeB68Ee6b7B5D13E0376A1E0E4423A8cE26e;

  address internal constant EMISSION_MANAGER = 0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;

  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x770ef9f4fe897e59daCc474EF11238303F9552b6;

  address internal constant WETH_GATEWAY = 0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7;

  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x8a743090e9759E758d15a4CFd18408fb6332c625;

  address internal constant SWAP_COLLATERAL_ADAPTER = 0xF7fC20D9D1D8DFE55F5F2c3180272a5747dD327F;

  address internal constant UI_POOL_DATA_PROVIDER = 0xF71DBe0FAEF1473ffC607d4c555dfF0aEaDb878d;
}
