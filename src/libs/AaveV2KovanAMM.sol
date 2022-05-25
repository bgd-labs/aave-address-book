// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library AaveV2KovanAMM {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x67FB118A780fD740C8936511947cC4bE7bb7730c
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x762E2a3BBe729240ea44D31D5a81EAB44d34ef01);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x94837E841d9D792a11658e113e4ffBFCeb4CFf4b);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x8FB777d67e9945E2c01936E319057F9d41D559e6);

    address internal constant POOL_ADMIN =
        0x85e4A467343c0dc4aDAB74Af84448D9c45D8ae6F;

    address internal constant EMERGENCY_ADMIN =
        0xc6cfB8bCA4691f661773fACc64E47A4eBaEd712f;
}
