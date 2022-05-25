// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";

library AaveAddressBookV3 {
    string public constant AaveV3Rinkeby = 'AaveV3Rinkeby';
    string public constant AaveV3Mumbai = 'AaveV3Mumbai';
    string public constant AaveV3Polygon = 'AaveV3Polygon';
    string public constant AaveV3Fuji = 'AaveV3Fuji';
    string public constant AaveV3Avalanche = 'AaveV3Avalanche';
    string public constant AaveV3ArbitrumRinkeby = 'AaveV3ArbitrumRinkeby';
    string public constant AaveV3Arbitrum = 'AaveV3Arbitrum';
    string public constant AaveV3FantomTestnet = 'AaveV3FantomTestnet';
    string public constant AaveV3Fantom = 'AaveV3Fantom';
    string public constant AaveV3HarmonyTestnet = 'AaveV3HarmonyTestnet';
    string public constant AaveV3Harmony = 'AaveV3Harmony';
    string public constant AaveV3OptimismKovan = 'AaveV3OptimismKovan';
    string public constant AaveV3Optimism = 'AaveV3Optimism';


    struct Market {
        IPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        IPool POOL;
        IPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        address POOL_ADMIN;
        address ACL_ADMIN;
    }

    function getMarket(string calldata market) public pure returns(Market memory m) {
        if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Rinkeby)))) {
            return Market(
                IPoolAddressesProvider(
                    0xBA6378f1c1D046e9EB0F538560BA7558546edF3C
                ),
                IPool(0xE039BdF1d874d27338e09B55CB09879Dedca52D8),
                IPoolConfigurator(0x11E9F019FCC15AccB472Aa49C8fc0c61949c86d5),
                IAaveOracle(0xA323726989db5708B19EAd4A494dDe09F3cEcc69),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Mumbai)))) {
            return Market(
                IPoolAddressesProvider(
                    0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6
                ),
                IPool(0x6C9fB0D5bD9429eb9Cd96B85B81d872281771E6B),
                IPoolConfigurator(0x7b47e727eC539CB74A744ae5259ef26743294fca),
                IAaveOracle(0x520D14AE678b41067f029Ad770E2870F85E76588),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Polygon)))) {
            return Market(
                IPoolAddressesProvider(
                    0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                ),
                IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E),
                IAaveOracle(0xb023e699F5a33916Ea823A16485e259257cA8Bd1),
                0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772,
                0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Fuji)))) {
            return Market(
                IPoolAddressesProvider(
                    0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29
                ),
                IPool(0xb47673b7a73D78743AFF1487AF69dBB5763F00cA),
                IPoolConfigurator(0x01743372F0F0318AaDF690f960A4c6c4eab58782),
                IAaveOracle(0xAc6D153BF94aFBdC296e72163735B0f94581F736),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Avalanche)))) {
            return Market(
                IPoolAddressesProvider(
                    0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                ),
                IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E),
                IAaveOracle(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C),
                0xa35b76E4935449E33C56aB24b23fcd3246f13470,
                0xa35b76E4935449E33C56aB24b23fcd3246f13470
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3ArbitrumRinkeby)))) {
            return Market(
                IPoolAddressesProvider(
                    0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c
                ),
                IPool(0x9C55a3C34de5fd46004Fa44a55490108f7cE388F),
                IPoolConfigurator(0xCf7e77c25e04d5F44AA20C505fbda04BFCF60c0b),
                IAaveOracle(0x2560A04c24E8870bB12eE7A9E2DcC4186362F3A1),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Arbitrum)))) {
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
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3FantomTestnet)))) {
            return Market(
                IPoolAddressesProvider(
                    0xE339D30cBa24C70dCCb82B234589E3C83249e658
                ),
                IPool(0x771A45a19cE333a19356694C5fc80c76fe9bc741),
                IPoolConfigurator(0x59B84a6C943dD655D9E3B4024fC6AdC0E3f4Ff60),
                IAaveOracle(0xA840C768f7143495790eC8dc2D5f32B71B6Dc113),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Fantom)))) {
            return Market(
                IPoolAddressesProvider(
                    0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                ),
                IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E),
                IAaveOracle(0xfd6f3c1845604C8AE6c6E402ad17fb9885160754),
                0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949,
                0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3HarmonyTestnet)))) {
            return Market(
                IPoolAddressesProvider(
                    0xd19443202328A66875a51560c28276868B8C61C2
                ),
                IPool(0x85C1F3f1bB439180f7Bfda9DFD61De82e10bD554),
                IPoolConfigurator(0xdb903B5a28260E87cF1d8B56740a90Dba1c8fe15),
                IAaveOracle(0x29Ff3c19C6853A0b6544b3CC241c360f422aBaD1),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Harmony)))) {
            return Market(
                IPoolAddressesProvider(
                    0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                ),
                IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E),
                IAaveOracle(0x3C90887Ede8D65ccb2777A5d577beAb2548280AD),
                0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D,
                0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3OptimismKovan)))) {
            return Market(
                IPoolAddressesProvider(
                    0xD15d36975A0200D11B8a8964F4F267982D2a1cFe
                ),
                IPool(0x139d8F557f70D1903787e929D7C42165c4667229),
                IPoolConfigurator(0x12F6E19b968e34fEE34763469c7EAf902Af6914B),
                IAaveOracle(0xce87225e5A0ABFe6241C6A60158840d509a84B47),
                0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                0x77c45699A715A64A7a7796d5CEe884cf617D5254
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV3Optimism)))) {
            return Market(
                IPoolAddressesProvider(
                    0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                ),
                IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E),
                IAaveOracle(0xD81eb3728a631871a7eBBaD631b5f424909f0c77),
                0xE50c8C619d05ff98b22Adf991F17602C774F785c,
                0xE50c8C619d05ff98b22Adf991F17602C774F785c
            );
        } else revert('Market does not exist');
    }
}
