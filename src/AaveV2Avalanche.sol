// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveV2Avalanche {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x230B618aD4C475393A7239aE03630042281BD86e);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x65285E9dfab318f57051ab2b139ccCf232945451);

    address internal constant POOL_ADMIN =
        0x01244E7842254e3FD229CD263472076B1439D1Cd;

    address internal constant EMERGENCY_ADMIN =
        0x01244E7842254e3FD229CD263472076B1439D1Cd;

    address internal constant COLLECTOR =
        0x467b92aF281d14cB6809913AD016a607b5ba8A36;

    address internal constant COLLECTOR_CONTROLLER = address(0);
}
