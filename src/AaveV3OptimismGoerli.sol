// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

library AaveV3OptimismGoerli {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x74a328ED938160D702378Daeb7aB2504714B4E4b);

    IPool internal constant POOL =
        IPool(0x4b529A5d8268d74B687aC3dbb00e1b85bF4BF0d4);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x598fCb66f358d0C1396972a1BC30DeC2daB87E46);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x171Af9229972716f28DBB04DBFC712F05B45B021);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x42BdE9c98B80e83F1B051B4bb11812aDa314213a);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x9B14C2DEe92CE731da32bf861Ca4Fb2202662248);

    address internal constant ACL_ADMIN =
        0x4365F8e70CF38C6cA67DE41448508F2da8825500;

    address internal constant COLLECTOR =
        0x8Ee63E24D91317f9DabFf3c5361d747244c0f16c;

    ICollector internal constant COLLECTOR_CONTROLLER =
        ICollector(0xADDcE1e19761577d7FBB278B1b3158891679a066);

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0x0C501fB73808e1BD73cBDdd0c99237bbc481Bb58;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0x08483a8d324C94942D9B9071e5e4aB6F28da0DF1;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0xC642A760bE9F04b453b899f7F454b2AFe21C1C61;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0xff01517f8811E532900a46e6AdB4484BDB3f2B8a;
}
