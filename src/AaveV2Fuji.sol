// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";

library AaveV2Fuji {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x76cc67FF2CC77821A70ED14321111Ce381C2594D);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x4ceBAFAAcc6Cb26FD90E4cDe138Eb812442bb5f3);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xfa4f5B081632c4709667D467F817C09d9008A46A);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x0668EDE013c1c475724523409b8B6bE633469585);

    address internal constant POOL_ADMIN =
        0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e;

    address internal constant EMERGENCY_ADMIN =
        0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e;

    address internal constant COLLECTOR =
        0xB45F5C501A22288dfdb897e5f73E189597e09288;

    address internal constant COLLECTOR_CONTROLLER = address(0);

    address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
        0x04A6Fa9999E3C807Ee7b6Ca58eFAb93713d405BF;
    address internal constant WETH_GATEWAY =
        0x1648C14DbB6ccdd5846969cE23DeEC4C66a03335;
    address internal constant FAUCET =
        0x90E5BAc5A98fff59617080848959f44eACB4Cd7B;
}
