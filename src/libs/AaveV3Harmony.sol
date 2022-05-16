// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";


library AaveV3Harmony {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
        );

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x3C90887Ede8D65ccb2777A5d577beAb2548280AD);

    address internal constant POOL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;

    address internal constant ACL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;
}
