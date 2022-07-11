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
                    0x73D435AFc15e35A9aC63B2a81B5AA54f974eadFe
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

    function getToken(string calldata market, string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Polygon))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063,
                        0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                        0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B,
                        0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39,
                        0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                        0x89D976629b7055ff1ca02b927BA3e020F22A44e4,
                        0x953A573793604aF8d41F306FEb8274190dB4aE0e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174,
                        0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                        0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                        0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6,
                        0x078f358208685046a11C85e8ad32895DED33A249,
                        0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                        0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619,
                        0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                        0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                        0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xc2132D05D31c914a87C6611C10748AEb04B58e8F,
                        0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                        0x70eFfc565DB6EEf7B927610155602d31b670e802,
                        0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xD6DF932A45C0f255f85145f286eA0b292B21C90B,
                        0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                        0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                        0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WMATIC"))
            ) {
                return
                    Token(
                        0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270,
                        0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                        0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E,
                        0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0x172370d5Cd63279eFa6d502DAB29171933a610AF,
                        0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf,
                        0x08Cb71192985E936C7Cd166A8b268035e400c3c3,
                        0x77CA01483f379E58174739308945f044e1a764dc
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a,
                        0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA,
                        0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841,
                        0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("GHST"))
            ) {
                return
                    Token(
                        0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7,
                        0x8Eb270e296023E9D92081fdF967dDd7878724424,
                        0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc,
                        0xCE186F6Cccb0c955445bb9d10C59caE488Fea559
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("BAL"))
            ) {
                return
                    Token(
                        0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3,
                        0x8ffDf2DE812095b1D19CB146E4c004587C0A0692,
                        0xa5e408678469d23efDB7694b1B0A85BB0669e8bd,
                        0xA8669021776Bc142DfcA87c21b4A52595bCbB40a
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DPI"))
            ) {
                return
                    Token(
                        0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369,
                        0x724dc807b04555b71ed48a6896b6F41593b8C637,
                        0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a,
                        0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0xE111178A87A3BFf0c8d18DECBa5798827539Ae99,
                        0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5,
                        0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB,
                        0x5D557B07776D12967914379C71a1310e917C7555
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("jEUR"))
            ) {
                return
                    Token(
                        0x4e3Decbb3645551B8A19f0eA1678079FCB33fB4c,
                        0x6533afac2E7BCCB20dca161449A13A32D391fb00,
                        0x6B4b37618D85Db2a7b469983C888040F7F05Ea3D,
                        0x44705f578135cC5d703b4c9c122528C73Eb87145
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("agEUR"))
            ) {
                return
                    Token(
                        0xE0B52e49357Fd4DAf2c15e02058DCE6BC0057db4,
                        0x8437d7C167dFB82ED4Cb79CD44B7a32A1dd95c77,
                        0x40B4BAEcc69B882e8804f9286b12228C27F8c9BF,
                        0x3ca5FA07689F266e907439aFd1fBB59c44fe12f6
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Avalanche))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI.e"))
            ) {
                return
                    Token(
                        0xd586E7F844cEa2F87f50152665BCbc2C279D8d70,
                        0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                        0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B,
                        0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK.e"))
            ) {
                return
                    Token(
                        0x5947BB275c521040051D82396192181b413227A3,
                        0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                        0x89D976629b7055ff1ca02b927BA3e020F22A44e4,
                        0x953A573793604aF8d41F306FEb8274190dB4aE0e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E,
                        0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                        0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                        0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC.e"))
            ) {
                return
                    Token(
                        0x50b7545627a5162F82A992c33b87aDc75187B218,
                        0x078f358208685046a11C85e8ad32895DED33A249,
                        0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                        0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH.e"))
            ) {
                return
                    Token(
                        0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB,
                        0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                        0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                        0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDt"))
            ) {
                return
                    Token(
                        0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7,
                        0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                        0x70eFfc565DB6EEf7B927610155602d31b670e802,
                        0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE.e"))
            ) {
                return
                    Token(
                        0x63a72806098Bd3D9520cC43356dD78afe5D386D9,
                        0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                        0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                        0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WAVAX"))
            ) {
                return
                    Token(
                        0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7,
                        0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                        0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E,
                        0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("sAVAX"))
            ) {
                return
                    Token(
                        0x2b2C81e08f1Af8835a78Bb2A90AE924ACE0eA4bE,
                        0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf,
                        0x08Cb71192985E936C7Cd166A8b268035e400c3c3,
                        0x77CA01483f379E58174739308945f044e1a764dc
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Arbitrum))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1,
                        0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                        0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B,
                        0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xf97f4df75117a78c1A5a0DBb814Af92458539FB4,
                        0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                        0x89D976629b7055ff1ca02b927BA3e020F22A44e4,
                        0x953A573793604aF8d41F306FEb8274190dB4aE0e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8,
                        0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                        0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                        0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f,
                        0x078f358208685046a11C85e8ad32895DED33A249,
                        0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                        0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x82aF49447D8a07e3bd95BD0d56f35241523fBab1,
                        0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                        0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                        0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9,
                        0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                        0x70eFfc565DB6EEf7B927610155602d31b670e802,
                        0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xba5DdD1f9d7F570dc94a51479a000E3BCE967196,
                        0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                        0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                        0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0xD22a58f79e9481D1a88e00c343885A588b34b68B,
                        0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                        0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E,
                        0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Fantom))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x8D11eC38a3EB5E956B052f67Da8Bdc9bef8Abf3E,
                        0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                        0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B,
                        0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xb3654dc3D10Ea7645f8319668E8F54d2574FBdC8,
                        0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                        0x89D976629b7055ff1ca02b927BA3e020F22A44e4,
                        0x953A573793604aF8d41F306FEb8274190dB4aE0e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x04068DA6C83AFCFA0e13ba15A6696662335D5B75,
                        0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                        0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                        0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("BTC"))
            ) {
                return
                    Token(
                        0x321162Cd933E2Be498Cd2267a90534A804051b11,
                        0x078f358208685046a11C85e8ad32895DED33A249,
                        0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                        0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("ETH"))
            ) {
                return
                    Token(
                        0x74b23882a30290451A17c44f4F05243b6b58C76d,
                        0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                        0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                        0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("fUSDT"))
            ) {
                return
                    Token(
                        0x049d68029688eAbF473097a2fC38ef61633A3C7A,
                        0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                        0x70eFfc565DB6EEf7B927610155602d31b670e802,
                        0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x6a07A792ab2965C72a5B8088d3a069A7aC3a993B,
                        0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                        0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                        0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WFTM"))
            ) {
                return
                    Token(
                        0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83,
                        0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                        0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E,
                        0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0x1E4F97b9f9F913c46F1632781732927B9019C68b,
                        0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf,
                        0x08Cb71192985E936C7Cd166A8b268035e400c3c3,
                        0x77CA01483f379E58174739308945f044e1a764dc
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0xae75A438b2E0cB8Bb01Ec1E1e376De11D44477CC,
                        0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA,
                        0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841,
                        0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Harmony))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("1DAI"))
            ) {
                return
                    Token(
                        0xEf977d2f931C1978Db5F6747666fa1eACB0d0339,
                        0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                        0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B,
                        0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x218532a12a389a4a92fC0C5Fb22901D1c19198aA,
                        0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                        0x89D976629b7055ff1ca02b927BA3e020F22A44e4,
                        0x953A573793604aF8d41F306FEb8274190dB4aE0e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("1USDC"))
            ) {
                return
                    Token(
                        0x985458E523dB3d53125813eD68c274899e9DfAb4,
                        0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                        0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                        0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("1WBTC"))
            ) {
                return
                    Token(
                        0x3095c7557bCb296ccc6e363DE01b760bA031F2d9,
                        0x078f358208685046a11C85e8ad32895DED33A249,
                        0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                        0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("1ETH"))
            ) {
                return
                    Token(
                        0x6983D1E6DEf3690C4d616b13597A09e6193EA013,
                        0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                        0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                        0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("1USDT"))
            ) {
                return
                    Token(
                        0x3C2B8Be99c50593081EAA2A724F0B8285F5aba8f,
                        0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                        0x70eFfc565DB6EEf7B927610155602d31b670e802,
                        0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("1AAVE"))
            ) {
                return
                    Token(
                        0xcF323Aad9E522B93F11c352CaA519Ad0E14eB40F,
                        0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                        0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                        0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WONE"))
            ) {
                return
                    Token(
                        0xcF664087a5bB0237a0BAd6742852ec6c8d69A27a,
                        0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                        0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E,
                        0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Optimism))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1,
                        0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                        0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B,
                        0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x350a791Bfc2C21F9Ed5d10980Dad2e2638ffa7f6,
                        0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                        0x89D976629b7055ff1ca02b927BA3e020F22A44e4,
                        0x953A573793604aF8d41F306FEb8274190dB4aE0e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x7F5c764cBc14f9669B88837ca1490cCa17c31607,
                        0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                        0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                        0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x68f180fcCe6836688e9084f035309E29Bf0A2095,
                        0x078f358208685046a11C85e8ad32895DED33A249,
                        0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                        0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x4200000000000000000000000000000000000006,
                        0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                        0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                        0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x94b008aA00579c1307B0EF2c499aD98a8ce58e58,
                        0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                        0x70eFfc565DB6EEf7B927610155602d31b670e802,
                        0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x76FB31fb4af56892A25e32cFC43De717950c9278,
                        0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                        0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                        0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("sUSD"))
            ) {
                return
                    Token(
                        0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9,
                        0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                        0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E,
                        0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
                    );
            } else revert("Token does not exist");
        } else revert("Market does not exist");
    }
}
