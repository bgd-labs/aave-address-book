// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

library AaveV3Fuji {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29);

    IPool internal constant POOL =
        IPool(0xb47673b7a73D78743AFF1487AF69dBB5763F00cA);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x01743372F0F0318AaDF690f960A4c6c4eab58782);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xAc6D153BF94aFBdC296e72163735B0f94581F736);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x8e0988b28f9CdDe0134A206dfF94111578498C63);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xAa6Fd640173bcA58e5a5CC373531F9038eF3F9e1);

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant COLLECTOR =
        0xBaaCc99123133851Ba2D6d34952aa08CBDf5A4E4;

    ICollector internal constant COLLECTOR_CONTROLLER =
        ICollector(0xFCadBDefd30E11258559Ba239C8a5A8A8D28CB00);

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0x58Cd851c28dF05Edc7F018B533C0257DE57673f7;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0xA3a8697C4C6A7D9ccF9238cb567b122d53012ac9;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x651b8A8cA545b251a8f49B57D5838Da0a8DFbEF9;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x06Db7973d6D724Eb15404a0d178624f6e07834F9;
}
