// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Market, Token} from "./AaveV2.sol";

library AaveAddressBookV2 {
    string public constant AaveV2Eth = "AaveV2Eth";
    string public constant AaveV2EthAMM = "AaveV2EthAMM";
    string public constant AaveV2Polygon = "AaveV2Polygon";
    string public constant AaveV2Avalanche = "AaveV2Avalanche";

    function getMarket(string calldata market)
        public
        pure
        returns (Market memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Eth))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5
                    ),
                    ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9),
                    ILendingPoolConfigurator(
                        0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756
                    ),
                    IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9),
                    IAaveProtocolDataProvider(
                        0x057835Ad21a177dbdd3090bB1CAE03EaCF78Fc6d
                    ),
                    0xEE56e2B3D491590B5b31738cC34d5232F378a8D5,
                    0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2EthAMM))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5
                    ),
                    ILendingPool(0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB),
                    ILendingPoolConfigurator(
                        0x23A875eDe3F1030138701683e42E9b16A7F87768
                    ),
                    IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9),
                    IAaveProtocolDataProvider(
                        0x0000000000000000000000000000000000000000
                    ),
                    0xEE56e2B3D491590B5b31738cC34d5232F378a8D5,
                    0xB9062896ec3A615a4e4444DF183F0531a77218AE
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Polygon))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xd05e3E715d945B59290df0ae8eF85c1BdB684744
                    ),
                    ILendingPool(0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf),
                    ILendingPoolConfigurator(
                        0x26db2B833021583566323E3b8985999981b9F1F3
                    ),
                    IAaveOracle(0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d),
                    IAaveProtocolDataProvider(
                        0x7551b5D2763519d4e37e8B81929D336De671d46d
                    ),
                    0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772,
                    0x1450F2898D6bA2710C98BE9CAF3041330eD5ae58
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Avalanche))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
                    ),
                    ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C),
                    ILendingPoolConfigurator(
                        0x230B618aD4C475393A7239aE03630042281BD86e
                    ),
                    IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89),
                    IAaveProtocolDataProvider(
                        0x65285E9dfab318f57051ab2b139ccCf232945451
                    ),
                    0x01244E7842254e3FD229CD263472076B1439D1Cd,
                    0x01244E7842254e3FD229CD263472076B1439D1Cd
                );
        } else revert("Market does not exist");
    }

    function getToken(string calldata market, string calldata token)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Eth))
        ) {
            if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xdAC17F958D2ee523a2206206994597C13D831ec7,
                        0x3Ed3B47Dd13EC9a98b44e6204A523E766B225811,
                        0xe91D55AB2240594855aBd11b3faAE801Fd4c4687,
                        0x531842cEbbdD378f8ee36D171d6cC9C4fcf475Ec
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599,
                        0x9ff58f4fFB29fA2266Ab25e75e2A8b3503311656,
                        0x51B039b9AFE64B78758f8Ef091211b5387eA717c,
                        0x9c39809Dec7F95F5e0713634a4D0701329B3b4d2
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
                        0x030bA81f1c18d280636F32af80b9AAd02Cf0854e,
                        0x4e977830ba4bd783C0BB7F15d3e243f73FF57121,
                        0xF63B34710400CAd3e044cFfDcAb00a0f32E33eCf
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("YFI"))
            ) {
                return
                    Token(
                        0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e,
                        0x5165d24277cD063F5ac44Efd447B27025e888f37,
                        0xca823F78C2Dd38993284bb42Ba9b14152082F7BD,
                        0x7EbD09022Be45AD993BAA1CEc61166Fcc8644d97
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("ZRX"))
            ) {
                return
                    Token(
                        0xE41d2489571d322189246DaFA5ebDe1F4699F498,
                        0xDf7FF54aAcAcbFf42dfe29DD6144A69b629f8C9e,
                        0x071B4323a24E73A5afeEbe34118Cd21B8FAAF7C3,
                        0x85791D117A392097590bDeD3bD5abB8d5A20491A
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI"))
            ) {
                return
                    Token(
                        0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984,
                        0xB9D7CB55f463405CDfBe4E90a6D2Df01C2B92BF1,
                        0xD939F7430dC8D5a427f156dE1012A56C18AcB6Aa,
                        0x5BdB050A92CADcCfCDcCCBFC17204a1C9cC0Ab73
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9,
                        0xFFC97d72E13E01096502Cb8Eb52dEe56f74DAD7B,
                        0x079D6a3E844BcECf5720478A718Edb6575362C5f,
                        0xF7DBA49d571745D9d7fcb56225B05BEA803EBf3C
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("BAT"))
            ) {
                return
                    Token(
                        0x0D8775F648430679A709E98d2b0Cb6250d2887EF,
                        0x05Ec93c0365baAeAbF7AefFb0972ea7ECdD39CF1,
                        0x277f8676FAcf4dAA5a6EA38ba511B7F65AA02f9F,
                        0xfc218A6Dfe6901CB34B1a5281FC6f1b8e7E56877
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("BUSD"))
            ) {
                return
                    Token(
                        0x4Fabb145d64652a948d72533023f6E7A623C7C53,
                        0xA361718326c15715591c299427c62086F69923D9,
                        0x4A7A63909A72D268b1D8a93a9395d098688e0e5C,
                        0xbA429f7011c9fa04cDd46a2Da24dc0FF0aC6099c
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x6B175474E89094C44Da98b954EedeAC495271d0F,
                        0x028171bCA77440897B824Ca71D1c56caC55b68A3,
                        0x778A13D3eeb110A4f7bb6529F99c000119a08E92,
                        0x6C3c78838c761c6Ac7bE9F59fe808ea2A6E4379d
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("ENJ"))
            ) {
                return
                    Token(
                        0xF629cBd94d3791C9250152BD8dfBDF380E2a3B9c,
                        0xaC6Df26a590F08dcC95D5a4705ae8abbc88509Ef,
                        0x943DcCA156b5312Aa24c1a08769D67FEce4ac14C,
                        0x38995F292a6E31b78203254fE1cdd5Ca1010A446
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("KNC"))
            ) {
                return
                    Token(
                        0xdd974D5C2e2928deA5F71b9825b8b646686BD200,
                        0x39C6b3e42d6A679d7D776778Fe880BC9487C2EDA,
                        0x9915dfb872778B2890a117DA1F35F335eb06B54f,
                        0x6B05D1c608015Ccb8e205A690cB86773A96F39f1
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x514910771AF9Ca656af840dff83E8264EcF986CA,
                        0xa06bC25B5805d5F8d82847D191Cb4Af5A3e873E0,
                        0xFB4AEc4Cc858F2539EBd3D37f2a43eAe5b15b98a,
                        0x0b8f12b1788BFdE65Aa1ca52E3e9F3Ba401be16D
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("MANA"))
            ) {
                return
                    Token(
                        0x0F5D2fB29fb7d3CFeE444a200298f468908cC942,
                        0xa685a61171bb30d4072B338c80Cb7b2c865c873E,
                        0xD86C74eA2224f4B8591560652b50035E4e5c0a3b,
                        0x0A68976301e46Ca6Ce7410DB28883E309EA0D352
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("MKR"))
            ) {
                return
                    Token(
                        0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2,
                        0xc713e5E149D5D0715DcD1c156a020976e7E56B88,
                        0xC01C8E4b12a89456a9fD4e4e75B72546Bf53f0B5,
                        0xba728eAd5e496BE00DCF66F650b6d7758eCB50f8
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("REN"))
            ) {
                return
                    Token(
                        0x408e41876cCCDC0F92210600ef50372656052a38,
                        0xCC12AbE4ff81c9378D670De1b57F8e0Dd228D77a,
                        0x3356Ec1eFA75d9D150Da1EC7d944D9EDf73703B7,
                        0xcd9D82d33bd737De215cDac57FE2F7f04DF77FE0
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("SNX"))
            ) {
                return
                    Token(
                        0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F,
                        0x35f6B052C598d933D69A4EEC4D04c73A191fE6c2,
                        0x8575c8ae70bDB71606A53AeA1c6789cB0fBF3166,
                        0x267EB8Cf715455517F9BD5834AeAE3CeA1EBdbD8
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("sUSD"))
            ) {
                return
                    Token(
                        0x57Ab1ec28D129707052df4dF418D58a2D46d5f51,
                        0x6C5024Cd4F8A59110119C56f8933403A539555EB,
                        0x30B0f7324feDF89d8eff397275F8983397eFe4af,
                        0xdC6a3Ab17299D9C2A412B0e0a4C1f55446AE0817
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("TUSD"))
            ) {
                return
                    Token(
                        0x0000000000085d4780B73119b644AE5ecd22b376,
                        0x101cc05f4A51C0319f570d5E146a8C625198e636,
                        0x7f38d60D94652072b2C44a18c0e14A481EC3C0dd,
                        0x01C0eb1f8c6F1C1bF74ae028697ce7AA2a8b0E92
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
                        0xBcca60bB61934080951369a648Fb03DF4F96263C,
                        0xE4922afAB0BbaDd8ab2a88E0C79d884Ad337fcA6,
                        0x619beb58998eD2278e08620f97007e1116D5D25b
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0xD533a949740bb3306d119CC777fa900bA034cd52,
                        0x8dAE6Cb04688C62d939ed9B68d32Bc62e49970b1,
                        0x9288059a74f589C919c7Cf1Db433251CdFEB874B,
                        0x00ad8eBF64F141f1C81e9f8f792d3d1631c6c684
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("GUSD"))
            ) {
                return
                    Token(
                        0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd,
                        0xD37EE7e4f452C6638c96536e68090De8cBcdb583,
                        0xf8aC64ec6Ff8E0028b37EB89772d21865321bCe0,
                        0x279AF5b99540c1A3A7E3CDd326e19659401eF99e
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("BAL"))
            ) {
                return
                    Token(
                        0xba100000625a3754423978a60c9317c58a424e3D,
                        0x272F97b7a56a387aE942350bBC7Df5700f8a4576,
                        0xe569d31590307d05DA3812964F1eDd551D665a0b,
                        0x13210D4Fe0d5402bd7Ecbc4B5bC5cFcA3b71adB0
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("xSUSHI"))
            ) {
                return
                    Token(
                        0x8798249c2E607446EfB7Ad49eC89dD1865Ff4272,
                        0xF256CC7847E919FAc9B808cC216cAc87CCF2f47a,
                        0x73Bfb81D7dbA75C904f430eA8BAe82DB0D41187B,
                        0xfAFEDF95E21184E3d880bd56D4806c4b8d31c69A
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("renFIL"))
            ) {
                return
                    Token(
                        0xD5147bc8e386d91Cc5DBE72099DAC6C9b99276F5,
                        0x514cd6756CCBe28772d4Cb81bC3156BA9d1744aa,
                        0xcAad05C49E14075077915cB5C820EB3245aFb950,
                        0x348e2eBD5E962854871874E444F4122399c02755
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("RAI"))
            ) {
                return
                    Token(
                        0x03ab458634910AaD20eF5f1C8ee96F1D6ac54919,
                        0xc9BC48c72154ef3e5425641a3c747242112a46AF,
                        0x9C72B8476C33AE214ee3e8C20F0bc28496a62032,
                        0xB5385132EE8321977FfF44b60cDE9fE9AB0B4e6b
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("AMPL"))
            ) {
                return
                    Token(
                        0xD46bA6D942050d489DBd938a2C909A5d5039A161,
                        0x1E6bb68Acec8fefBD87D192bE09bb274170a0548,
                        0x18152C9f77DAdc737006e9430dB913159645fa87,
                        0xf013D90E4e4E3Baf420dFea60735e75dbd42f1e1
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDP"))
            ) {
                return
                    Token(
                        0x8E870D67F660D95d5be530380D0eC0bd388289E1,
                        0x2e8F4bdbE3d47d7d7DE490437AeA9915D930F1A3,
                        0x2387119bc85A74e0BBcbe190d80676CB16F10D4F,
                        0xFDb93B3b10936cf81FA59A02A7523B6e2149b2B7
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("DPI"))
            ) {
                return
                    Token(
                        0x1494CA1F11D487c2bBe4543E90080AeBa4BA3C2b,
                        0x6F634c6135D2EBD550000ac92F494F9CB8183dAe,
                        0xa3953F07f389d719F99FC378ebDb9276177d8A6e,
                        0x4dDff5885a67E4EffeC55875a3977D7E60F82ae0
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("FRAX"))
            ) {
                return
                    Token(
                        0x853d955aCEf822Db058eb8505911ED77F175b99e,
                        0xd4937682df3C8aEF4FE912A96A74121C0829E664,
                        0x3916e3B6c84b161df1b2733dFfc9569a1dA710c2,
                        0xfE8F19B17fFeF0fDbfe2671F248903055AFAA8Ca
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("FEI"))
            ) {
                return
                    Token(
                        0x956F47F50A910163D8BF957Cf5846D573E7f87CA,
                        0x683923dB55Fead99A79Fa01A27EeC3cB19679cC3,
                        0xd89cF9E8A858F8B4b31Faf793505e112d6c17449,
                        0xC2e10006AccAb7B45D9184FcF5b7EC7763f5BaAe
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("stETH"))
            ) {
                return
                    Token(
                        0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84,
                        0x1982b2F5814301d4e9a8b0201555376e62F82428,
                        0x66457616Dd8489dF5D0AFD8678F4A260088aAF55,
                        0xA9DEAc9f00Dc4310c35603FCD9D34d1A750f81Db
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("ENS"))
            ) {
                return
                    Token(
                        0xC18360217D8F7Ab5e7c516566761Ea12Ce7F9D72,
                        0x9a14e23A58edf4EFDcB360f68cd1b95ce2081a2F,
                        0x34441FFD1948E49dC7a607882D0c38Efd0083815,
                        0x176808047cc9b7A2C9AE202c593ED42dDD7C0D13
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UST"))
            ) {
                return
                    Token(
                        0xa693B19d2931d498c5B318dF961919BB4aee87a5,
                        0xc2e2152647F4C26028482Efaf64b2Aa28779EFC4,
                        0x7FDbfB0412700D94403c42cA3CAEeeA183F07B26,
                        0xaf32001cf2E66C4C3af4205F6EA77112AA4160FE
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2EthAMM))
        ) {
            if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
                        0xf9Fb4AD91812b704Ba883B11d2B576E890a6730A,
                        0x118Ee405c6be8f9BA7cC7a98064EB5DA462235CF,
                        0xA4C273d9A0C1fe2674F0E845160d6232768a3064
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x6B175474E89094C44Da98b954EedeAC495271d0F,
                        0x79bE75FFC64DD58e66787E4Eae470c8a1FD08ba4,
                        0x8da51a5a3129343468a63A96ccae1ff1352a3dfE,
                        0x3F4fA4937E72991367DC32687BC3278f095E7EAa
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
                        0xd24946147829DEaA935bE2aD85A3291dbf109c80,
                        0xE5971a8a741892F3b3ac3E9c94d02588190cE220,
                        0xCFDC74b97b69319683fec2A4Ef95c4Ab739F1B12
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xdAC17F958D2ee523a2206206994597C13D831ec7,
                        0x17a79792Fe6fE5C95dFE95Fe3fCEE3CAf4fE4Cb7,
                        0x04A0577a89E1b9E8f6c87ee26cCe6a168fFfC5b5,
                        0xDcFE9BfC246b02Da384de757464a35eFCa402797
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599,
                        0x13B2f6928D7204328b0E8E4BCd0379aA06EA21FA,
                        0x55E575d092c934503D7635A837584E2900e01d2b,
                        0x3b99fdaFdfE70d65101a4ba8cDC35dAFbD26375f
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11,
                        0x9303EabC860a743aABcc3A1629014CaBcc3F8D36,
                        0xE9562bf0A11315A1e39f9182F446eA58002f010E,
                        0x23bcc861b989762275165d08B127911F09c71628
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xBb2b8038a1640196FbE3e38816F3e67Cba72D940,
                        0xc58F53A8adff2fB4eb16ED56635772075E2EE123,
                        0xeef7d082D9bE2F5eC73C072228706286dea1f492,
                        0x02aAeB4C7736177242Ee0f71f6f6A0F057Aba87d
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xDFC14d2Af169B0D36C4EFF567Ada9b2E0CAE044f,
                        0xe59d2FF6995a926A574390824a657eEd36801E55,
                        0x997b26eFf106f138e71160022CaAb0AFC5814643,
                        0x859ED7D9E92d1fe42fF95C3BC3a62F7cB59C373E
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xB6909B960DbbE7392D405429eB2b3649752b4838,
                        0xA1B0edF4460CC4d8bFAA18Ed871bFF15E5b57Eb4,
                        0x27c67541a4ea26a436e311b2E6fFeC82083a6983,
                        0x3Fbef89A21Dc836275bC912849627b33c61b09b4
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xAE461cA67B15dc8dc81CE7615e0320dA1A9aB8D5,
                        0xE340B25fE32B1011616bb8EC495A4d503e322177,
                        0x6Bb2BdD21920FcB2Ad855AB5d523222F31709d1f,
                        0x925E3FDd927E20e33C3177C4ff6fb72aD1133C87
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0x3dA1313aE46132A397D90d95B1424A9A7e3e0fCE,
                        0x0ea20e7fFB006d4Cfe84df2F72d8c7bD89247DB0,
                        0xd6035f8803eE9f173b1D3EBc3BDE0Ea6B5165636,
                        0xF3f1a76cA6356a908CdCdE6b2AC2eaace3739Cd0
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xa2107FA5B38d9bbd2C461D6EDf11B11A50F6b974,
                        0xb8db81B84d30E2387de0FF330420A4AAA6688134,
                        0xeb32b3A1De9a1915D2b452B673C53883b9Fa6a97,
                        0xeDe4052ed8e1F422F4E5062c679f6B18693fEcdc
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xC2aDdA861F89bBB333c90c492cB837741916A225,
                        0x370adc71f67f581158Dc56f539dF5F399128Ddf9,
                        0x6E7E38bB73E19b62AB5567940Caaa514e9d85982,
                        0xf36C394775285F89bBBDF09533421E3e81e8447c
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0x8Bd1661Da98EBDd3BD080F0bE4e6d9bE8cE9858c,
                        0xA9e201A4e269d6cd5E9F0FcbcB78520cf815878B,
                        0x312edeADf68E69A0f53518bF27EAcD1AbcC2897e,
                        0x2A8d5B1c1de15bfcd5EC41368C0295c60D8Da83c
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0x43AE24960e5534731Fc831386c07755A2dc33D47,
                        0x38E491A71291CD43E8DE63b7253E482622184894,
                        0xef62A0C391D89381ddf8A8C90Ba772081107D287,
                        0xfd15008efA339A2390B48d2E0Ca8Abd523b406d3
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xd3d2E2692501A5c9Ca623199D38826e513033a17,
                        0x3D26dcd840fCC8e4B2193AcE8A092e4a65832F9f,
                        0x6febCE732191Dc915D6fB7Dc5FE3AEFDDb85Bd1B,
                        0x0D878FbB01fbEEa7ddEFb896d56f1D3167af919F
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc,
                        0x391E86e2C002C70dEe155eAceB88F7A3c38f5976,
                        0xfAB4C9775A4316Ec67a8223ecD0F70F87fF532Fc,
                        0x26625d1dDf520fC8D975cc68eC6E0391D9d3Df61
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0x004375Dff511095CC5A197A54140a24eFEF3A416,
                        0x2365a4890eD8965E564B7E2D27C38Ba67Fec4C6F,
                        0xc66bfA05cCe646f05F71DeE333e3229cE24Bbb7e,
                        0x36dA0C5dC23397CBf9D13BbD74E93C04f99633Af
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("UNI-V2"))
            ) {
                return
                    Token(
                        0x2fDbAdf3C4D5A8666Bc06645B8358ab803996E28,
                        0x5394794Be8b6eD5572FCd6b27103F46b5F390E8f,
                        0x9B054B76d6DE1c4892ba025456A9c4F9be5B1766,
                        0xDf70Bdf01a3eBcd0D918FF97390852A914a92Df7
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("BPT"))
            ) {
                return
                    Token(
                        0x1efF8aF5D577060BA4ac8A29A13525bb0Ee2A3D5,
                        0x358bD0d980E031E23ebA9AA793926857703783BD,
                        0x46406eCd20FDE1DF4d80F15F07c434fa95CB6b33,
                        0xF655DF3832859cfB0AcfD88eDff3452b9Aa6Db24
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("BPT"))
            ) {
                return
                    Token(
                        0x59A19D8c652FA0284f44113D0ff9aBa70bd46fB4,
                        0xd109b2A304587569c84308c55465cd9fF0317bFB,
                        0x6474d116476b8eDa1B21472a599Ff76A829AbCbb,
                        0xF41A5Cc7a61519B08056176d7B4b87AB34dF55AD
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("G-UNI"))
            ) {
                return
                    Token(
                        0x50379f632ca68D36E50cfBC8F78fe16bd1499d1e,
                        0xd145c6ae8931ed5Bca9b5f5B7dA5991F5aB63B5c,
                        0x460Fd61bBDe7235C3F345901ad677854c9330c86,
                        0x40533CC601Ec5b79B00D76348ADc0c81d93d926D
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("G-UNI"))
            ) {
                return
                    Token(
                        0xD2eeC91055F07fE24C9cCB25828ecfEFd4be0c41,
                        0xCa5DFDABBfFD58cfD49A9f78Ca52eC8e0591a3C5,
                        0xFEaeCde9Eb0cd43FDE13427C6C7ef406780a8136,
                        0x0B7c7d9c5548A23D0455d1edeC541cc2AD955a9d
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Polygon))
        ) {
            if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063,
                        0x27F8D03b3a2196956ED754baDc28D73be8830A6e,
                        0x2238101B7014C279aaF6b408A284E49cDBd5DB55,
                        0x75c4d1Fb84429023170086f06E682DcbBF537b7d
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174,
                        0x1a13F4Ca1d028320A707D99520AbFefca3998b7F,
                        0xdeb05676dB0DB85cecafE8933c903466Bf20C572,
                        0x248960A9d75EdFa3de94F7193eae3161Eb349a12
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xc2132D05D31c914a87C6611C10748AEb04B58e8F,
                        0x60D55F02A771d515e077c9C2403a1ef324885CeC,
                        0xe590cfca10e81FeD9B0e4496381f02256f5d2f61,
                        0x8038857FD47108A07d1f6Bf652ef1cBeC279A2f3
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6,
                        0x5c2ed810328349100A66B82b78a1791B101C9D61,
                        0x2551B15dB740dB8348bFaDFe06830210eC2c2F13,
                        0xF664F50631A6f0D72ecdaa0e49b0c019Fa72a8dC
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619,
                        0x28424507fefb6f7f8E9D3860F56504E4e5f5f390,
                        0xc478cBbeB590C76b01ce658f8C4dda04f30e2C6f,
                        0xeDe17e9d79fc6f9fF9250D9EEfbdB88Cc18038b5
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WMATIC"))
            ) {
                return
                    Token(
                        0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270,
                        0x8dF3aad3a84da6b69A4DA8aeC3eA40d9091B2Ac4,
                        0xb9A6E29fB540C5F1243ef643EB39b0AcbC2e68E3,
                        0x59e8E9100cbfCBCBAdf86b9279fa61526bBB8765
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0xD6DF932A45C0f255f85145f286eA0b292B21C90B,
                        0x1d2a0E5EC8E5bBDCA5CB219e649B565d8e5c3360,
                        0x17912140e780B29Ba01381F088f21E8d75F954F9,
                        0x1c313e9d0d826662F5CE692134D938656F681350
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("GHST"))
            ) {
                return
                    Token(
                        0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7,
                        0x080b5BF8f360F624628E0fb961F4e67c9e3c7CF1,
                        0x6A01Db46Ae51B19A6B85be38f1AA102d8735d05b,
                        0x36e988a38542C3482013Bb54ee46aC1fb1efedcd
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("BAL"))
            ) {
                return
                    Token(
                        0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3,
                        0xc4195D4060DaEac44058Ed668AA5EfEc50D77ff6,
                        0xbC30bbe0472E0E86b6f395f9876B950A13B23923,
                        0x773E0e32e7b6a00b7cA9daa85dfba9D61B7f2574
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("DPI"))
            ) {
                return
                    Token(
                        0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369,
                        0x81fB82aAcB4aBE262fc57F06fD4c1d2De347D7B1,
                        0xA742710c0244a8Ebcf533368e3f0B956B6E53F7B,
                        0x43150AA0B7e19293D935A412C8607f9172d3d3f3
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("CRV"))
            ) {
                return
                    Token(
                        0x172370d5Cd63279eFa6d502DAB29171933a610AF,
                        0x3Df8f92b7E798820ddcCA2EBEA7BAbda2c90c4aD,
                        0x807c97744e6C9452e7C2914d78f49d171a9974a0,
                        0x780BbcBCda2cdb0d2c61fd9BC68c9046B18f3229
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("SUSHI"))
            ) {
                return
                    Token(
                        0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a,
                        0x21eC9431B5B55c5339Eb1AE7582763087F98FAc2,
                        0x7Ed588DCb30Ea11A54D8a5E9645960262A97cd54,
                        0x9CB9fEaFA73bF392C905eEbf5669ad3d073c3DFC
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("LINK"))
            ) {
                return
                    Token(
                        0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39,
                        0x0Ca2e42e8c21954af73Bc9af1213E4e81D6a669A,
                        0x9fb7F546E60DDFaA242CAeF146FA2f4172088117,
                        0xCC71e4A38c974e19bdBC6C0C19b63b8520b1Bb09
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Avalanche))
        ) {
            if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WETH.e"))
            ) {
                return
                    Token(
                        0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB,
                        0x53f7c5869a859F0AeC3D334ee8B4Cf01E3492f21,
                        0x60F6A45006323B97d97cB0a42ac39e2b757ADA63,
                        0x4e575CacB37bc1b5afEc68a0462c4165A5268983
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("DAI.e"))
            ) {
                return
                    Token(
                        0xd586E7F844cEa2F87f50152665BCbc2C279D8d70,
                        0x47AFa96Cdc9fAb46904A55a6ad4bf6660B53c38a,
                        0x3676E4EE689D527dDb89812B63fAD0B7501772B3,
                        0x1852DC24d1a8956a0B356AA18eDe954c7a0Ca5ae
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDT.e"))
            ) {
                return
                    Token(
                        0xc7198437980c041c805A1EDcbA50c1Ce5db95118,
                        0x532E6537FEA298397212F09A61e03311686f548e,
                        0x9c7B81A867499B7387ed05017a13d4172a0c17bF,
                        0xfc1AdA7A288d6fCe0d29CcfAAa57Bc9114bb2DbE
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("USDC.e"))
            ) {
                return
                    Token(
                        0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664,
                        0x46A51127C3ce23fb7AB1DE06226147F446e4a857,
                        0x5B14679135dbE8B02015ec3Ca4924a12E4C6C85a,
                        0x848c080d2700CBE1B894a3374AD5E887E5cCb89c
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("AAVE.e"))
            ) {
                return
                    Token(
                        0x63a72806098Bd3D9520cC43356dD78afe5D386D9,
                        0xD45B7c061016102f9FA220502908f2c0f1add1D7,
                        0x66904E4F3f44e3925D22ceca401b6F2DA085c98f,
                        0x8352E3fd18B8d84D3c8a1b538d788899073c7A8E
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WBTC.e"))
            ) {
                return
                    Token(
                        0x50b7545627a5162F82A992c33b87aDc75187B218,
                        0x686bEF2417b6Dc32C50a3cBfbCC3bb60E1e9a15D,
                        0x3484408989985d68C9700dc1CFDFeAe6d2f658CF,
                        0x2dc0E35eC3Ab070B8a175C829e23650Ee604a9eB
                    );
            } else if (
                keccak256(abi.encodePacked(token)) ==
                keccak256(abi.encodePacked("WAVAX"))
            ) {
                return
                    Token(
                        0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7,
                        0xDFE521292EcE2A4f44242efBcD66Bc594CA9714B,
                        0x2920CD5b8A160b2Addb00Ec5d5f4112255d4ae75,
                        0x66A0FE52Fb629a6cB4D10B8580AFDffE888F5Fd4
                    );
            } else revert("Token does not exist");
        } else revert("Market does not exist");
    }
}
