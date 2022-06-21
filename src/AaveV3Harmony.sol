// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Harmony {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x3C90887Ede8D65ccb2777A5d577beAb2548280AD);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

    address internal constant POOL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;

    address internal constant ACL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;

    function getToken(string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
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
    }
}
