// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

library AaveV3Arbitrum {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xb56c2F0B653B2e0b10C9b928C8580Ac5Df02C7C7);

    IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IPoolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

    address internal constant ACL_ADMIN =
        0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb;

    address internal constant COLLECTOR =
        0x053D55f9B5AF8694c503EB288a1B7E552f590710;

    ICollector internal constant COLLECTOR_CONTROLLER =
        ICollector(0xC3301b30f4EcBfd59dE0d74e89690C1a70C6f21B);

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0x929EC64c34a17401F460460D4B9390518E5B473e;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0xa5ba6E5EC19a1Bf23C857991c857dB62b2Aa187B;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x81387c40EB75acB02757C1Ae55D5936E78c9dEd3;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x52A1CeB68Ee6b7B5D13E0376A1E0E4423A8cE26e;

    address internal constant EMISSION_MANAGER =
        0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;

    address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
        0x770ef9f4fe897e59daCc474EF11238303F9552b6;
    address internal constant WETH_GATEWAY =
        0xB5Ee21786D28c5Ba61661550879475976B707099;
    address internal constant SWAP_COLLATERAL_ADAPTER =
        0xAE9f94BD98eC2831a1330e0418bE0fDb5C95C2B9;
    address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
        0x32FdC26aFFA1eB331263Bcdd59F2e46eCbCC2E24;
}
