// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3OptimismKovan {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xD15d36975A0200D11B8a8964F4F267982D2a1cFe);

    IPool internal constant POOL =
        IPool(0x139d8F557f70D1903787e929D7C42165c4667229);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x12F6E19b968e34fEE34763469c7EAf902Af6914B);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xce87225e5A0ABFe6241C6A60158840d509a84B47);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x2f733c0389bfF96a3f930Deb2f6DB1d767Cd3215);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x552626e2E6e35566d53CE0C5Ad97d72E95bC3fc3);

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant COLLECTOR =
        0x733DC8C72B189791B28Dc8c6Fb09D9201b01eF2f;

    address internal constant COLLECTOR_CONTROLLER =
        0x9b791f6A34B2C87c360902F050dA5e0075b7A567;
}
