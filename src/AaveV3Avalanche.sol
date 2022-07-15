// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Avalanche {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

    address internal constant ACL_ADMIN =
        0xa35b76E4935449E33C56aB24b23fcd3246f13470;

    address internal constant COLLECTOR =
        0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0;

    address internal constant COLLECTOR_CONTROLLER =
        0xaCbE7d574EF8dC39435577eb638167Aca74F79f0;
}
