// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveV2Goerli {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xa012e274b15B68abf26086591Cc0d2BB676c77C3
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x082307FbDEe3967141E96f9db16c4ea1f206F5A2);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x9f7395123B05232E74B52D8368afb28C1ba7f86C);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xD7f1238C02740A51A20f9857804B544C555a3802);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x0000000000000000000000000000000000000000);

    address internal constant POOL_ADMIN =
        0x4365F8e70CF38C6cA67DE41448508F2da8825500;

    address internal constant EMERGENCY_ADMIN =
        0x4365F8e70CF38C6cA67DE41448508F2da8825500;

    address internal constant COLLECTOR =
        0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c;

    address internal constant COLLECTOR_CONTROLLER = address(0);
}
