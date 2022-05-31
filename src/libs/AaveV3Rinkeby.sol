// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";


library AaveV3Rinkeby {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0xBA6378f1c1D046e9EB0F538560BA7558546edF3C
        );

    IPool internal constant POOL =
        IPool(0xE039BdF1d874d27338e09B55CB09879Dedca52D8);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x11E9F019FCC15AccB472Aa49C8fc0c61949c86d5);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA323726989db5708B19EAd4A494dDe09F3cEcc69);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;
}
