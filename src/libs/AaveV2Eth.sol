// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library AaveV2Eth {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9);

    address internal constant POOL_ADMIN =
        0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

    address internal constant EMERGENCY_ADMIN =
        0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633;
}
