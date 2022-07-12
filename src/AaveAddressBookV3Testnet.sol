// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV3Testnet {
    string public constant AaveV3Mumbai = "AaveV3Mumbai";
    string public constant AaveV3Fuji = "AaveV3Fuji";
    string public constant AaveV3FantomTestnet = "AaveV3FantomTestnet";
    string public constant AaveV3HarmonyTestnet = "AaveV3HarmonyTestnet";
    string public constant AaveV3OptimismKovan = "AaveV3OptimismKovan";

    struct Market {
        IPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        IPool POOL;
        IPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider POOL_DATA_PROVIDER;
        IACLManager ACL_MANAGER;
        address ACL_ADMIN;
        address COLLECTOR;
        address COLLECTOR_CONTROLLER;
    }

    function getMarket(string calldata market)
        public
        pure
        returns (Market memory m)
    {
        if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Mumbai)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6
                    ),
                    IPool(0x6C9fB0D5bD9429eb9Cd96B85B81d872281771E6B),
                    IPoolConfigurator(
                        0x7b47e727eC539CB74A744ae5259ef26743294fca
                    ),
                    IAaveOracle(0x520D14AE678b41067f029Ad770E2870F85E76588),
                    IAaveProtocolDataProvider(
                        0x8f57153F18b7273f9A814b93b31Cb3f9b035e7C2
                    ),
                    IACLManager(0x6437b6E14D7ECa1Fa9854df92eB067253D5f683A),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x3B6E7a4750e478D7f7d6A5d464099A02ef164bCC,
                    0x810d913542D399F3680F0E806DEDf6EACf0e3383
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Fuji)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29
                    ),
                    IPool(0xb47673b7a73D78743AFF1487AF69dBB5763F00cA),
                    IPoolConfigurator(
                        0x01743372F0F0318AaDF690f960A4c6c4eab58782
                    ),
                    IAaveOracle(0xAc6D153BF94aFBdC296e72163735B0f94581F736),
                    IAaveProtocolDataProvider(
                        0x8e0988b28f9CdDe0134A206dfF94111578498C63
                    ),
                    IACLManager(0xAa6Fd640173bcA58e5a5CC373531F9038eF3F9e1),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0xBaaCc99123133851Ba2D6d34952aa08CBDf5A4E4,
                    0xFCadBDefd30E11258559Ba239C8a5A8A8D28CB00
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3FantomTestnet)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xE339D30cBa24C70dCCb82B234589E3C83249e658
                    ),
                    IPool(0x771A45a19cE333a19356694C5fc80c76fe9bc741),
                    IPoolConfigurator(
                        0x59B84a6C943dD655D9E3B4024fC6AdC0E3f4Ff60
                    ),
                    IAaveOracle(0xA840C768f7143495790eC8dc2D5f32B71B6Dc113),
                    IAaveProtocolDataProvider(
                        0xCbAcff915f2d10727844ab0f2A4D9768954981e4
                    ),
                    IACLManager(0x94f154aba287b3024fb32386463FC52d488bb09B),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0xF49dA7a22463D140f9f8dc7C91468C8721215496,
                    0x7aaB2c2CC186131851d6B1876D16eDc849846042
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3HarmonyTestnet)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xd19443202328A66875a51560c28276868B8C61C2
                    ),
                    IPool(0x85C1F3f1bB439180f7Bfda9DFD61De82e10bD554),
                    IPoolConfigurator(
                        0xdb903B5a28260E87cF1d8B56740a90Dba1c8fe15
                    ),
                    IAaveOracle(0x29Ff3c19C6853A0b6544b3CC241c360f422aBaD1),
                    IAaveProtocolDataProvider(
                        0xFc7215C9498Fc12b22Bc0ed335871Db4315f03d3
                    ),
                    IACLManager(0x1758d4e6f68166C4B2d9d0F049F33dEB399Daa1F),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x9aa7fEc87CA69695Dd1f879567CcF49F3ba417E2,
                    0x85E44420b6137bbc75a85CAB5c9A3371af976FdE
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3OptimismKovan)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xD15d36975A0200D11B8a8964F4F267982D2a1cFe
                    ),
                    IPool(0x139d8F557f70D1903787e929D7C42165c4667229),
                    IPoolConfigurator(
                        0x12F6E19b968e34fEE34763469c7EAf902Af6914B
                    ),
                    IAaveOracle(0xce87225e5A0ABFe6241C6A60158840d509a84B47),
                    IAaveProtocolDataProvider(
                        0x2f733c0389bfF96a3f930Deb2f6DB1d767Cd3215
                    ),
                    IACLManager(0x552626e2E6e35566d53CE0C5Ad97d72E95bC3fc3),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x733DC8C72B189791B28Dc8c6Fb09D9201b01eF2f,
                    0x9b791f6A34B2C87c360902F050dA5e0075b7A567
                );
        } else revert("Market does not exist");
    }
}
