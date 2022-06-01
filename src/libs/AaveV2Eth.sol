// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, Token} from "./AaveV2.sol";

library AaveV2Eth {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9);

    address internal constant POOL_ADMIN =
        0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

    address internal constant EMERGENCY_ADMIN =
        0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633;

    function getToken(string calldata token)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDT")))
        ) {
            return
                Token(
                    0xdAC17F958D2ee523a2206206994597C13D831ec7,
                    0x3Ed3B47Dd13EC9a98b44e6204A523E766B225811,
                    0xe91D55AB2240594855aBd11b3faAE801Fd4c4687,
                    0x531842cEbbdD378f8ee36D171d6cC9C4fcf475Ec
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599,
                    0x9ff58f4fFB29fA2266Ab25e75e2A8b3503311656,
                    0x51B039b9AFE64B78758f8Ef091211b5387eA717c,
                    0x9c39809Dec7F95F5e0713634a4D0701329B3b4d2
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WETH")))
        ) {
            return
                Token(
                    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
                    0x030bA81f1c18d280636F32af80b9AAd02Cf0854e,
                    0x4e977830ba4bd783C0BB7F15d3e243f73FF57121,
                    0xF63B34710400CAd3e044cFfDcAb00a0f32E33eCf
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("YFI")))
        ) {
            return
                Token(
                    0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e,
                    0x5165d24277cD063F5ac44Efd447B27025e888f37,
                    0xca823F78C2Dd38993284bb42Ba9b14152082F7BD,
                    0x7EbD09022Be45AD993BAA1CEc61166Fcc8644d97
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("ZRX")))
        ) {
            return
                Token(
                    0xE41d2489571d322189246DaFA5ebDe1F4699F498,
                    0xDf7FF54aAcAcbFf42dfe29DD6144A69b629f8C9e,
                    0x071B4323a24E73A5afeEbe34118Cd21B8FAAF7C3,
                    0x85791D117A392097590bDeD3bD5abB8d5A20491A
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNI")))
        ) {
            return
                Token(
                    0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984,
                    0xB9D7CB55f463405CDfBe4E90a6D2Df01C2B92BF1,
                    0xD939F7430dC8D5a427f156dE1012A56C18AcB6Aa,
                    0x5BdB050A92CADcCfCDcCCBFC17204a1C9cC0Ab73
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("AAVE")))
        ) {
            return
                Token(
                    0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9,
                    0xFFC97d72E13E01096502Cb8Eb52dEe56f74DAD7B,
                    0x079D6a3E844BcECf5720478A718Edb6575362C5f,
                    0xF7DBA49d571745D9d7fcb56225B05BEA803EBf3C
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("BAT")))
        ) {
            return
                Token(
                    0x0D8775F648430679A709E98d2b0Cb6250d2887EF,
                    0x05Ec93c0365baAeAbF7AefFb0972ea7ECdD39CF1,
                    0x277f8676FAcf4dAA5a6EA38ba511B7F65AA02f9F,
                    0xfc218A6Dfe6901CB34B1a5281FC6f1b8e7E56877
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("BUSD")))
        ) {
            return
                Token(
                    0x4Fabb145d64652a948d72533023f6E7A623C7C53,
                    0xA361718326c15715591c299427c62086F69923D9,
                    0x4A7A63909A72D268b1D8a93a9395d098688e0e5C,
                    0xbA429f7011c9fa04cDd46a2Da24dc0FF0aC6099c
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("DAI")))
        ) {
            return
                Token(
                    0x6B175474E89094C44Da98b954EedeAC495271d0F,
                    0x028171bCA77440897B824Ca71D1c56caC55b68A3,
                    0x778A13D3eeb110A4f7bb6529F99c000119a08E92,
                    0x6C3c78838c761c6Ac7bE9F59fe808ea2A6E4379d
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("ENJ")))
        ) {
            return
                Token(
                    0xF629cBd94d3791C9250152BD8dfBDF380E2a3B9c,
                    0xaC6Df26a590F08dcC95D5a4705ae8abbc88509Ef,
                    0x943DcCA156b5312Aa24c1a08769D67FEce4ac14C,
                    0x38995F292a6E31b78203254fE1cdd5Ca1010A446
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("KNC")))
        ) {
            return
                Token(
                    0xdd974D5C2e2928deA5F71b9825b8b646686BD200,
                    0x39C6b3e42d6A679d7D776778Fe880BC9487C2EDA,
                    0x9915dfb872778B2890a117DA1F35F335eb06B54f,
                    0x6B05D1c608015Ccb8e205A690cB86773A96F39f1
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("LINK")))
        ) {
            return
                Token(
                    0x514910771AF9Ca656af840dff83E8264EcF986CA,
                    0xa06bC25B5805d5F8d82847D191Cb4Af5A3e873E0,
                    0xFB4AEc4Cc858F2539EBd3D37f2a43eAe5b15b98a,
                    0x0b8f12b1788BFdE65Aa1ca52E3e9F3Ba401be16D
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("MANA")))
        ) {
            return
                Token(
                    0x0F5D2fB29fb7d3CFeE444a200298f468908cC942,
                    0xa685a61171bb30d4072B338c80Cb7b2c865c873E,
                    0xD86C74eA2224f4B8591560652b50035E4e5c0a3b,
                    0x0A68976301e46Ca6Ce7410DB28883E309EA0D352
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("MKR")))
        ) {
            return
                Token(
                    0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2,
                    0xc713e5E149D5D0715DcD1c156a020976e7E56B88,
                    0xC01C8E4b12a89456a9fD4e4e75B72546Bf53f0B5,
                    0xba728eAd5e496BE00DCF66F650b6d7758eCB50f8
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("REN")))
        ) {
            return
                Token(
                    0x408e41876cCCDC0F92210600ef50372656052a38,
                    0xCC12AbE4ff81c9378D670De1b57F8e0Dd228D77a,
                    0x3356Ec1eFA75d9D150Da1EC7d944D9EDf73703B7,
                    0xcd9D82d33bd737De215cDac57FE2F7f04DF77FE0
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("SNX")))
        ) {
            return
                Token(
                    0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F,
                    0x35f6B052C598d933D69A4EEC4D04c73A191fE6c2,
                    0x8575c8ae70bDB71606A53AeA1c6789cB0fBF3166,
                    0x267EB8Cf715455517F9BD5834AeAE3CeA1EBdbD8
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("sUSD")))
        ) {
            return
                Token(
                    0x57Ab1ec28D129707052df4dF418D58a2D46d5f51,
                    0x6C5024Cd4F8A59110119C56f8933403A539555EB,
                    0x30B0f7324feDF89d8eff397275F8983397eFe4af,
                    0xdC6a3Ab17299D9C2A412B0e0a4C1f55446AE0817
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("TUSD")))
        ) {
            return
                Token(
                    0x0000000000085d4780B73119b644AE5ecd22b376,
                    0x101cc05f4A51C0319f570d5E146a8C625198e636,
                    0x7f38d60D94652072b2C44a18c0e14A481EC3C0dd,
                    0x01C0eb1f8c6F1C1bF74ae028697ce7AA2a8b0E92
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDC")))
        ) {
            return
                Token(
                    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
                    0xBcca60bB61934080951369a648Fb03DF4F96263C,
                    0xE4922afAB0BbaDd8ab2a88E0C79d884Ad337fcA6,
                    0x619beb58998eD2278e08620f97007e1116D5D25b
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("CRV")))
        ) {
            return
                Token(
                    0xD533a949740bb3306d119CC777fa900bA034cd52,
                    0x8dAE6Cb04688C62d939ed9B68d32Bc62e49970b1,
                    0x9288059a74f589C919c7Cf1Db433251CdFEB874B,
                    0x00ad8eBF64F141f1C81e9f8f792d3d1631c6c684
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("GUSD")))
        ) {
            return
                Token(
                    0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd,
                    0xD37EE7e4f452C6638c96536e68090De8cBcdb583,
                    0xf8aC64ec6Ff8E0028b37EB89772d21865321bCe0,
                    0x279AF5b99540c1A3A7E3CDd326e19659401eF99e
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("BAL")))
        ) {
            return
                Token(
                    0xba100000625a3754423978a60c9317c58a424e3D,
                    0x272F97b7a56a387aE942350bBC7Df5700f8a4576,
                    0xe569d31590307d05DA3812964F1eDd551D665a0b,
                    0x13210D4Fe0d5402bd7Ecbc4B5bC5cFcA3b71adB0
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("xSUSHI")))
        ) {
            return
                Token(
                    0x8798249c2E607446EfB7Ad49eC89dD1865Ff4272,
                    0xF256CC7847E919FAc9B808cC216cAc87CCF2f47a,
                    0x73Bfb81D7dbA75C904f430eA8BAe82DB0D41187B,
                    0xfAFEDF95E21184E3d880bd56D4806c4b8d31c69A
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("renFIL")))
        ) {
            return
                Token(
                    0xD5147bc8e386d91Cc5DBE72099DAC6C9b99276F5,
                    0x514cd6756CCBe28772d4Cb81bC3156BA9d1744aa,
                    0xcAad05C49E14075077915cB5C820EB3245aFb950,
                    0x348e2eBD5E962854871874E444F4122399c02755
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("RAI")))
        ) {
            return
                Token(
                    0x03ab458634910AaD20eF5f1C8ee96F1D6ac54919,
                    0xc9BC48c72154ef3e5425641a3c747242112a46AF,
                    0x9C72B8476C33AE214ee3e8C20F0bc28496a62032,
                    0xB5385132EE8321977FfF44b60cDE9fE9AB0B4e6b
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("AMPL")))
        ) {
            return
                Token(
                    0xD46bA6D942050d489DBd938a2C909A5d5039A161,
                    0x1E6bb68Acec8fefBD87D192bE09bb274170a0548,
                    0x18152C9f77DAdc737006e9430dB913159645fa87,
                    0xf013D90E4e4E3Baf420dFea60735e75dbd42f1e1
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDP")))
        ) {
            return
                Token(
                    0x8E870D67F660D95d5be530380D0eC0bd388289E1,
                    0x2e8F4bdbE3d47d7d7DE490437AeA9915D930F1A3,
                    0x2387119bc85A74e0BBcbe190d80676CB16F10D4F,
                    0xFDb93B3b10936cf81FA59A02A7523B6e2149b2B7
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("DPI")))
        ) {
            return
                Token(
                    0x1494CA1F11D487c2bBe4543E90080AeBa4BA3C2b,
                    0x6F634c6135D2EBD550000ac92F494F9CB8183dAe,
                    0xa3953F07f389d719F99FC378ebDb9276177d8A6e,
                    0x4dDff5885a67E4EffeC55875a3977D7E60F82ae0
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("FRAX")))
        ) {
            return
                Token(
                    0x853d955aCEf822Db058eb8505911ED77F175b99e,
                    0xd4937682df3C8aEF4FE912A96A74121C0829E664,
                    0x3916e3B6c84b161df1b2733dFfc9569a1dA710c2,
                    0xfE8F19B17fFeF0fDbfe2671F248903055AFAA8Ca
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("FEI")))
        ) {
            return
                Token(
                    0x956F47F50A910163D8BF957Cf5846D573E7f87CA,
                    0x683923dB55Fead99A79Fa01A27EeC3cB19679cC3,
                    0xd89cF9E8A858F8B4b31Faf793505e112d6c17449,
                    0xC2e10006AccAb7B45D9184FcF5b7EC7763f5BaAe
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("stETH")))
        ) {
            return
                Token(
                    0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84,
                    0x1982b2F5814301d4e9a8b0201555376e62F82428,
                    0x66457616Dd8489dF5D0AFD8678F4A260088aAF55,
                    0xA9DEAc9f00Dc4310c35603FCD9D34d1A750f81Db
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("ENS")))
        ) {
            return
                Token(
                    0xC18360217D8F7Ab5e7c516566761Ea12Ce7F9D72,
                    0x9a14e23A58edf4EFDcB360f68cd1b95ce2081a2F,
                    0x34441FFD1948E49dC7a607882D0c38Efd0083815,
                    0x176808047cc9b7A2C9AE202c593ED42dDD7C0D13
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UST")))
        ) {
            return
                Token(
                    0xa693B19d2931d498c5B318dF961919BB4aee87a5,
                    0xc2e2152647F4C26028482Efaf64b2Aa28779EFC4,
                    0x7FDbfB0412700D94403c42cA3CAEeeA183F07B26,
                    0xaf32001cf2E66C4C3af4205F6EA77112AA4160FE
                );
        } else revert("Token does not exist");
    }
}
