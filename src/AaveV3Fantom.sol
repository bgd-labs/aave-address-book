// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Fantom {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xfd6f3c1845604C8AE6c6E402ad17fb9885160754);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    address internal constant POOL_ADMIN =
        0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949;

    address internal constant ACL_ADMIN =
        0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949;

    address internal constant ACL_MANAGER =
        0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B;

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
    }
}
