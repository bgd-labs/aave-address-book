// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library AaveV2Fuji {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x76cc67FF2CC77821A70ED14321111Ce381C2594D);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x4ceBAFAAcc6Cb26FD90E4cDe138Eb812442bb5f3);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xfa4f5B081632c4709667D467F817C09d9008A46A);

    address internal constant POOL_ADMIN =
        0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e;

    address internal constant EMERGENCY_ADMIN =
        0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e;
}
