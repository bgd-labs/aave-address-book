// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3HarmonyTestnet {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xd19443202328A66875a51560c28276868B8C61C2);

    IPool internal constant POOL =
        IPool(0x85C1F3f1bB439180f7Bfda9DFD61De82e10bD554);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0xdb903B5a28260E87cF1d8B56740a90Dba1c8fe15);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x29Ff3c19C6853A0b6544b3CC241c360f422aBaD1);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0xFc7215C9498Fc12b22Bc0ed335871Db4315f03d3);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0x1758d4e6f68166C4B2d9d0F049F33dEB399Daa1F);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

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
    }
}
