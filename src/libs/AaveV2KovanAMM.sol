// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, Token} from "./AaveV2.sol";

library AaveV2KovanAMM {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x67FB118A780fD740C8936511947cC4bE7bb7730c
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x762E2a3BBe729240ea44D31D5a81EAB44d34ef01);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x94837E841d9D792a11658e113e4ffBFCeb4CFf4b);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x8FB777d67e9945E2c01936E319057F9d41D559e6);

    address internal constant POOL_ADMIN =
        0x85e4A467343c0dc4aDAB74Af84448D9c45D8ae6F;

    address internal constant EMERGENCY_ADMIN =
        0xc6cfB8bCA4691f661773fACc64E47A4eBaEd712f;

    function getToken(string calldata token)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WETH")))
        ) {
            return
                Token(
                    0xd0A1E359811322d97991E03f863a0C30C2cF029C,
                    0xb166444459301534E4516D8D9E4469eBC7371cB3,
                    0x3f11A30f83C24140AF87D75c83Ef9Dafe319B900,
                    0x148921868cA77B0CcB2E2C9bF4af2640C521C8eF
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("DAI")))
        ) {
            return
                Token(
                    0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD,
                    0xd0c6883F5Fa3e042509860F25fF614D139E78C4b,
                    0xba65c1c6F489D705202Ae22F42154efb7a2281D9,
                    0xe134127F158A7e8657fb6cF183f42d9E6835Cf5A
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDC")))
        ) {
            return
                Token(
                    0xe22da380ee6B445bb8273C81944ADEB6E8450422,
                    0x851E23CB13a758217D8b66d61A543593C57b350E,
                    0x73063cEee6724fBa04d2D1681FaEC9284E93E154,
                    0xc3162766e7013e2D6dFF49b7694E11147E7E440e
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDT")))
        ) {
            return
                Token(
                    0x13512979ADE267AB5100878E2e0f485B568328a4,
                    0xC70D75c60a85e9Be67ED8e1d0DEb60948DCC8949,
                    0x9FFeF06906999e98FCdA3BFA6819D441d027a4A4,
                    0xd5A45aB33aa482FcC5bEf55d77af70E9e71DF0f9
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0xD1B98B6607330172f1D991521145A22BCe793277,
                    0xd3A2421Cf1d3DA7CF64A29C89BEc54b01B780976,
                    0x58EE2E3feDc484612FF8c7e53415A7078786AA25,
                    0x13eA3c402a93A52d03955C24BB11589C02f6cA50
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIDAIWETH")))
        ) {
            return
                Token(
                    0x0C652EeEA3d7D35759ba1E16183F1D89C386C9ea,
                    0xE47411243D56Fad6c20EAC13146fF837911ce5C0,
                    0x77fDE3b0e69E3581D14D55740FBF2Fd0b9BfAB5A,
                    0xa97f60783c71a629cFf34d5Ec582F7F1dC6F9dfb
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIWBTCWETH")))
        ) {
            return
                Token(
                    0x796d562B1dF5b9dc85A4612187B6f29Ed213d960,
                    0x7C6Cafc9417D5C9D30F4bcf7fDD5e80a7c519b24,
                    0x9A009e6394037217D11aD7DD583C1a223b838A6f,
                    0x75E24aD1A62864140FC96A8E75e560Ec81180723
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIAAVEWETH")))
        ) {
            return
                Token(
                    0x657A7B8b46F35C5C6583AEF43824744B236EF826,
                    0x246910Ed7f65Ed3A14e12cA8252050f0D053d4f3,
                    0xEF262Feb93DAc487BA1c4d414462e7A0BEE11E44,
                    0xCdf3D21eE70FFda5b16a5DCECC46Ac4aCA941e3b
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIBATWETH")))
        ) {
            return
                Token(
                    0xf8CEBA8b16579956B3aE4B5D09002a30f873F783,
                    0x8573C36abDfF504Fa152Df21a29b0Ef7fB556BDd,
                    0xa62b5C24B4c455FF9988460E3d9Dc81625E680b6,
                    0xf8Ad413f806D5803ef75B6cd460c786ddb20eD76
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIUSDCDAI")))
        ) {
            return
                Token(
                    0x8e80b7a7531c276dD1dBEC2f1Cc281c11c859e62,
                    0x38fBD1E8854E7dc99d9B05159CCfcDF34CCCC22E,
                    0xA3f8Ab69BCa2088FBd928e2310F1B105d8dee6d9,
                    0x4c04cCEDE80DA68f4e3eC3ed62C3C4B36C5DB3d3
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNICRVWETH")))
        ) {
            return
                Token(
                    0x9c31b7538467bF0b01e6d5fA789e66Ce540a521e,
                    0x4961d5aE55dDaEf2B48bADB8FC8af4A03f05f522,
                    0xb51efF30E6bEEA737280c6C33BDAb9120231ba17,
                    0xf09aA83f29B4D0780683547048B52DFA673573ce
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNILINKWETH")))
        ) {
            return
                Token(
                    0x5Acab7f8B79620ec7127A96E5D8837d2124D5D7c,
                    0xCF76bb68f55396834afe3BD0584255b0e4A89200,
                    0x48E063584d035b81CB4a6427B72FfcAB140bb2f9,
                    0x4598a410E4fAb2E6462D1EF7D99C15894fE93232
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIMKRWETH")))
        ) {
            return
                Token(
                    0xB0C6EC5d58ddbF4cd1e419A56a19924E9904e4Dd,
                    0x24d385E75714Ce272fD325CA6bb467C1e538596d,
                    0x1B8eF1716B08B8968fF2ab690E500C832d2a52aD,
                    0x3735E3497552c4D9db6043E5453fda7D38dC5464
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIRENWETH")))
        ) {
            return
                Token(
                    0xcF428637A9f8Af21920Bc0A94fd81071bc790105,
                    0xB0dc343934E6DF75e38922a8297f59ddfEF73d41,
                    0xB150466cdD3F9B7ae9E7b0B03A93811d00A35077,
                    0x220B13F2F594b2665AA7FD8f243e105801f49fc4
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNISNXWETH")))
        ) {
            return
                Token(
                    0xc8F2a0d698f675Ece74042e9fB06ea52b9517521,
                    0x7FD8BB35386146872b986ABb8641EcF1f4Aa65D5,
                    0x55fF642869260A4F1149828749F7dB2ab4d87dB8,
                    0x5c0D9Ba7c4Cc7DfC0aAD077FEBaf83738016F302
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIUNIWETH")))
        ) {
            return
                Token(
                    0xcC99A5f95a86d30e3DeF113bCf22f00ecF90D050,
                    0x1d04418b8EB523a26fC781791306086090004835,
                    0xB507C167626b9443633f121d674B6b05E016b878,
                    0xa08c317E305E82Fb478fD3c60975b15Cc935D2F2
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIUSDCWETH")))
        ) {
            return
                Token(
                    0x8C00D2428ed1857E61652aca663323A85E6e76a9,
                    0xb9F0dA20d165a55B5e86768205CD675C6bB6ee0e,
                    0x5709253475B0F8dA707D6D67b29be27d7d22D7f7,
                    0x12902B8B142d7090F246E53160965d64a80E6292
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIWBTCUSDC")))
        ) {
            return
                Token(
                    0x3d35B5F289f55A580e6F85eE22E6a8f57053b966,
                    0x499e7BfF0D68a6f14dCB18217b94aDCd694C8502,
                    0x5A54ce36299Efae12f9160b2813d8EDdBf14DBa2,
                    0xB7f50F12Ce14eB45042D26427F176C9e616a80F9
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNIYFIWETH")))
        ) {
            return
                Token(
                    0x5af95ddFACC150a1695A3Fc606459fd0dE57b91f,
                    0xdc0339592D296472c7D33D4ac5F62eE06856f765,
                    0x1028dafe8295655f29E20745eAcbFEee791d9836,
                    0xCda309b74651535d1054BC1fEDC909c3E40C0925
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("BPTWBTCWETH")))
        ) {
            return
                Token(
                    0x110569E3261bC0934dA637b019f6f1b6F50ec574,
                    0x6Fe2D5AEDa89aA69303B158504aA3974d6D51888,
                    0x8092749Adca75e50944DfaeEfA00e0fdCF94DC91,
                    0x0340C7a6DD09b25e2507D07ECA4403F62d02b79A
                );
        } else revert("Token does not exist");
    }
}
