// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

library AaveV3Mumbai {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6);

    IPool internal constant POOL =
        IPool(0x6C9fB0D5bD9429eb9Cd96B85B81d872281771E6B);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x7b47e727eC539CB74A744ae5259ef26743294fca);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x520D14AE678b41067f029Ad770E2870F85E76588);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x8f57153F18b7273f9A814b93b31Cb3f9b035e7C2);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x6437b6E14D7ECa1Fa9854df92eB067253D5f683A);

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant COLLECTOR =
        0x3B6E7a4750e478D7f7d6A5d464099A02ef164bCC;

    ICollector internal constant COLLECTOR_CONTROLLER =
        ICollector(0x810d913542D399F3680F0E806DEDf6EACf0e3383);

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0xFfaDa869df79320120dfFd6eeE8cF664Dba43146;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0x8017B7FC5473d05e67E617072fB237D24Add550b;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x08a917bbd0E22D496Ca9364B5D21311fe1D31637;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x651b8A8cA545b251a8f49B57D5838Da0a8DFbEF9;
}
