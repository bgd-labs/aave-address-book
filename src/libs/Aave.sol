// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";

library AaveAddressesV2 {
    string public constant AAVE_V2_ETH = 'AAVE_V2_ETH';

    struct Market {
        IPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        IPool POOL;
        IPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        address POOL_ADMIN;
        address ACL_ADMIN;
    }

    function getMarket(string calldata market) public pure returns(Market memory m) {
        if(keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AAVE_V2_ETH)))) {
            return Market(
                IPoolAddressesProvider(
                    0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                ),
                IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E),
                IAaveOracle(0xb56c2F0B653B2e0b10C9b928C8580Ac5Df02C7C7),
                0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb,
                0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb
            );
        }
    }
}