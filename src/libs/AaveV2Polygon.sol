// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library AaveV2Polygon {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xd05e3E715d945B59290df0ae8eF85c1BdB684744
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x26db2B833021583566323E3b8985999981b9F1F3);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d);

    address internal constant POOL_ADMIN =
        0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772;

    address internal constant EMERGENCY_ADMIN =
        0x1450F2898D6bA2710C98BE9CAF3041330eD5ae58;
}
