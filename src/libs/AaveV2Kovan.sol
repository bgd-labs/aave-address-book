// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, Token} from "./AaveV2.sol";

library AaveV2Kovan {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x88757f2f99175387aB4C6a4b3067c77A695b0349
        );

    ILendingPool internal constant POOL =
        ILendingPool(0xE0fBa4Fc209b4948668006B2bE61711b7f465bAe);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x25D0106aaB3F906F00C1E59716Bb5F749dB12ccE);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xB8bE51E6563BB312Cbb2aa26e352516c25c26ac1);

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
            keccak256(abi.encodePacked(("AAVE")))
        ) {
            return
                Token(
                    0xB597cd8D3217ea6477232F9217fa70837ff667Af,
                    0x6d93ef8093F067f19d33C2360cE17b20a8c45CD7,
                    0x72d2Aea8aCcD3277D90093a974eFf3e1945871D7,
                    0x5aF7bAC415D9c249176ea233E92646E5c9288b92
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("BAT")))
        ) {
            return
                Token(
                    0x2d12186Fbb9f9a8C28B3FfdD4c42920f8539D738,
                    0x28f92b4c8Bdab37AF6C4422927158560b4bB446e,
                    0x07a0B32983ab8203E8C3493F0AbE5bFe784fAa15,
                    0xcE271C229576605bdabD0A3D664685cbC383f3a6
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("BUSD")))
        ) {
            return
                Token(
                    0x4c6E1EFC12FDfD568186b7BAEc0A43fFfb4bCcCf,
                    0xfe3E41Db9071458e39104711eF1Fa668bae44e85,
                    0x597c5d0390E7e995d36F2e49F9eD979697723bE9,
                    0xB85eCAd7a9C9F09749CeCF84122189A7908eC934
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("DAI")))
        ) {
            return
                Token(
                    0xFf795577d9AC8bD7D90Ee22b6C1703490b6512FD,
                    0xdCf0aF9e59C002FA3AA091a46196b37530FD48a8,
                    0x3B91257Fe5CA63b4114ac41A0d467D25E2F747F3,
                    0xEAbBDBe7aaD7d5A278da40967E62C8c8Fe5fAec8
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("ENJ")))
        ) {
            return
                Token(
                    0xC64f90Cd7B564D3ab580eb20a102A8238E218be2,
                    0x1d1F2Cb9ED46A8d5bf0254E5CE400514D62d55F0,
                    0x8af08B5874380E1F1816e30bE12d773f4EB70e67,
                    0xc11e09B03634144a1862E14ef7569DbEb4b7F3a2
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("KNC")))
        ) {
            return
                Token(
                    0x3F80c39c0b96A0945f9F0E9f55d8A8891c5671A8,
                    0xdDdEC78e29f3b579402C42ca1fd633DE00D23940,
                    0x7f4E5bA1eE5dCAa4440371ec521cBc130De12E5e,
                    0x196d717b2D8a5694572C2742343C333EA27B8288
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("LINK")))
        ) {
            return
                Token(
                    0xAD5ce863aE3E4E9394Ab43d4ba0D80f419F61789,
                    0xeD9044cA8F7caCe8eACcD40367cF2bee39eD1b04,
                    0x0DBEE55AB73e3C14421d3f437a218ea99A520556,
                    0xcCead10A3BA54b1FA6D107b63B7D5e5e2f9888D8
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("MANA")))
        ) {
            return
                Token(
                    0x738Dc6380157429e957d223e6333Dc385c85Fec7,
                    0xA288B1767C91Aa9d8A14a65dC6B2E7ce68c02DFd,
                    0xd4aEcF57cbcfeA373565DE75537aAc911EAF1759,
                    0xaEE5AA094B55b6538388A4E8CBAe9E81Bfe815e6
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("MKR")))
        ) {
            return
                Token(
                    0x61e4CAE3DA7FD189e52a4879C7B8067D7C2Cc0FA,
                    0x9d9DaBEae6BcBa881404A9e499B13B2B3C1F329E,
                    0xC37AadA7758e10a49bdECb9078753d5D096A4649,
                    0xB86a93aA1325e4F58E3dbA7CE9DA251D83374fA2
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("REN")))
        ) {
            return
                Token(
                    0x5eebf65A6746eed38042353Ba84c8e37eD58Ac6f,
                    0x01875ee883B32f5f961A92eC597DcEe2dB7589c1,
                    0xc66a5fd3Bd3D0329895ceE5755e161FD89c2EecD,
                    0x75f318b9B40c5bEb0EEAdab5294C4108A376a22d
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("SNX")))
        ) {
            return
                Token(
                    0x7FDb81B0b8a010dd4FFc57C3fecbf145BA8Bd947,
                    0xAA74AdA92dE4AbC0371b75eeA7b1bd790a69C9e1,
                    0x14B7a7Ab57190aEc3210303ef1cF29088535B329,
                    0x7dF2a710751cb9f1FD392107187e4Aed0Ae867b0
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("sUSD")))
        ) {
            return
                Token(
                    0x99b267b9D96616f906D53c26dECf3C5672401282,
                    0x9488fF6F29ff75bfdF8cd5a95C6aa679bc7Cd65c,
                    0xB155258d3c18dd5D41e8838c8b45CaE1B17a11D9,
                    0xf3B942441Bd9d335E64413BeA6b76a49A5853C54
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("TUSD")))
        ) {
            return
                Token(
                    0x016750AC630F711882812f24Dba6c95b9D35856d,
                    0x39914AdBe5fDbC2b9ADeedE8Bcd444b20B039204,
                    0x082576C4CfC2eE1e0b8088B84d50CEb97CD84E49,
                    0xC0cFab5E4A9D8DA2Bc98D0a2b3f9dc20f7eec19C
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDC")))
        ) {
            return
                Token(
                    0xe22da380ee6B445bb8273C81944ADEB6E8450422,
                    0xe12AFeC5aa12Cf614678f9bFeeB98cA9Bb95b5B0,
                    0x252C017036b144A812b53BC122d0E67cBB451aD4,
                    0xBE9B058a0f2840130372a81eBb3181dcE02BE957
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDT")))
        ) {
            return
                Token(
                    0x13512979ADE267AB5100878E2e0f485B568328a4,
                    0xFF3c8bc103682FA918c954E84F5056aB4DD5189d,
                    0xf3DCeaDf668607bFCF565E84d9644c42eea518cd,
                    0xa6EfAF3B1C6c8E2be44818dB64E4DEC7416983a1
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0xD1B98B6607330172f1D991521145A22BCe793277,
                    0x62538022242513971478fcC7Fb27ae304AB5C29F,
                    0x45b85733E2609B9Eb18DbF1315765ddB8431e0B6,
                    0x9b8107B86A3cD6c8d766B30d3aDD046348bf8dB4
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WETH")))
        ) {
            return
                Token(
                    0xd0A1E359811322d97991E03f863a0C30C2cF029C,
                    0x87b1f4cf9BD63f7BBD3eE1aD04E8F52540349347,
                    0x1F85D0dc45332D00aead98D26db0735350F80D18,
                    0xDD13CE9DE795E7faCB6fEC90E346C7F3abe342E2
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("YFI")))
        ) {
            return
                Token(
                    0xb7c325266ec274fEb1354021D27FA3E3379D840d,
                    0xF6c7282943Beac96f6C70252EF35501a6c1148Fe,
                    0x7417855ed88C62e610e612Be52AeE510703Dff04,
                    0xfF682fF79FEb2C057eC3Ff1e083eFdC66f9b37FB
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("ZRX")))
        ) {
            return
                Token(
                    0xD0d76886cF8D952ca26177EB7CfDf83bad08C00C,
                    0xf02D7C23948c9178C68f5294748EB778Ab5e5D9c,
                    0x7488Eb7fce7e31b91eB9cA4158d54D92e4BB03D7,
                    0x7a1C28e06bcb4b1fF4768BC2CB9cd33b7622cD62
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("UNI")))
        ) {
            return
                Token(
                    0x075A36BA8846C6B6F53644fDd3bf17E5151789DC,
                    0x601FFc9b7309bdb0132a02a569FBd57d6D1740f2,
                    0x7A43B2653FF42BDE048e3b14fB42028956a7B6b1,
                    0x10339d6562e8867bB93506572fF8Aea94B2fF656
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("AMPL")))
        ) {
            return
                Token(
                    0x3E0437898a5667a4769B1Ca5A34aAB1ae7E81377,
                    0xb8a16bbab34FA7A5C09Ec7679EAfb8fEC06897bc,
                    0x9157d57DC97A7AFFC7b0a78E78fe25e1401B1dCc,
                    0xb7b7AF565495670713C92B8848fC8A650a968F81
                );
        } else revert("Token does not exist");
    }
}
