// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, Token} from "./AaveV3.sol";

library AaveV3Mumbai {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6);

    IPool internal constant POOL =
        IPool(0x6C9fB0D5bD9429eb9Cd96B85B81d872281771E6B);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x7b47e727eC539CB74A744ae5259ef26743294fca);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x520D14AE678b41067f029Ad770E2870F85E76588);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    function getToken(string calldata token)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
            keccak256(abi.encodePacked(token)) ==
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
    }
}
