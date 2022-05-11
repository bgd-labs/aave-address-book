// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";


library AaveV3FantomTestnet {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0xE339D30cBa24C70dCCb82B234589E3C83249e658
        );

    IPool internal constant POOL =
        IPool(0x771A45a19cE333a19356694C5fc80c76fe9bc741);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x59B84a6C943dD655D9E3B4024fC6AdC0E3f4Ff60);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA840C768f7143495790eC8dc2D5f32B71B6Dc113);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;
}
