// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3HarmonyTestnet {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xd19443202328A66875a51560c28276868B8C61C2);

    IPool internal constant POOL =
        IPool(0x85C1F3f1bB439180f7Bfda9DFD61De82e10bD554);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0xdb903B5a28260E87cF1d8B56740a90Dba1c8fe15);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x29Ff3c19C6853A0b6544b3CC241c360f422aBaD1);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0xFc7215C9498Fc12b22Bc0ed335871Db4315f03d3);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x1758d4e6f68166C4B2d9d0F049F33dEB399Daa1F);

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant COLLECTOR =
        0x9aa7fEc87CA69695Dd1f879567CcF49F3ba417E2;

    address internal constant COLLECTOR_CONTROLLER =
        0x85E44420b6137bbc75a85CAB5c9A3371af976FdE;
}
