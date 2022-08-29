// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV3Testnet {
    string public constant AaveV3Goerli = "AaveV3Goerli";
    string public constant AaveV3Mumbai = "AaveV3Mumbai";
    string public constant AaveV3Fuji = "AaveV3Fuji";
    string public constant AaveV3ArbitrumGoerli = "AaveV3ArbitrumGoerli";
    string public constant AaveV3FantomTestnet = "AaveV3FantomTestnet";
    string public constant AaveV3OptimismGoerli = "AaveV3OptimismGoerli";

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
            keccak256(abi.encodePacked((AaveV3Goerli)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D
                    ),
                    IPool(0x368EedF3f56ad10b9bC57eed4Dac65B26Bb667f6),
                    IPoolConfigurator(
                        0x723d17Ee6a668C011F01553D19B850E425075665
                    ),
                    IAaveOracle(0x5bed0810073cc9f0DacF73C648202249E87eF6cB),
                    IAaveProtocolDataProvider(
                        0x9BE876c6DC42215B00d7efe892E2691C3bc35d10
                    ),
                    IACLManager(0x4c952A81A72A6BA2919a658feff1e7F023e4aadc),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0xFbAF383eB6c757faCb8cb19B68d5131aEbc5c11e,
                    0x5665007321915c8f0E72d041315bA1AD15065337
                );
        } else if (
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
            keccak256(abi.encodePacked((AaveV3ArbitrumGoerli)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xF8aa90E66B8BAe13f2e4aDe6104abAb8eeDaBfdc
                    ),
                    IPool(0x6Cbb4E8eC402E07fDF96DbbC6c752aCfB0eB6075),
                    IPoolConfigurator(
                        0x279Dd50e124D45bDeDCF408849937A4985e56dD2
                    ),
                    IAaveOracle(0x86b4D2636EC473AC4A5dD83Fc2BEDa98845249A7),
                    IAaveProtocolDataProvider(
                        0xce3Aa85237C075d2102b7B35079d305307D745C8
                    ),
                    IACLManager(0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383),
                    0x4365F8e70CF38C6cA67DE41448508F2da8825500,
                    0xad848879F9Ac276BdB7D38123F381C692FD6D6dE,
                    0xff01517f8811E532900a46e6AdB4484BDB3f2B8a
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
            keccak256(abi.encodePacked((AaveV3OptimismGoerli)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0x74a328ED938160D702378Daeb7aB2504714B4E4b
                    ),
                    IPool(0x4b529A5d8268d74B687aC3dbb00e1b85bF4BF0d4),
                    IPoolConfigurator(
                        0x598fCb66f358d0C1396972a1BC30DeC2daB87E46
                    ),
                    IAaveOracle(0x171Af9229972716f28DBB04DBFC712F05B45B021),
                    IAaveProtocolDataProvider(
                        0x42BdE9c98B80e83F1B051B4bb11812aDa314213a
                    ),
                    IACLManager(0x9B14C2DEe92CE731da32bf861Ca4Fb2202662248),
                    0x4365F8e70CF38C6cA67DE41448508F2da8825500,
                    0x8Ee63E24D91317f9DabFf3c5361d747244c0f16c,
                    0xADDcE1e19761577d7FBB278B1b3158891679a066
                );
        } else revert("Market does not exist");
    }
}
