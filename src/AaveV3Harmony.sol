// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Harmony {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x3C90887Ede8D65ccb2777A5d577beAb2548280AD);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

    address internal constant ACL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;

    address internal constant COLLECTOR =
        0x8A020d92D6B119978582BE4d3EdFdC9F7b28BF31;

    address internal constant COLLECTOR_CONTROLLER =
        0xeaC16519923774Fd7723d3D5E442a1e2E46BA962;

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0x929EC64c34a17401F460460D4B9390518E5B473e;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0xa5ba6E5EC19a1Bf23C857991c857dB62b2Aa187B;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x81387c40EB75acB02757C1Ae55D5936E78c9dEd3;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x52A1CeB68Ee6b7B5D13E0376A1E0E4423A8cE26e;
}
