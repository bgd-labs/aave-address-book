// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV3 {
    string public constant AaveV3Polygon = "AaveV3Polygon";
    string public constant AaveV3Avalanche = "AaveV3Avalanche";
    string public constant AaveV3Arbitrum = "AaveV3Arbitrum";
    string public constant AaveV3Fantom = "AaveV3Fantom";
    string public constant AaveV3Harmony = "AaveV3Harmony";
    string public constant AaveV3Optimism = "AaveV3Optimism";

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
            keccak256(abi.encodePacked((AaveV3Polygon)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                    ),
                    IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                    IPoolConfigurator(
                        0x8145eddDf43f50276641b55bd3AD95944510021E
                    ),
                    IAaveOracle(0xb023e699F5a33916Ea823A16485e259257cA8Bd1),
                    IAaveProtocolDataProvider(
                        0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654
                    ),
                    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B),
                    0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772,
                    0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383,
                    0xDB89487A449274478e984665b8692AfC67459deF
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Avalanche)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                    ),
                    IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                    IPoolConfigurator(
                        0x8145eddDf43f50276641b55bd3AD95944510021E
                    ),
                    IAaveOracle(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C),
                    IAaveProtocolDataProvider(
                        0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654
                    ),
                    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B),
                    0xa35b76E4935449E33C56aB24b23fcd3246f13470,
                    0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0,
                    0xaCbE7d574EF8dC39435577eb638167Aca74F79f0
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Arbitrum)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                    ),
                    IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                    IPoolConfigurator(
                        0x8145eddDf43f50276641b55bd3AD95944510021E
                    ),
                    IAaveOracle(0xb56c2F0B653B2e0b10C9b928C8580Ac5Df02C7C7),
                    IAaveProtocolDataProvider(
                        0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654
                    ),
                    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B),
                    0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb,
                    0x053D55f9B5AF8694c503EB288a1B7E552f590710,
                    0xC3301b30f4EcBfd59dE0d74e89690C1a70C6f21B
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Fantom)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                    ),
                    IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                    IPoolConfigurator(
                        0x8145eddDf43f50276641b55bd3AD95944510021E
                    ),
                    IAaveOracle(0xfd6f3c1845604C8AE6c6E402ad17fb9885160754),
                    IAaveProtocolDataProvider(
                        0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654
                    ),
                    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B),
                    0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949,
                    0xBe85413851D195fC6341619cD68BfDc26a25b928,
                    0xc0F0cFBbd0382BcE3B93234E4BFb31b2aaBE36aD
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Harmony)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                    ),
                    IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                    IPoolConfigurator(
                        0x8145eddDf43f50276641b55bd3AD95944510021E
                    ),
                    IAaveOracle(0x3C90887Ede8D65ccb2777A5d577beAb2548280AD),
                    IAaveProtocolDataProvider(
                        0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654
                    ),
                    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B),
                    0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D,
                    0x8A020d92D6B119978582BE4d3EdFdC9F7b28BF31,
                    0xeaC16519923774Fd7723d3D5E442a1e2E46BA962
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3Optimism)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
                    ),
                    IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD),
                    IPoolConfigurator(
                        0x8145eddDf43f50276641b55bd3AD95944510021E
                    ),
                    IAaveOracle(0xD81eb3728a631871a7eBBaD631b5f424909f0c77),
                    IAaveProtocolDataProvider(
                        0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654
                    ),
                    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B),
                    0xE50c8C619d05ff98b22Adf991F17602C774F785c,
                    0xB2289E329D2F85F1eD31Adbb30eA345278F21bcf,
                    0xA77E4A084d7d4f064E326C0F6c0aCefd47A5Cb21
                );
        } else revert("Market does not exist");
    }
}
