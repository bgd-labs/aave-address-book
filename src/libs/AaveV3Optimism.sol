// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";


library AaveV3Optimism {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
        );

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xD81eb3728a631871a7eBBaD631b5f424909f0c77);

    address internal constant POOL_ADMIN =
        0xE50c8C619d05ff98b22Adf991F17602C774F785c;

    address internal constant ACL_ADMIN =
        0xE50c8C619d05ff98b22Adf991F17602C774F785c;
}
