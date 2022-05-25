// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library AaveV2Kovan {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x88757f2f99175387aB4C6a4b3067c77A695b0349
        );

    ILendingPool internal constant POOL =
        ILendingPool(0xE0fBa4Fc209b4948668006B2bE61711b7f465bAe);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x25D0106aaB3F906F00C1E59716Bb5F749dB12ccE);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xB8bE51E6563BB312Cbb2aa26e352516c25c26ac1);

    address internal constant POOL_ADMIN =
        0x85e4A467343c0dc4aDAB74Af84448D9c45D8ae6F;

    address internal constant EMERGENCY_ADMIN =
        0xc6cfB8bCA4691f661773fACc64E47A4eBaEd712f;
}
