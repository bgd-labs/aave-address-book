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
                    0xb3654dc3D10Ea7645f8319668E8F54d2574FBdC8,
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
                    0x04068DA6C83AFCFA0e13ba15A6696662335D5B75,
                    0x0000000000000000000000000000000000000002,
                    0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                    0x307ffe186F84a3bc2613D1eA417A5737D69A7007
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("BTC"))
        ) {
            return
                Token(
                    0x321162Cd933E2Be498Cd2267a90534A804051b11,
                    0x0000000000000000000000000000000000000003,
                    0x078f358208685046a11C85e8ad32895DED33A249,
                    0x633b207Dd676331c413D4C013a6294B0FE47cD0e
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("ETH"))
        ) {
            return
                Token(
                    0x74b23882a30290451A17c44f4F05243b6b58C76d,
                    0x0000000000000000000000000000000000000004,
                    0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                    0xD8Ad37849950903571df17049516a5CD4cbE55F6
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("fUSDT"))
        ) {
            return
                Token(
                    0x049d68029688eAbF473097a2fC38ef61633A3C7A,
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
                    0x6a07A792ab2965C72a5B8088d3a069A7aC3a993B,
                    0x0000000000000000000000000000000000000006,
                    0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                    0xfAeF6A702D15428E588d4C0614AEFb4348D83D48
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WFTM"))
        ) {
            return
                Token(
                    0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83,
                    0x0000000000000000000000000000000000000007,
                    0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                    0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("CRV"))
        ) {
            return
                Token(
                    0x1E4F97b9f9F913c46F1632781732927B9019C68b,
                    0x0000000000000000000000000000000000000008,
                    0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf,
                    0x08Cb71192985E936C7Cd166A8b268035e400c3c3
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("SUSHI"))
        ) {
            return
                Token(
                    0xae75A438b2E0cB8Bb01Ec1E1e376De11D44477CC,
                    0x0000000000000000000000000000000000000009,
                    0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA,
                    0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841
                );
        } else revert("Token does not exist");
    }
}
