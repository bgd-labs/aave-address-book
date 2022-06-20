// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Polygon {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xb023e699F5a33916Ea823A16485e259257cA8Bd1);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

    address internal constant POOL_ADMIN =
        0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772;

    address internal constant ACL_ADMIN =
        0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772;

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
                    0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063,
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
                    0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39,
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
                    0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174,
                    0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                    0x307ffe186F84a3bc2613D1eA417A5737D69A7007,
                    0xFCCf3cAbbe80101232d343252614b6A3eE81C989
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6,
                    0x078f358208685046a11C85e8ad32895DED33A249,
                    0x633b207Dd676331c413D4C013a6294B0FE47cD0e,
                    0x92b42c66840C7AD907b4BF74879FF3eF7c529473
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619,
                    0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                    0xD8Ad37849950903571df17049516a5CD4cbE55F6,
                    0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0xc2132D05D31c914a87C6611C10748AEb04B58e8F,
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
                    0xD6DF932A45C0f255f85145f286eA0b292B21C90B,
                    0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                    0xfAeF6A702D15428E588d4C0614AEFb4348D83D48,
                    0xE80761Ea617F66F96274eA5e8c37f03960ecC679
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WMATIC"))
        ) {
            return
                Token(
                    0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270,
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
                    0x172370d5Cd63279eFa6d502DAB29171933a610AF,
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
                    0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a,
                    0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA,
                    0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841,
                    0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("GHST"))
        ) {
            return
                Token(
                    0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7,
                    0x8Eb270e296023E9D92081fdF967dDd7878724424,
                    0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc,
                    0xCE186F6Cccb0c955445bb9d10C59caE488Fea559
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("BAL"))
        ) {
            return
                Token(
                    0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3,
                    0x8ffDf2DE812095b1D19CB146E4c004587C0A0692,
                    0xa5e408678469d23efDB7694b1B0A85BB0669e8bd,
                    0xA8669021776Bc142DfcA87c21b4A52595bCbB40a
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("DPI"))
        ) {
            return
                Token(
                    0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369,
                    0x724dc807b04555b71ed48a6896b6F41593b8C637,
                    0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a,
                    0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("EURS"))
        ) {
            return
                Token(
                    0xE111178A87A3BFf0c8d18DECBa5798827539Ae99,
                    0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5,
                    0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB,
                    0x5D557B07776D12967914379C71a1310e917C7555
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("jEUR"))
        ) {
            return
                Token(
                    0x4e3Decbb3645551B8A19f0eA1678079FCB33fB4c,
                    0x6533afac2E7BCCB20dca161449A13A32D391fb00,
                    0x6B4b37618D85Db2a7b469983C888040F7F05Ea3D,
                    0x44705f578135cC5d703b4c9c122528C73Eb87145
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("agEUR"))
        ) {
            return
                Token(
                    0xE0B52e49357Fd4DAf2c15e02058DCE6BC0057db4,
                    0x8437d7C167dFB82ED4Cb79CD44B7a32A1dd95c77,
                    0x40B4BAEcc69B882e8804f9286b12228C27F8c9BF,
                    0x3ca5FA07689F266e907439aFd1fBB59c44fe12f6
                );
        } else revert("Token does not exist");
    }
}
