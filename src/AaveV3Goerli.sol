// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Goerli {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D);

    IPool internal constant POOL =
        IPool(0x368EedF3f56ad10b9bC57eed4Dac65B26Bb667f6);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x723d17Ee6a668C011F01553D19B850E425075665);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x5bed0810073cc9f0DacF73C648202249E87eF6cB);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x9BE876c6DC42215B00d7efe892E2691C3bc35d10);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x4c952A81A72A6BA2919a658feff1e7F023e4aadc);

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant COLLECTOR =
        0xFbAF383eB6c757faCb8cb19B68d5131aEbc5c11e;

    address internal constant COLLECTOR_CONTROLLER =
        0x5665007321915c8f0E72d041315bA1AD15065337;
}
