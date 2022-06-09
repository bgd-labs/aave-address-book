// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Token} from "./AaveV2.sol";

library AaveV2Polygon {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xd05e3E715d945B59290df0ae8eF85c1BdB684744
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x26db2B833021583566323E3b8985999981b9F1F3);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x7551b5D2763519d4e37e8B81929D336De671d46d);

    address internal constant POOL_ADMIN =
        0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772;

    address internal constant EMERGENCY_ADMIN =
        0x1450F2898D6bA2710C98BE9CAF3041330eD5ae58;

    function getToken(string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("DAI")))
        ) {
            return
                Token(
                    0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063,
                    0x27F8D03b3a2196956ED754baDc28D73be8830A6e,
                    0x2238101B7014C279aaF6b408A284E49cDBd5DB55,
                    0x75c4d1Fb84429023170086f06E682DcbBF537b7d
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDC")))
        ) {
            return
                Token(
                    0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174,
                    0x1a13F4Ca1d028320A707D99520AbFefca3998b7F,
                    0xdeb05676dB0DB85cecafE8933c903466Bf20C572,
                    0x248960A9d75EdFa3de94F7193eae3161Eb349a12
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDT")))
        ) {
            return
                Token(
                    0xc2132D05D31c914a87C6611C10748AEb04B58e8F,
                    0x60D55F02A771d515e077c9C2403a1ef324885CeC,
                    0xe590cfca10e81FeD9B0e4496381f02256f5d2f61,
                    0x8038857FD47108A07d1f6Bf652ef1cBeC279A2f3
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6,
                    0x5c2ed810328349100A66B82b78a1791B101C9D61,
                    0x2551B15dB740dB8348bFaDFe06830210eC2c2F13,
                    0xF664F50631A6f0D72ecdaa0e49b0c019Fa72a8dC
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WETH")))
        ) {
            return
                Token(
                    0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619,
                    0x28424507fefb6f7f8E9D3860F56504E4e5f5f390,
                    0xc478cBbeB590C76b01ce658f8C4dda04f30e2C6f,
                    0xeDe17e9d79fc6f9fF9250D9EEfbdB88Cc18038b5
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WMATIC")))
        ) {
            return
                Token(
                    0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270,
                    0x8dF3aad3a84da6b69A4DA8aeC3eA40d9091B2Ac4,
                    0xb9A6E29fB540C5F1243ef643EB39b0AcbC2e68E3,
                    0x59e8E9100cbfCBCBAdf86b9279fa61526bBB8765
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("AAVE")))
        ) {
            return
                Token(
                    0xD6DF932A45C0f255f85145f286eA0b292B21C90B,
                    0x1d2a0E5EC8E5bBDCA5CB219e649B565d8e5c3360,
                    0x17912140e780B29Ba01381F088f21E8d75F954F9,
                    0x1c313e9d0d826662F5CE692134D938656F681350
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("GHST")))
        ) {
            return
                Token(
                    0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7,
                    0x080b5BF8f360F624628E0fb961F4e67c9e3c7CF1,
                    0x6A01Db46Ae51B19A6B85be38f1AA102d8735d05b,
                    0x36e988a38542C3482013Bb54ee46aC1fb1efedcd
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("BAL")))
        ) {
            return
                Token(
                    0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3,
                    0xc4195D4060DaEac44058Ed668AA5EfEc50D77ff6,
                    0xbC30bbe0472E0E86b6f395f9876B950A13B23923,
                    0x773E0e32e7b6a00b7cA9daa85dfba9D61B7f2574
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("DPI")))
        ) {
            return
                Token(
                    0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369,
                    0x81fB82aAcB4aBE262fc57F06fD4c1d2De347D7B1,
                    0xA742710c0244a8Ebcf533368e3f0B956B6E53F7B,
                    0x43150AA0B7e19293D935A412C8607f9172d3d3f3
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("CRV")))
        ) {
            return
                Token(
                    0x172370d5Cd63279eFa6d502DAB29171933a610AF,
                    0x3Df8f92b7E798820ddcCA2EBEA7BAbda2c90c4aD,
                    0x807c97744e6C9452e7C2914d78f49d171a9974a0,
                    0x780BbcBCda2cdb0d2c61fd9BC68c9046B18f3229
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("SUSHI")))
        ) {
            return
                Token(
                    0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a,
                    0x21eC9431B5B55c5339Eb1AE7582763087F98FAc2,
                    0x7Ed588DCb30Ea11A54D8a5E9645960262A97cd54,
                    0x9CB9fEaFA73bF392C905eEbf5669ad3d073c3DFC
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("LINK")))
        ) {
            return
                Token(
                    0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39,
                    0x0Ca2e42e8c21954af73Bc9af1213E4e81D6a669A,
                    0x9fb7F546E60DDFaA242CAeF146FA2f4172088117,
                    0xCC71e4A38c974e19bdBC6C0C19b63b8520b1Bb09
                );
        } else revert("Token does not exist");
    }
}
