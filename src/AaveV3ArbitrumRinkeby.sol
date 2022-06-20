// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3ArbitrumRinkeby {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c);

    IPool internal constant POOL =
        IPool(0x9C55a3C34de5fd46004Fa44a55490108f7cE388F);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0xCf7e77c25e04d5F44AA20C505fbda04BFCF60c0b);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x2560A04c24E8870bB12eE7A9E2DcC4186362F3A1);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x9bf4b639C27F7aaF2eE2c1917478fd48370CE390);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_MANAGER =
        0x371cdFcbeA8f98e045184373d83c10762E193075;

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
                    0x200c2386A02cbA50563b7b64615B43Ab1874a06e,
                    0x38c4f078813bcAc22b4c580A870F812377615D59,
                    0xa626040B7Ec7febdA5c4f470d88541Fcb9e465a9,
                    0x7e983CD5e2Af0Dc0519fA15F0D8D1b4EDd04e588
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0x403052a80d33A79Bef4645c0D8Ff00FA03f424c7,
                    0x9F3399055a08549F706353BbD0796cB682337529,
                    0x60399941B74464eCe33cb681d830fa4e7370D3dc,
                    0x1cFCee0E4B082f466735Ad4BC38F35Df87a6ad56
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0x774382EF196781400a335AF0c4219eEd684ED713,
                    0x80a8F2FcC1fF2A658cd684b27227CB85eC0eebab,
                    0x057A698a4fD2C486dd269E285e1c4Cbfac2D0A4B,
                    0x23FCB713dfFd6D8D213eB16C5Eb70673A7e7A462
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0x1F7dC0B961950c69584d0F9cE290A918124d32CD,
                    0x020Ccb5Fcbb05d7d4C6cF702c081d47EC357A68E,
                    0x314EED755BD345029Eb6A42F1648f889bD7179f0,
                    0xcC03498c9D8EE0c7c3e2c6032031ac563a3429f1
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x5eb35Fe1f1074Ae8d6D23Bf771705846Cc812c09,
                    0xD7a3657B2B395a166cD068269B4a3f42Fd2ef5D8,
                    0x84B63b4607E47Ae1E17907200690feFBFfF804aD,
                    0x38fcFDEb4A31F0C36502A91eab3585deE9F5955f
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0x7c53810c756C636cEF076c92D5D7C04555694E76,
                    0xf6dF93819BeBd3A73F4DF43327Ce0f95d148ED47,
                    0x29E13C2B7B35B4FFf8d3323bC73b5D462d0f22c8,
                    0x95aa1D10444cB5E815f6afe473859177C8829c7d
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0x31f909C64E93f764dc90d78DCBB38a6A6D1D48dE,
                    0xD5B608ec055675661c5425f0B92301F32A8f1aCA,
                    0x6895ACc82d5556e8289c65c1eA60D8E96D00a94B,
                    0xCE2d1a5b977E42741147214a67B22Bc703B8Dcd5
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("EURS"))
        ) {
            return
                Token(
                    0xaB874B1862938704Cf44Fb81E33c59B67c6BeC07,
                    0x81728cFD25eE94285322fE7fd2AC163ba24040b0,
                    0x831d5aE09d3CD39d1ac601bA1E73eA639b96B2f6,
                    0x8447f6e52731cB9cA2e39945B93297A53FA7c29f
                );
        } else revert("Token does not exist");
    }
}
