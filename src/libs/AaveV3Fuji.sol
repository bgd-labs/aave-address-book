// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";


library AaveV3Fuji {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29
        );

    IPool internal constant POOL =
        IPool(0xb47673b7a73D78743AFF1487AF69dBB5763F00cA);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x01743372F0F0318AaDF690f960A4c6c4eab58782);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xAc6D153BF94aFBdC296e72163735B0f94581F736);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;
}
