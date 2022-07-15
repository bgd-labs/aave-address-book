// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveV2Mumbai {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x178113104fEcbcD7fF8669a0150721e231F0FD4B
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x9198F13B08E299d85E096929fA9781A1E3d5d827);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0xc3c37E2aA3dc66464fa3C29ce2a6EC85beFC45e1);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xC365C653f7229894F93994CD0b30947Ab69Ff1D5);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0xFA3bD19110d986c5e5E9DD5F69362d05035D045B);

    address internal constant POOL_ADMIN =
        0x943E44157dC0302a5CEb172374d1749018a00994;

    address internal constant EMERGENCY_ADMIN =
        0x943E44157dC0302a5CEb172374d1749018a00994;

    address internal constant COLLECTOR =
        0x943E44157dC0302a5CEb172374d1749018a00994;

    address internal constant COLLECTOR_CONTROLLER = address(0);
}
