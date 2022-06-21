// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV3Testnet {
    string public constant AaveV3Rinkeby = "AaveV3Rinkeby";
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
        address POOL_ADMIN;
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
            keccak256(abi.encodePacked((AaveV3Rinkeby)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xBA6378f1c1D046e9EB0F538560BA7558546edF3C
                    ),
                    IPool(0xE039BdF1d874d27338e09B55CB09879Dedca52D8),
                    IPoolConfigurator(
                        0x11E9F019FCC15AccB472Aa49C8fc0c61949c86d5
                    ),
                    IAaveOracle(0xA323726989db5708B19EAd4A494dDe09F3cEcc69),
                    IAaveProtocolDataProvider(
                        0xBAB2E7afF5acea53a43aEeBa2BA6298D8056DcE5
                    ),
                    IACLManager(0x74E3445f239f9915D57715Efb810f67b2a7E5758),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0xD1D7347DC861A86Cb5ba39fdD7f8335aCa7bD81A,
                    0x45F1e6D6F206bBe33d495Ef94F64C1CF6e50D1BE
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x733DC8C72B189791B28Dc8c6Fb09D9201b01eF2f,
                    0x9b791f6A34B2C87c360902F050dA5e0075b7A567
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
            keccak256(abi.encodePacked(AaveV3Rinkeby))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x4aAded56bd7c69861E8654719195fCA9C670EB45,
                        0x49866611AA7Dc30130Ac6A0DF29217D16FD87bc0,
                        0x0F48c09701B6D24d6D9571637758EE06eeCb9630,
                        0x37768F60EfcFF96188530B022e3DE9d168c2c8E8
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x237f409fBD10E30e237d63d9050Ae302e339028E,
                        0xeC4752053c5A693eBE6A07deF330a9F97D07FBC3,
                        0x4e63D3ff7Bca937FAD4e1b0e9aF4f946f2AAaE64,
                        0x34c5DAeC73aE986Bf93bCf22d41e505264A86625
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xb18d016cDD2d9439A19f15633005A6b2cd6Aa774,
                        0x50b283C17b0Fc2a36c550A57B1a133459F4391B3,
                        0xee3D33c0C779cAD53CAa496aa5a97D026D1218Ca,
                        0x0EfFd205184FE944f9eF80264b144270dB15eEa7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x124F70a8a3246F177b0067F435f5691Ee4e467DD,
                        0xeC1d8303b8fa33afB59012Fc3b49458B57883326,
                        0x372C35caeED54907d694DF6229319779fbC79440,
                        0x3eA8e63b6e7260C2D6cfc3877914cbB6eE687D6B
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0xd74047010D77c5901df5b0f9ca518aED56C85e8D,
                        0x608D11E704baFb68CfEB154bF7Fd641120e33aD4,
                        0x7666ca6911bEcBA7d38Fa2da8278b82297EC7e6F,
                        0x252C97371c9Ad590898fcDb0C401d9230939A78F
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x326005cFdF58bfB38650396836BEBF815F5ab4dD,
                        0x377D3F732CBeB84D0EebF71e1a4e3546Da86C76d,
                        0xCC28d19D8e8A64D2Fc1709e8FE7b6139e25Fd524,
                        0x427cd2ad9Fe0B63ec26Df3aA83D4048149B3DCB3
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x100aB78E5A565a94f2a191714A7a1B727268eFFb,
                        0x3fc92c5f08c361EB21ef86a31d55df4b92ab7874,
                        0x951a8575A0b18A1180D5e8DD0e2e646E235b42bb,
                        0xd2693256be8c567d26D50f4B04479bD49a3aC3B5
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0x7eEB186F13538e6795a0823e2D7283FEeD2738f5,
                        0xC6B64D19EeF69071F32b043F8e57e506A86B8612,
                        0xEa7619f4AE50C3a6ad07e8Bd029b937B8D57A2b8,
                        0x31e1005A6d7e48055b3BA617E4337Fb04D2C9EE0
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Mumbai))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x9A753f0F7886C9fbF63cF59D0D4423C5eFaCE95B,
                        0xDD4f3Ee61466C4158D394d57f3D4C397E91fBc51,
                        0x333C04243D048836d53b4ACB3c9aE64875699375,
                        0xB18041Ce2439774c4c7BF611a2a635824cE99032
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xD9E7e5dd6e122dDE11244e14A60f38AbA93097f2,
                        0x3e1608F4Db4b37DDf86536ef441890fE3AA9F2Ea,
                        0x27908f7216Efe649706B68b6a443623D9aaF16D0,
                        0x292f1Cc1BcedCd22E860c7C92D21877774B44C16
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x9aa7fEc87CA69695Dd1f879567CcF49F3ba417E2,
                        0xCdc2854e97798AfDC74BC420BD5060e022D14607,
                        0x01dBEdcb2437c79341cfeC4Cae765C53BE0E6EF7,
                        0xA24A380813FB7E283Acb8221F5E1e3C01052Bc93
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x85E44420b6137bbc75a85CAB5c9A3371af976FdE,
                        0xde230bC95a03b695be69C44b9AA6C0e9dAc1B143,
                        0x5BcBF666e14eCFe6e21686601c5cA7c7fbe674Cf,
                        0xFDf3B7af2Cb32E5ADca11cf54d53D02162e8d622
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0xd575d4047f8c667E064a4ad433D04E25187F40BB,
                        0x685bF4eab23993E94b4CFb9383599c926B66cF57,
                        0xC9Ac53b6ae1C653A54ab0E9D44693E807429aF1F,
                        0xb0c924f61B27cf3C114CBD70def08c62843ebb3F
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x21C561e551638401b937b03fE5a0a0652B99B7DD,
                        0x6Ca4abE253bd510fCA862b5aBc51211C1E1E8925,
                        0xc601b4d43aF91fE4EAe327a2d2B12f37a568E05B,
                        0x444672831D8E4A2350667C14E007F56BEfFcB79f
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x0AB1917A0cf92cdcf7F7b637EaC3A46BBBE41409,
                        0x50434C5Da807189622Db5fff66379808c58574aD,
                        0x26Df87542C50326A5085764b1F650EF2514776B6,
                        0xb571dcf478E2cC6c0871402fa3Dd4a3C8f6BE66E
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WMATIC"))
            ) {
                return
                    Token(
                        0xb685400156cF3CBE8725958DeAA61436727A30c3,
                        0x89a6AE840b3F8f489418933A220315eeA36d11fF,
                        0xEC59F2FB4EF0C46278857Bf2eC5764485974D17B,
                        0x02a5680AE3b7383854Bf446b1B3Be170E67E689C
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0x3e4b51076d7e9B844B92F8c6377087f9cf8C8696,
                        0x4e752fB98b0dCC90b6772f23C52aD33b795dc758,
                        0x4a6F74A19f05529aF7E7e9f00923FFB990aeBE7B,
                        0xB6704e124997030cE773BB35C1Cc154CF5cE06fB
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0xdDc3C9B8614092e6188A86450c8D597509893E20,
                        0xb7EA2d40B845A1B49E59c9a5f8B6F67b3c48fA04,
                        0x169E542d769137E82E704477aDdfFe89e7FB9b90,
                        0x95230060256d957F852db649B381045ace7983Cc
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("GHST"))
            ) {
                return
                    Token(
                        0x8AaF462990dD5CC574c94C8266208996426A47e7,
                        0x128cB3720f5d220e1E35512917c3c7fFf064A858,
                        0x03d6be9Bc91956A0bc39f515CaA77C8C0f81c3fC,
                        0x1170823EA41B03e2258f228f617cB549C1faDf28
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("BAL"))
            ) {
                return
                    Token(
                        0xE3981f4840843D67aF50026d34DA0f7e56A02D69,
                        0x6236bfBfB3b6CDBFC311399BE346d61Ab8ab1094,
                        0xf28E16644C6389b1B6cF03b3120726b1FfAeDC6E,
                        0xB70013Bde95589330F87cE9a5bD06a89Bc26e38d
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DPI"))
            ) {
                return
                    Token(
                        0x56e0507A53Ee252947a1E55D84Dc4032F914DD98,
                        0xf815E724973ff3f5Eedc243eAE1a34D1f2a45e0C,
                        0x2C64B0ef18bC0616291Dc636b1738DbC675C3f0d,
                        0x6bB285977693F47AC6799F0B3B159130018f4c9c
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0x302567472401C7c7B50ee7eb3418c375D8E3F728,
                        0xf6AeDD279Aae7361e70030515f56c22A16d81433,
                        0xaB7cDf4C6053873650695352634987BbEe472c05,
                        0x6Fb76894E171eEDF94BB33E650Af90DfdA2c37FC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("JEUR"))
            ) {
                return
                    Token(
                        0xBaaCc99123133851Ba2D6d34952aa08CBDf5A4E4,
                        0x04cdAA74B111b49EF4044455324C0dDb1C2aa783,
                        0xdAc793dc4A6850765F0f55224CC77425e67C2b6e,
                        0x97CD2BA205ff6FF09332892AB216B665793fc39E
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AGEUR"))
            ) {
                return
                    Token(
                        0xFCadBDefd30E11258559Ba239C8a5A8A8D28CB00,
                        0xbC456dc7E6F882DBc7b11da1048eD253F5DB021D,
                        0x706E3AD3F2745722152acc71Da3C76330c2aa258,
                        0x290F8118AAf61e129646F03791227434DFe39669
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3Fuji))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0xFc7215C9498Fc12b22Bc0ed335871Db4315f03d3,
                        0xC42f40B7E22bcca66B3EE22F3ACb86d24C997CC2,
                        0xf5934275da36A067CE00b415F0b876fA403A7198,
                        0xCB19d2C32cB4340C67273A5a4f5dD02BCceBbF97
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x73b4C0C45bfB90FC44D9013FA213eF2C2d908D0A,
                        0x210a3f864812eAF7f89eE7337EAA1FeA1830C57e,
                        0x0DDD3C8dfA22d4B5e5Dc086f87d94e4180dAC38D,
                        0x1f59c8D4C97E172e42dc3cF62E75464b7e0205bf
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x3E937B4881CBd500d05EeDAB7BA203f2b7B3f74f,
                        0xA79570641bC9cbc6522aA80E2de03bF9F7fd123a,
                        0xC168dB86f93F97652462ded450B3Ad5eA9669df2,
                        0x796eF05488765B4DeAd23B3C7b9F295139049879
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x09C85Ef96e93f0ae892561052B48AE9DB29F2458,
                        0x07B2C0b69c70e89C94A20A555Ab376E5a6181eE6,
                        0xdfBa66e02c4915708e7Df3C26843D5A3492727d9,
                        0x9731B6e01222a0772926455e4aEBa3d1ef690F24
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x28A8E6e41F84e62284970E4bc0867cEe2AAd0DA4,
                        0x618922b15a1a92652818473741531eE255f68741,
                        0xBA932F4F400204c7a05bDF06c6fcA8c114e39d8c,
                        0x800408b3a399d50fAbB064CB04C205910194017C
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xD90db1ca5A6e9873BCD9B0279AE038272b656728,
                        0x3a7e85a86F952CB61485e2D20BDDb6e15204744f,
                        0xB66d28fd0FF446aB504dEF6C2BCd0ef5c0AADdD3,
                        0x5CC87B358742407E563A6cB665Ce28a6937eAe29
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xCcbBaf8D40a5C34bf1c836e8dD33c7B7646706C5,
                        0xE9C1731e1186362E2ba233BC16614b2a53ecb3F2,
                        0x118369DcFb3Dfaa36Ad424AF26247c2D91CA1262,
                        0x1447a3924BE947CE32b1d4045DAE8F99B894CC61
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WAVAX"))
            ) {
                return
                    Token(
                        0x407287b03D1167593AF113d32093942be13A535f,
                        0xC50E6F9E8e6CAd53c42ddCB7A42d616d7420fd3e,
                        0xaB73C7267347a8dc4d34f9969663E7a64B578C69,
                        0xE21840302317b265dB7E530667ACb31188655cA2
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3FantomTestnet))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0xc469ff24046779DE9B61Be7b5DF91dbFfdF1AE02,
                        0xfb08e04E9c7AfFE693290F739d11D5C3Dd2e19B5,
                        0x87d62612a58a806B926a0A1276DF5C9c6DbE8a5e,
                        0x78243313999d4582cfEE48bD5B4466efF6c90fE1
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x42Dc50EB0d35A62eac61f4E4Bc81875db9F9366e,
                        0x1A7e068f35B19Ff89B7d646D83Ae15C2Db1D93c5,
                        0x475e4C43caE948578685462F17FB7fedB85E3F79,
                        0x57066BC9569260e9dEC8d224BeB9A8a56209Ff64
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x06f0790c687A1bED6186ce3624EDD9806edf9F4E,
                        0xf1090cB4f56fDb659D24DDbC4972bE9D379A6E8c,
                        0x7e90CE7a0463cc5656c38B5a85C33dF4C8F2523C,
                        0x946765C86B534D8114475BFec8De8De481bA4d1F
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0xd0404A349A76CD2a4B7AB322B9a6C993dbC3A7E7,
                        0xd2ecf7aA363A9dE20088eF1a92D76D4147828B58,
                        0x7e72682d8c90A1eeE1403730f31DCf81551C5aFA,
                        0x68C3E2eb8F2550E13328B4a9cccac65Ba6C200Be
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x2aF63215417F90bd45608115452d86D0a1bEAE5E,
                        0xd29fF48d6Fc110fe227286D5A509a4CB6503732E,
                        0xfD7D3f98aF173B18e5A98fE3b1aE530edab1a988,
                        0x27dF3D6eF22A6aC1c8744Fd7A4516a4C8B22084f
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x1b901d3C9D4ce153326BEeC60e0D4A2e8a9e3cE3,
                        0x1364B761d75E348B861D7EFaEB64A5b3a37965ec,
                        0xCcE4E4c5327870EfD280645B5a24A50dC01125a4,
                        0x81Ed0a1D00841B68C6F3956E4E210EFaaeBEBAF1
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x2a6202B83Bd2562d7460F91E9298abC27a2F0a95,
                        0xeCbA9a45fDb849548F3e7a621fcBa4f11b3BBDcF,
                        0x460d55849094CDcc8c9582Cf4B58485C08405Ae7,
                        0xe90400D7D8acdCcC8c335883097A722AB653890D
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WFTM"))
            ) {
                return
                    Token(
                        0xF7475b635EbE06d9C5178CC40D50856Fa98C7332,
                        0x22FDD5F19C49fe954847A6424E4a24C2742fD9EF,
                        0x67196249e5fE6c2f532ff456E342Abf8eE19D4E3,
                        0x812388F32346e99078B987e84f60dA68348Ac665
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0xAC1a9503D1438B56BAa99939D44555FC2dC286Fc,
                        0x552f5C364090B954ADA025f0D7963D0a7A60d52b,
                        0x48Cf4cA307f321f0FC24bfAe3119f9abF6B32Ff5,
                        0xe4CFEa97831CB0d95CA22597e02dD793bB8f45ae
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0x484b87Aa284f51e71F15Eba1aEb06dFD202D5511,
                        0x6cC739A29b8Eb06981B8bbF22464E4F3f082bBA5,
                        0x5f933d8c8fbc9651f3E6bC0652d94fdd09EA139a,
                        0x5522dFE4b4056BA819D8e675e6999011A31BAf7a
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3HarmonyTestnet))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x302567472401C7c7B50ee7eb3418c375D8E3F728,
                        0xF5C62a60A2065D34b601CAfF8775F5A2857A9088,
                        0x88d8a116C758C782985DAD67798666e270F0F1a8,
                        0xDD81Dec96a2e4c5221fe11854a32F37C49C1a72A
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xBaaCc99123133851Ba2D6d34952aa08CBDf5A4E4,
                        0xd5Bc03707A290BAaB91FeFBAf397Fe90EE48Cc39,
                        0xE052c9c02cd4949832cAC20A91B8cf7C59cDd93b,
                        0x2DE29943BbFA3740C1C3C9532E61e3489b2f742A
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xFCadBDefd30E11258559Ba239C8a5A8A8D28CB00,
                        0xf58153a81DbC7118a8Ad128024996E68dcDEE8B2,
                        0x7C50b2Fb765D77547B7a9F44364308FeEE7526D6,
                        0x6bA6869B3B16a2478EAc78010e4c0DB534Fd79F2
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0xc1eB89DA925cc2Ae8B36818d26E12DDF8F8601b0,
                        0x9D6a5051882C1DFA7d26Cb862a13843c1fe0EF0A,
                        0x478FE510965e607C95EB52c91FB711c8006483B9,
                        0x4953fFBeD89EfE9DC6B4Fe51f74924D6A9b7Ce4e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6,
                        0x7916c8E4d5B3C998B7e8d94bEE3625D0996dA3CC,
                        0x348d1F7BC7FF6803AB96e51B846069Fc1F74F8E5,
                        0x87c271682553fBe445331C872D991c463091f625
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x2A9534682aF7e07bA9615e15dd9d88968173F6c3,
                        0xAe8c5CfF5D96c36372378A4eFEBcaE78e3552AD9,
                        0xd6D10CEfD2E8A94B5B4Bd3D7B3F2d1cE39c0508c,
                        0xAe2A7BCEF650E798c8911a375bDcec248acbeEC9
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x407287b03D1167593AF113d32093942be13A535f,
                        0xAf16e6F087bb99aEf830409228CCcf8B039C758D,
                        0xCd5327194e4e95C4AECf863904FA80a8522c7C97,
                        0x0F8801a7a8964EA79a504EBa454CbAfF793feED7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WONE"))
            ) {
                return
                    Token(
                        0x3e4b51076d7e9B844B92F8c6377087f9cf8C8696,
                        0xA6a1ec235B90e0b5567521F52e5418B9BA189334,
                        0xdBb47093f92090Ec0E1B3CDC48fAFB52Ea185403,
                        0xB344989ff1717549221AF8525110421e4955857b
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3OptimismKovan))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0xd6B095c27bDf158C462AaB8Cb947BdA9351C0e1d,
                        0x4cdb5D85687Fa162446c7Cf263f9be9614E6314B,
                        0xF7f1a6f7A614b12F2f3bcc8a2e0952B2c6bF283d,
                        0x4F02eD54a25CD9D5bc3432f4bD82f39655A9F4bD
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xFbBCcCCA95b5F676D8f044Ec75e7eA5899280efF,
                        0x70713F22F01f0053803F1520d526a2C7b26b318a,
                        0x2074341b6880f6B7FC4f3B2B3B15ef91712182E6,
                        0x36B43B427a618cb2Dda78bEc36B7ed7d0b193071
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x9cCc44Aa7C301b6655ec9891BdaD20fa6eb2b552,
                        0x0849Cd326DC590bF313a0b1E5a04790CBb4eE387,
                        0xE953b08a7908921e179187bAf7dFb4e36f9b40CA,
                        0x3cB29D1F440d7ffADACCd57762c1332CF7Db9e6c
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0xfF5b900f020d663719EEE1731C21778632e6C424,
                        0x2D89bE7Cfbe21ed728A5AeDdA03cACFCAf04aA08,
                        0x4c9D6192E7920b2C56400aBFa8909EC7A572a315,
                        0x5a9BaC403F9034852Ed18613Ecac81A1FaE2AdF3
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x46e213C62d4734C64986879af00eEc5128395776,
                        0xCb5Df0b49BCa05B2478a606074ec39e3fa181a6f,
                        0x52B61cD2CbC22A386a8F5d2Cec685e938A0379BB,
                        0x90De0e1eBDBfDb421F79D26EccE37cE1Aa84bbA6
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xeE6b5ad81c7d88a632b24Bcdac055D6f5F469495,
                        0x98A978662670A35cA2b4aD12319486a3F294a78b,
                        0x1b187f0e91934c94aFb324cD9cd03FBa0C7a8B71,
                        0x163F2F60F99090E1fF7d7eC768dA0BA77Dd50547
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xb532118d86765Eb544958e47df77bb8bDDe2F096,
                        0x5994ce8E7F595AFE3115D72854e0EAeCbD902ea7,
                        0xBe7c6a35A2932411A379081a745bcb99d83574EC,
                        0xb45966470789847E7bC73E2aEdFefff96c86F821
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSD"))
            ) {
                return
                    Token(
                        0x6883D765088f90bAE62048dE45f2202D72985B01,
                        0xE603E221fa3a858BdAE91FB51cE09BA6C53B19A5,
                        0xF864A79eE389859A33DA2CDec69fb1d723dB319B,
                        0xd3a31fD51e6F0Ca6b4a083e05893bfC6e294cb30
                    );
            } else revert("Token does not exist");
        } else revert("Market does not exist");
    }
}
