// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, Token} from "./AaveV3.sol";

library AaveV3ArbitrumRinkeby {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c);

    IPool internal constant POOL =
        IPool(0x9C55a3C34de5fd46004Fa44a55490108f7cE388F);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0xCf7e77c25e04d5F44AA20C505fbda04BFCF60c0b);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x2560A04c24E8870bB12eE7A9E2DcC4186362F3A1);

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
                    0x200c2386A02cbA50563b7b64615B43Ab1874a06e,
                    0x0000000000000000000000000000000000000000,
                    0x38c4f078813bcAc22b4c580A870F812377615D59,
                    0xa626040B7Ec7febdA5c4f470d88541Fcb9e465a9
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0x403052a80d33A79Bef4645c0D8Ff00FA03f424c7,
                    0x0000000000000000000000000000000000000001,
                    0x9F3399055a08549F706353BbD0796cB682337529,
                    0x60399941B74464eCe33cb681d830fa4e7370D3dc
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0x774382EF196781400a335AF0c4219eEd684ED713,
                    0x0000000000000000000000000000000000000002,
                    0x80a8F2FcC1fF2A658cd684b27227CB85eC0eebab,
                    0x057A698a4fD2C486dd269E285e1c4Cbfac2D0A4B
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0x1F7dC0B961950c69584d0F9cE290A918124d32CD,
                    0x0000000000000000000000000000000000000003,
                    0x020Ccb5Fcbb05d7d4C6cF702c081d47EC357A68E,
                    0x314EED755BD345029Eb6A42F1648f889bD7179f0
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x5eb35Fe1f1074Ae8d6D23Bf771705846Cc812c09,
                    0x0000000000000000000000000000000000000004,
                    0xD7a3657B2B395a166cD068269B4a3f42Fd2ef5D8,
                    0x84B63b4607E47Ae1E17907200690feFBFfF804aD
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0x7c53810c756C636cEF076c92D5D7C04555694E76,
                    0x0000000000000000000000000000000000000005,
                    0xf6dF93819BeBd3A73F4DF43327Ce0f95d148ED47,
                    0x29E13C2B7B35B4FFf8d3323bC73b5D462d0f22c8
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0x31f909C64E93f764dc90d78DCBB38a6A6D1D48dE,
                    0x0000000000000000000000000000000000000006,
                    0xD5B608ec055675661c5425f0B92301F32A8f1aCA,
                    0x6895ACc82d5556e8289c65c1eA60D8E96D00a94B
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("EURS"))
        ) {
            return
                Token(
                    0xaB874B1862938704Cf44Fb81E33c59B67c6BeC07,
                    0x0000000000000000000000000000000000000007,
                    0x81728cFD25eE94285322fE7fd2AC163ba24040b0,
                    0x831d5aE09d3CD39d1ac601bA1E73eA639b96B2f6
                );
        } else revert("Token does not exist");
    }
}
