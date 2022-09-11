// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

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

    address internal constant COLLECTOR_CONTROLLER =
        0xADDcE1e19761577d7FBB278B1b3158891679a066;
}
