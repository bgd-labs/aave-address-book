// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Mumbai {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6);

    IPool internal constant POOL =
        IPool(0x6C9fB0D5bD9429eb9Cd96B85B81d872281771E6B);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x7b47e727eC539CB74A744ae5259ef26743294fca);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x520D14AE678b41067f029Ad770E2870F85E76588);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x8f57153F18b7273f9A814b93b31Cb3f9b035e7C2);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x6437b6E14D7ECa1Fa9854df92eB067253D5f683A);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant COLLECTOR =
        0x3B6E7a4750e478D7f7d6A5d464099A02ef164bCC;

    address internal constant COLLECTOR_CONTROLLER =
        0x810d913542D399F3680F0E806DEDf6EACf0e3383;

    function getToken(string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
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
    }
}
