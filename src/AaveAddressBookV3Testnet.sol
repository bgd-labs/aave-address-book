// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV3Testnet {
    string public constant AaveV3Rinkeby = "AaveV3Rinkeby";
    string public constant AaveV3Mumbai = "AaveV3Mumbai";
    string public constant AaveV3Fuji = "AaveV3Fuji";
    string public constant AaveV3ArbitrumRinkeby = "AaveV3ArbitrumRinkeby";
    string public constant AaveV3FantomTestnet = "AaveV3FantomTestnet";
    string public constant AaveV3HarmonyTestnet = "AaveV3HarmonyTestnet";
    string public constant AaveV3OptimismKovan = "AaveV3OptimismKovan";

    struct Market {
        IPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        IPool POOL;
        IPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider POOL_DATA_PROVIDER;
        address POOL_ADMIN;
        address ACL_ADMIN;
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
                );
        } else if (
            keccak256(abi.encodePacked((market))) ==
            keccak256(abi.encodePacked((AaveV3ArbitrumRinkeby)))
        ) {
            return
                Market(
                    IPoolAddressesProvider(
                        0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c
                    ),
                    IPool(0x9C55a3C34de5fd46004Fa44a55490108f7cE388F),
                    IPoolConfigurator(
                        0xCf7e77c25e04d5F44AA20C505fbda04BFCF60c0b
                    ),
                    IAaveOracle(0x2560A04c24E8870bB12eE7A9E2DcC4186362F3A1),
                    IAaveProtocolDataProvider(
                        0x9bf4b639C27F7aaF2eE2c1917478fd48370CE390
                    ),
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
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
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254,
                    0x77c45699A715A64A7a7796d5CEe884cf617D5254
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
                        0x0000000000000000000000000000000000000000,
                        0x49866611AA7Dc30130Ac6A0DF29217D16FD87bc0,
                        0x0F48c09701B6D24d6D9571637758EE06eeCb9630
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x237f409fBD10E30e237d63d9050Ae302e339028E,
                        0x0000000000000000000000000000000000000001,
                        0xeC4752053c5A693eBE6A07deF330a9F97D07FBC3,
                        0x4e63D3ff7Bca937FAD4e1b0e9aF4f946f2AAaE64
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xb18d016cDD2d9439A19f15633005A6b2cd6Aa774,
                        0x0000000000000000000000000000000000000002,
                        0x50b283C17b0Fc2a36c550A57B1a133459F4391B3,
                        0xee3D33c0C779cAD53CAa496aa5a97D026D1218Ca
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x124F70a8a3246F177b0067F435f5691Ee4e467DD,
                        0x0000000000000000000000000000000000000003,
                        0xeC1d8303b8fa33afB59012Fc3b49458B57883326,
                        0x372C35caeED54907d694DF6229319779fbC79440
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0xd74047010D77c5901df5b0f9ca518aED56C85e8D,
                        0x0000000000000000000000000000000000000004,
                        0x608D11E704baFb68CfEB154bF7Fd641120e33aD4,
                        0x7666ca6911bEcBA7d38Fa2da8278b82297EC7e6F
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x326005cFdF58bfB38650396836BEBF815F5ab4dD,
                        0x0000000000000000000000000000000000000005,
                        0x377D3F732CBeB84D0EebF71e1a4e3546Da86C76d,
                        0xCC28d19D8e8A64D2Fc1709e8FE7b6139e25Fd524
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x100aB78E5A565a94f2a191714A7a1B727268eFFb,
                        0x0000000000000000000000000000000000000006,
                        0x3fc92c5f08c361EB21ef86a31d55df4b92ab7874,
                        0x951a8575A0b18A1180D5e8DD0e2e646E235b42bb
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0x7eEB186F13538e6795a0823e2D7283FEeD2738f5,
                        0x0000000000000000000000000000000000000007,
                        0xC6B64D19EeF69071F32b043F8e57e506A86B8612,
                        0xEa7619f4AE50C3a6ad07e8Bd029b937B8D57A2b8
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
                        0x0000000000000000000000000000000000000000,
                        0xDD4f3Ee61466C4158D394d57f3D4C397E91fBc51,
                        0x333C04243D048836d53b4ACB3c9aE64875699375
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xD9E7e5dd6e122dDE11244e14A60f38AbA93097f2,
                        0x0000000000000000000000000000000000000001,
                        0x3e1608F4Db4b37DDf86536ef441890fE3AA9F2Ea,
                        0x27908f7216Efe649706B68b6a443623D9aaF16D0
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x9aa7fEc87CA69695Dd1f879567CcF49F3ba417E2,
                        0x0000000000000000000000000000000000000002,
                        0xCdc2854e97798AfDC74BC420BD5060e022D14607,
                        0x01dBEdcb2437c79341cfeC4Cae765C53BE0E6EF7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x85E44420b6137bbc75a85CAB5c9A3371af976FdE,
                        0x0000000000000000000000000000000000000003,
                        0xde230bC95a03b695be69C44b9AA6C0e9dAc1B143,
                        0x5BcBF666e14eCFe6e21686601c5cA7c7fbe674Cf
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0xd575d4047f8c667E064a4ad433D04E25187F40BB,
                        0x0000000000000000000000000000000000000004,
                        0x685bF4eab23993E94b4CFb9383599c926B66cF57,
                        0xC9Ac53b6ae1C653A54ab0E9D44693E807429aF1F
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x21C561e551638401b937b03fE5a0a0652B99B7DD,
                        0x0000000000000000000000000000000000000005,
                        0x6Ca4abE253bd510fCA862b5aBc51211C1E1E8925,
                        0xc601b4d43aF91fE4EAe327a2d2B12f37a568E05B
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x0AB1917A0cf92cdcf7F7b637EaC3A46BBBE41409,
                        0x0000000000000000000000000000000000000006,
                        0x50434C5Da807189622Db5fff66379808c58574aD,
                        0x26Df87542C50326A5085764b1F650EF2514776B6
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WMATIC"))
            ) {
                return
                    Token(
                        0xb685400156cF3CBE8725958DeAA61436727A30c3,
                        0x0000000000000000000000000000000000000007,
                        0x89a6AE840b3F8f489418933A220315eeA36d11fF,
                        0xEC59F2FB4EF0C46278857Bf2eC5764485974D17B
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0x3e4b51076d7e9B844B92F8c6377087f9cf8C8696,
                        0x0000000000000000000000000000000000000008,
                        0x4e752fB98b0dCC90b6772f23C52aD33b795dc758,
                        0x4a6F74A19f05529aF7E7e9f00923FFB990aeBE7B
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0xdDc3C9B8614092e6188A86450c8D597509893E20,
                        0x0000000000000000000000000000000000000009,
                        0xb7EA2d40B845A1B49E59c9a5f8B6F67b3c48fA04,
                        0x169E542d769137E82E704477aDdfFe89e7FB9b90
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("GHST"))
            ) {
                return
                    Token(
                        0x8AaF462990dD5CC574c94C8266208996426A47e7,
                        0x000000000000000000000000000000000000000A,
                        0x128cB3720f5d220e1E35512917c3c7fFf064A858,
                        0x03d6be9Bc91956A0bc39f515CaA77C8C0f81c3fC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("BAL"))
            ) {
                return
                    Token(
                        0xE3981f4840843D67aF50026d34DA0f7e56A02D69,
                        0x000000000000000000000000000000000000000b,
                        0x6236bfBfB3b6CDBFC311399BE346d61Ab8ab1094,
                        0xf28E16644C6389b1B6cF03b3120726b1FfAeDC6E
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DPI"))
            ) {
                return
                    Token(
                        0x56e0507A53Ee252947a1E55D84Dc4032F914DD98,
                        0x000000000000000000000000000000000000000C,
                        0xf815E724973ff3f5Eedc243eAE1a34D1f2a45e0C,
                        0x2C64B0ef18bC0616291Dc636b1738DbC675C3f0d
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0x302567472401C7c7B50ee7eb3418c375D8E3F728,
                        0x000000000000000000000000000000000000000d,
                        0xf6AeDD279Aae7361e70030515f56c22A16d81433,
                        0xaB7cDf4C6053873650695352634987BbEe472c05
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("JEUR"))
            ) {
                return
                    Token(
                        0xBaaCc99123133851Ba2D6d34952aa08CBDf5A4E4,
                        0x000000000000000000000000000000000000000E,
                        0x04cdAA74B111b49EF4044455324C0dDb1C2aa783,
                        0xdAc793dc4A6850765F0f55224CC77425e67C2b6e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AGEUR"))
            ) {
                return
                    Token(
                        0xFCadBDefd30E11258559Ba239C8a5A8A8D28CB00,
                        0x000000000000000000000000000000000000000F,
                        0xbC456dc7E6F882DBc7b11da1048eD253F5DB021D,
                        0x706E3AD3F2745722152acc71Da3C76330c2aa258
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
                        0x0000000000000000000000000000000000000000,
                        0xC42f40B7E22bcca66B3EE22F3ACb86d24C997CC2,
                        0xf5934275da36A067CE00b415F0b876fA403A7198
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x73b4C0C45bfB90FC44D9013FA213eF2C2d908D0A,
                        0x0000000000000000000000000000000000000001,
                        0x210a3f864812eAF7f89eE7337EAA1FeA1830C57e,
                        0x0DDD3C8dfA22d4B5e5Dc086f87d94e4180dAC38D
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x3E937B4881CBd500d05EeDAB7BA203f2b7B3f74f,
                        0x0000000000000000000000000000000000000002,
                        0xA79570641bC9cbc6522aA80E2de03bF9F7fd123a,
                        0xC168dB86f93F97652462ded450B3Ad5eA9669df2
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x09C85Ef96e93f0ae892561052B48AE9DB29F2458,
                        0x0000000000000000000000000000000000000003,
                        0x07B2C0b69c70e89C94A20A555Ab376E5a6181eE6,
                        0xdfBa66e02c4915708e7Df3C26843D5A3492727d9
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x28A8E6e41F84e62284970E4bc0867cEe2AAd0DA4,
                        0x0000000000000000000000000000000000000004,
                        0x618922b15a1a92652818473741531eE255f68741,
                        0xBA932F4F400204c7a05bDF06c6fcA8c114e39d8c
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xD90db1ca5A6e9873BCD9B0279AE038272b656728,
                        0x0000000000000000000000000000000000000005,
                        0x3a7e85a86F952CB61485e2D20BDDb6e15204744f,
                        0xB66d28fd0FF446aB504dEF6C2BCd0ef5c0AADdD3
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xCcbBaf8D40a5C34bf1c836e8dD33c7B7646706C5,
                        0x0000000000000000000000000000000000000006,
                        0xE9C1731e1186362E2ba233BC16614b2a53ecb3F2,
                        0x118369DcFb3Dfaa36Ad424AF26247c2D91CA1262
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WAVAX"))
            ) {
                return
                    Token(
                        0x407287b03D1167593AF113d32093942be13A535f,
                        0x0000000000000000000000000000000000000007,
                        0xC50E6F9E8e6CAd53c42ddCB7A42d616d7420fd3e,
                        0xaB73C7267347a8dc4d34f9969663E7a64B578C69
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV3ArbitrumRinkeby))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x200c2386A02cbA50563b7b64615B43Ab1874a06e,
                        0x0000000000000000000000000000000000000000,
                        0x38c4f078813bcAc22b4c580A870F812377615D59,
                        0xa626040B7Ec7febdA5c4f470d88541Fcb9e465a9
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x403052a80d33A79Bef4645c0D8Ff00FA03f424c7,
                        0x0000000000000000000000000000000000000001,
                        0x9F3399055a08549F706353BbD0796cB682337529,
                        0x60399941B74464eCe33cb681d830fa4e7370D3dc
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x774382EF196781400a335AF0c4219eEd684ED713,
                        0x0000000000000000000000000000000000000002,
                        0x80a8F2FcC1fF2A658cd684b27227CB85eC0eebab,
                        0x057A698a4fD2C486dd269E285e1c4Cbfac2D0A4B
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x1F7dC0B961950c69584d0F9cE290A918124d32CD,
                        0x0000000000000000000000000000000000000003,
                        0x020Ccb5Fcbb05d7d4C6cF702c081d47EC357A68E,
                        0x314EED755BD345029Eb6A42F1648f889bD7179f0
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x5eb35Fe1f1074Ae8d6D23Bf771705846Cc812c09,
                        0x0000000000000000000000000000000000000004,
                        0xD7a3657B2B395a166cD068269B4a3f42Fd2ef5D8,
                        0x84B63b4607E47Ae1E17907200690feFBFfF804aD
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x7c53810c756C636cEF076c92D5D7C04555694E76,
                        0x0000000000000000000000000000000000000005,
                        0xf6dF93819BeBd3A73F4DF43327Ce0f95d148ED47,
                        0x29E13C2B7B35B4FFf8d3323bC73b5D462d0f22c8
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x31f909C64E93f764dc90d78DCBB38a6A6D1D48dE,
                        0x0000000000000000000000000000000000000006,
                        0xD5B608ec055675661c5425f0B92301F32A8f1aCA,
                        0x6895ACc82d5556e8289c65c1eA60D8E96D00a94B
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("EURS"))
            ) {
                return
                    Token(
                        0xaB874B1862938704Cf44Fb81E33c59B67c6BeC07,
                        0x0000000000000000000000000000000000000007,
                        0x81728cFD25eE94285322fE7fd2AC163ba24040b0,
                        0x831d5aE09d3CD39d1ac601bA1E73eA639b96B2f6
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
                        0x0000000000000000000000000000000000000000,
                        0xfb08e04E9c7AfFE693290F739d11D5C3Dd2e19B5,
                        0x87d62612a58a806B926a0A1276DF5C9c6DbE8a5e
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x42Dc50EB0d35A62eac61f4E4Bc81875db9F9366e,
                        0x0000000000000000000000000000000000000001,
                        0x1A7e068f35B19Ff89B7d646D83Ae15C2Db1D93c5,
                        0x475e4C43caE948578685462F17FB7fedB85E3F79
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x06f0790c687A1bED6186ce3624EDD9806edf9F4E,
                        0x0000000000000000000000000000000000000002,
                        0xf1090cB4f56fDb659D24DDbC4972bE9D379A6E8c,
                        0x7e90CE7a0463cc5656c38B5a85C33dF4C8F2523C
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0xd0404A349A76CD2a4B7AB322B9a6C993dbC3A7E7,
                        0x0000000000000000000000000000000000000003,
                        0xd2ecf7aA363A9dE20088eF1a92D76D4147828B58,
                        0x7e72682d8c90A1eeE1403730f31DCf81551C5aFA
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x2aF63215417F90bd45608115452d86D0a1bEAE5E,
                        0x0000000000000000000000000000000000000004,
                        0xd29fF48d6Fc110fe227286D5A509a4CB6503732E,
                        0xfD7D3f98aF173B18e5A98fE3b1aE530edab1a988
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x1b901d3C9D4ce153326BEeC60e0D4A2e8a9e3cE3,
                        0x0000000000000000000000000000000000000005,
                        0x1364B761d75E348B861D7EFaEB64A5b3a37965ec,
                        0xCcE4E4c5327870EfD280645B5a24A50dC01125a4
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x2a6202B83Bd2562d7460F91E9298abC27a2F0a95,
                        0x0000000000000000000000000000000000000006,
                        0xeCbA9a45fDb849548F3e7a621fcBa4f11b3BBDcF,
                        0x460d55849094CDcc8c9582Cf4B58485C08405Ae7
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WFTM"))
            ) {
                return
                    Token(
                        0xF7475b635EbE06d9C5178CC40D50856Fa98C7332,
                        0x0000000000000000000000000000000000000007,
                        0x22FDD5F19C49fe954847A6424E4a24C2742fD9EF,
                        0x67196249e5fE6c2f532ff456E342Abf8eE19D4E3
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0xAC1a9503D1438B56BAa99939D44555FC2dC286Fc,
                        0x0000000000000000000000000000000000000008,
                        0x552f5C364090B954ADA025f0D7963D0a7A60d52b,
                        0x48Cf4cA307f321f0FC24bfAe3119f9abF6B32Ff5
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0x484b87Aa284f51e71F15Eba1aEb06dFD202D5511,
                        0x0000000000000000000000000000000000000009,
                        0x6cC739A29b8Eb06981B8bbF22464E4F3f082bBA5,
                        0x5f933d8c8fbc9651f3E6bC0652d94fdd09EA139a
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
                        0x0000000000000000000000000000000000000000,
                        0xF5C62a60A2065D34b601CAfF8775F5A2857A9088,
                        0x88d8a116C758C782985DAD67798666e270F0F1a8
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xBaaCc99123133851Ba2D6d34952aa08CBDf5A4E4,
                        0x0000000000000000000000000000000000000001,
                        0xd5Bc03707A290BAaB91FeFBAf397Fe90EE48Cc39,
                        0xE052c9c02cd4949832cAC20A91B8cf7C59cDd93b
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xFCadBDefd30E11258559Ba239C8a5A8A8D28CB00,
                        0x0000000000000000000000000000000000000002,
                        0xf58153a81DbC7118a8Ad128024996E68dcDEE8B2,
                        0x7C50b2Fb765D77547B7a9F44364308FeEE7526D6
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0xc1eB89DA925cc2Ae8B36818d26E12DDF8F8601b0,
                        0x0000000000000000000000000000000000000003,
                        0x9D6a5051882C1DFA7d26Cb862a13843c1fe0EF0A,
                        0x478FE510965e607C95EB52c91FB711c8006483B9
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6,
                        0x0000000000000000000000000000000000000004,
                        0x7916c8E4d5B3C998B7e8d94bEE3625D0996dA3CC,
                        0x348d1F7BC7FF6803AB96e51B846069Fc1F74F8E5
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x2A9534682aF7e07bA9615e15dd9d88968173F6c3,
                        0x0000000000000000000000000000000000000005,
                        0xAe8c5CfF5D96c36372378A4eFEBcaE78e3552AD9,
                        0xd6D10CEfD2E8A94B5B4Bd3D7B3F2d1cE39c0508c
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x407287b03D1167593AF113d32093942be13A535f,
                        0x0000000000000000000000000000000000000006,
                        0xAf16e6F087bb99aEf830409228CCcf8B039C758D,
                        0xCd5327194e4e95C4AECf863904FA80a8522c7C97
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WONE"))
            ) {
                return
                    Token(
                        0x3e4b51076d7e9B844B92F8c6377087f9cf8C8696,
                        0x0000000000000000000000000000000000000007,
                        0xA6a1ec235B90e0b5567521F52e5418B9BA189334,
                        0xdBb47093f92090Ec0E1B3CDC48fAFB52Ea185403
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
                        0x0000000000000000000000000000000000000000,
                        0x4cdb5D85687Fa162446c7Cf263f9be9614E6314B,
                        0xF7f1a6f7A614b12F2f3bcc8a2e0952B2c6bF283d
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0xFbBCcCCA95b5F676D8f044Ec75e7eA5899280efF,
                        0x0000000000000000000000000000000000000001,
                        0x70713F22F01f0053803F1520d526a2C7b26b318a,
                        0x2074341b6880f6B7FC4f3B2B3B15ef91712182E6
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x9cCc44Aa7C301b6655ec9891BdaD20fa6eb2b552,
                        0x0000000000000000000000000000000000000002,
                        0x0849Cd326DC590bF313a0b1E5a04790CBb4eE387,
                        0xE953b08a7908921e179187bAf7dFb4e36f9b40CA
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0xfF5b900f020d663719EEE1731C21778632e6C424,
                        0x0000000000000000000000000000000000000003,
                        0x2D89bE7Cfbe21ed728A5AeDdA03cACFCAf04aA08,
                        0x4c9D6192E7920b2C56400aBFa8909EC7A572a315
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x46e213C62d4734C64986879af00eEc5128395776,
                        0x0000000000000000000000000000000000000004,
                        0xCb5Df0b49BCa05B2478a606074ec39e3fa181a6f,
                        0x52B61cD2CbC22A386a8F5d2Cec685e938A0379BB
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xeE6b5ad81c7d88a632b24Bcdac055D6f5F469495,
                        0x0000000000000000000000000000000000000005,
                        0x98A978662670A35cA2b4aD12319486a3F294a78b,
                        0x1b187f0e91934c94aFb324cD9cd03FBa0C7a8B71
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xb532118d86765Eb544958e47df77bb8bDDe2F096,
                        0x0000000000000000000000000000000000000006,
                        0x5994ce8E7F595AFE3115D72854e0EAeCbD902ea7,
                        0xBe7c6a35A2932411A379081a745bcb99d83574EC
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("SUSD"))
            ) {
                return
                    Token(
                        0x6883D765088f90bAE62048dE45f2202D72985B01,
                        0x0000000000000000000000000000000000000007,
                        0xE603E221fa3a858BdAE91FB51cE09BA6C53B19A5,
                        0xF864A79eE389859A33DA2CDec69fb1d723dB319B
                    );
            } else revert("Token does not exist");
        } else revert("Market does not exist");
    }
}
