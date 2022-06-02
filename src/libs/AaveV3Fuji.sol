// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Token} from "./AaveV3.sol";

library AaveV3Fuji {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29);

    IPool internal constant POOL =
        IPool(0xb47673b7a73D78743AFF1487AF69dBB5763F00cA);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x01743372F0F0318AaDF690f960A4c6c4eab58782);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xAc6D153BF94aFBdC296e72163735B0f94581F736);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x8e0988b28f9CdDe0134A206dfF94111578498C63);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    function getToken(string calldata token)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("DAI"))
        ) {
            return
                Token(
                    0xFc7215C9498Fc12b22Bc0ed335871Db4315f03d3,
                    0x0000000000000000000000000000000000000000,
                    0xC42f40B7E22bcca66B3EE22F3ACb86d24C997CC2,
                    0xf5934275da36A067CE00b415F0b876fA403A7198
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0x73b4C0C45bfB90FC44D9013FA213eF2C2d908D0A,
                    0x0000000000000000000000000000000000000001,
                    0x210a3f864812eAF7f89eE7337EAA1FeA1830C57e,
                    0x0DDD3C8dfA22d4B5e5Dc086f87d94e4180dAC38D
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0x3E937B4881CBd500d05EeDAB7BA203f2b7B3f74f,
                    0x0000000000000000000000000000000000000002,
                    0xA79570641bC9cbc6522aA80E2de03bF9F7fd123a,
                    0xC168dB86f93F97652462ded450B3Ad5eA9669df2
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0x09C85Ef96e93f0ae892561052B48AE9DB29F2458,
                    0x0000000000000000000000000000000000000003,
                    0x07B2C0b69c70e89C94A20A555Ab376E5a6181eE6,
                    0xdfBa66e02c4915708e7Df3C26843D5A3492727d9
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x28A8E6e41F84e62284970E4bc0867cEe2AAd0DA4,
                    0x0000000000000000000000000000000000000004,
                    0x618922b15a1a92652818473741531eE255f68741,
                    0xBA932F4F400204c7a05bDF06c6fcA8c114e39d8c
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0xD90db1ca5A6e9873BCD9B0279AE038272b656728,
                    0x0000000000000000000000000000000000000005,
                    0x3a7e85a86F952CB61485e2D20BDDb6e15204744f,
                    0xB66d28fd0FF446aB504dEF6C2BCd0ef5c0AADdD3
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0xCcbBaf8D40a5C34bf1c836e8dD33c7B7646706C5,
                    0x0000000000000000000000000000000000000006,
                    0xE9C1731e1186362E2ba233BC16614b2a53ecb3F2,
                    0x118369DcFb3Dfaa36Ad424AF26247c2D91CA1262
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WAVAX"))
        ) {
            return
                Token(
                    0x407287b03D1167593AF113d32093942be13A535f,
                    0x0000000000000000000000000000000000000007,
                    0xC50E6F9E8e6CAd53c42ddCB7A42d616d7420fd3e,
                    0xaB73C7267347a8dc4d34f9969663E7a64B578C69
                );
        } else revert("Token does not exist");
    }
}
