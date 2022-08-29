// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV2Testnet {
    string public constant AaveV2Goerli = "AaveV2Goerli";
    string public constant AaveV2Mumbai = "AaveV2Mumbai";
    string public constant AaveV2Fuji = "AaveV2Fuji";

    struct Market {
        ILendingPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        ILendingPool POOL;
        ILendingPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider AAVE_PROTOCOL_DATA_PROVIDER;
        address POOL_ADMIN;
        address EMERGENCY_ADMIN;
        address COLLECTOR;
        address COLLECTOR_CONTROLLER;
    }

    function getMarket(string calldata market)
        public
        pure
        returns (Market memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Goerli))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xa012e274b15B68abf26086591Cc0d2BB676c77C3
                    ),
                    ILendingPool(0x082307FbDEe3967141E96f9db16c4ea1f206F5A2),
                    ILendingPoolConfigurator(
                        0x9f7395123B05232E74B52D8368afb28C1ba7f86C
                    ),
                    IAaveOracle(0xD7f1238C02740A51A20f9857804B544C555a3802),
                    IAaveProtocolDataProvider(
                        0x0000000000000000000000000000000000000000
                    ),
                    0x4365F8e70CF38C6cA67DE41448508F2da8825500,
                    0x4365F8e70CF38C6cA67DE41448508F2da8825500,
                    0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c,
                    address(0)
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Mumbai))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0x178113104fEcbcD7fF8669a0150721e231F0FD4B
                    ),
                    ILendingPool(0x9198F13B08E299d85E096929fA9781A1E3d5d827),
                    ILendingPoolConfigurator(
                        0xc3c37E2aA3dc66464fa3C29ce2a6EC85beFC45e1
                    ),
                    IAaveOracle(0xC365C653f7229894F93994CD0b30947Ab69Ff1D5),
                    IAaveProtocolDataProvider(
                        0xFA3bD19110d986c5e5E9DD5F69362d05035D045B
                    ),
                    0x943E44157dC0302a5CEb172374d1749018a00994,
                    0x943E44157dC0302a5CEb172374d1749018a00994,
                    0x943E44157dC0302a5CEb172374d1749018a00994,
                    address(0)
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Fuji))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f
                    ),
                    ILendingPool(0x76cc67FF2CC77821A70ED14321111Ce381C2594D),
                    ILendingPoolConfigurator(
                        0x4ceBAFAAcc6Cb26FD90E4cDe138Eb812442bb5f3
                    ),
                    IAaveOracle(0xfa4f5B081632c4709667D467F817C09d9008A46A),
                    IAaveProtocolDataProvider(
                        0x0668EDE013c1c475724523409b8B6bE633469585
                    ),
                    0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e,
                    0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e,
                    0xB45F5C501A22288dfdb897e5f73E189597e09288,
                    address(0)
                );
        } else revert("Market does not exist");
    }
}
