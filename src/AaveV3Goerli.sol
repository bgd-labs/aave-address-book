// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

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

    ICollector internal constant COLLECTOR_CONTROLLER =
        ICollector(0x5665007321915c8f0E72d041315bA1AD15065337);

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0x0C501fB73808e1BD73cBDdd0c99237bbc481Bb58;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0xF2EBFA003f04f38Fc606a37ab8D1c015c015725c;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x1342dd8Ff58aee340e3C25268A4d08168cC5d990;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x7D17eCD9fc4F64F180227216befb9d8E2c723135;
}
