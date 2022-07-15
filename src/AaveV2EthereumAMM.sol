// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveV2EthereumAMM {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x23A875eDe3F1030138701683e42E9b16A7F87768);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x0000000000000000000000000000000000000000);

    address internal constant POOL_ADMIN =
        0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

    address internal constant EMERGENCY_ADMIN =
        0xB9062896ec3A615a4e4444DF183F0531a77218AE;

    address internal constant COLLECTOR =
        0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c;

    address internal constant COLLECTOR_CONTROLLER =
        0x3d569673dAa0575c936c7c67c4E6AedA69CC630C;
}
