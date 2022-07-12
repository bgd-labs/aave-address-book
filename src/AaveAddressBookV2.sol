// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV2 {
    struct Market {
        ILendingPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        ILendingPool POOL;
        ILendingPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider AAVE_PROTOCOL_DATA_PROVIDER;
        address POOL_ADMIN;
        address EMERGENCY_ADMIN;
        address COLLECTOR;
        address COLLECTOR_CONTROLLER;
    }

    function getMarket(string calldata market)
        public
        pure
        returns (Market memory m)
    {}
}
