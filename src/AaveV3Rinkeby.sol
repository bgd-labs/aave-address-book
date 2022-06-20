// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3Rinkeby {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xBA6378f1c1D046e9EB0F538560BA7558546edF3C);

    IPool internal constant POOL =
        IPool(0xE039BdF1d874d27338e09B55CB09879Dedca52D8);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x11E9F019FCC15AccB472Aa49C8fc0c61949c86d5);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA323726989db5708B19EAd4A494dDe09F3cEcc69);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0xBAB2E7afF5acea53a43aEeBa2BA6298D8056DcE5);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_MANAGER =
        0x74E3445f239f9915D57715Efb810f67b2a7E5758;

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
                    0x4aAded56bd7c69861E8654719195fCA9C670EB45,
                    0x49866611AA7Dc30130Ac6A0DF29217D16FD87bc0,
                    0x0F48c09701B6D24d6D9571637758EE06eeCb9630,
                    0x37768F60EfcFF96188530B022e3DE9d168c2c8E8
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0x237f409fBD10E30e237d63d9050Ae302e339028E,
                    0xeC4752053c5A693eBE6A07deF330a9F97D07FBC3,
                    0x4e63D3ff7Bca937FAD4e1b0e9aF4f946f2AAaE64,
                    0x34c5DAeC73aE986Bf93bCf22d41e505264A86625
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0xb18d016cDD2d9439A19f15633005A6b2cd6Aa774,
                    0x50b283C17b0Fc2a36c550A57B1a133459F4391B3,
                    0xee3D33c0C779cAD53CAa496aa5a97D026D1218Ca,
                    0x0EfFd205184FE944f9eF80264b144270dB15eEa7
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0x124F70a8a3246F177b0067F435f5691Ee4e467DD,
                    0xeC1d8303b8fa33afB59012Fc3b49458B57883326,
                    0x372C35caeED54907d694DF6229319779fbC79440,
                    0x3eA8e63b6e7260C2D6cfc3877914cbB6eE687D6B
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0xd74047010D77c5901df5b0f9ca518aED56C85e8D,
                    0x608D11E704baFb68CfEB154bF7Fd641120e33aD4,
                    0x7666ca6911bEcBA7d38Fa2da8278b82297EC7e6F,
                    0x252C97371c9Ad590898fcDb0C401d9230939A78F
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0x326005cFdF58bfB38650396836BEBF815F5ab4dD,
                    0x377D3F732CBeB84D0EebF71e1a4e3546Da86C76d,
                    0xCC28d19D8e8A64D2Fc1709e8FE7b6139e25Fd524,
                    0x427cd2ad9Fe0B63ec26Df3aA83D4048149B3DCB3
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0x100aB78E5A565a94f2a191714A7a1B727268eFFb,
                    0x3fc92c5f08c361EB21ef86a31d55df4b92ab7874,
                    0x951a8575A0b18A1180D5e8DD0e2e646E235b42bb,
                    0xd2693256be8c567d26D50f4B04479bD49a3aC3B5
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("EURS"))
        ) {
            return
                Token(
                    0x7eEB186F13538e6795a0823e2D7283FEeD2738f5,
                    0xC6B64D19EeF69071F32b043F8e57e506A86B8612,
                    0xEa7619f4AE50C3a6ad07e8Bd029b937B8D57A2b8,
                    0x31e1005A6d7e48055b3BA617E4337Fb04D2C9EE0
                );
        } else revert("Token does not exist");
    }
}
