// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Arbitrum {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xb56c2F0B653B2e0b10C9b928C8580Ac5Df02C7C7);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    address internal constant POOL_ADMIN =
        0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb;

    address internal constant ACL_ADMIN =
        0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb;

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
                    0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1,
                    0x0000000000000000000000000000000000000000,
                    0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                    0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0xf97f4df75117a78c1A5a0DBb814Af92458539FB4,
                    0x0000000000000000000000000000000000000001,
                    0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                    0x89D976629b7055ff1ca02b927BA3e020F22A44e4
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8,
                    0x0000000000000000000000000000000000000002,
                    0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                    0x307ffe186F84a3bc2613D1eA417A5737D69A7007
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f,
                    0x0000000000000000000000000000000000000003,
                    0x078f358208685046a11C85e8ad32895DED33A249,
                    0x633b207Dd676331c413D4C013a6294B0FE47cD0e
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x82aF49447D8a07e3bd95BD0d56f35241523fBab1,
                    0x0000000000000000000000000000000000000004,
                    0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                    0xD8Ad37849950903571df17049516a5CD4cbE55F6
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0xFd086bC7CD5C481DCC9C85ebE478A1C0b69FCbb9,
                    0x0000000000000000000000000000000000000005,
                    0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                    0x70eFfc565DB6EEf7B927610155602d31b670e802
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0xba5DdD1f9d7F570dc94a51479a000E3BCE967196,
                    0x0000000000000000000000000000000000000006,
                    0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                    0xfAeF6A702D15428E588d4C0614AEFb4348D83D48
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("EURS"))
        ) {
            return
                Token(
                    0xD22a58f79e9481D1a88e00c343885A588b34b68B,
                    0x0000000000000000000000000000000000000007,
                    0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                    0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E
                );
        } else revert("Token does not exist");
    }
}
