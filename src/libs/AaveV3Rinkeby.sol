// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, Token} from "./AaveV3.sol";


library AaveV3Rinkeby {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0xBA6378f1c1D046e9EB0F538560BA7558546edF3C
        );

    IPool internal constant POOL =
        IPool(0xE039BdF1d874d27338e09B55CB09879Dedca52D8);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x11E9F019FCC15AccB472Aa49C8fc0c61949c86d5);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA323726989db5708B19EAd4A494dDe09F3cEcc69);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    function getToken(string calldata token) public pure returns(Token memory m) {
              if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("DAI"))) {
                  return Token(
                    0x4aAded56bd7c69861E8654719195fCA9C670EB45,
                    0x0000000000000000000000000000000000000000,
                    0x49866611AA7Dc30130Ac6A0DF29217D16FD87bc0,
                    0x0F48c09701B6D24d6D9571637758EE06eeCb9630
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("LINK"))) {
                  return Token(
                    0x237f409fBD10E30e237d63d9050Ae302e339028E,
                    0x0000000000000000000000000000000000000001,
                    0xeC4752053c5A693eBE6A07deF330a9F97D07FBC3,
                    0x4e63D3ff7Bca937FAD4e1b0e9aF4f946f2AAaE64
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("USDC"))) {
                  return Token(
                    0xb18d016cDD2d9439A19f15633005A6b2cd6Aa774,
                    0x0000000000000000000000000000000000000002,
                    0x50b283C17b0Fc2a36c550A57B1a133459F4391B3,
                    0xee3D33c0C779cAD53CAa496aa5a97D026D1218Ca
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("WBTC"))) {
                  return Token(
                    0x124F70a8a3246F177b0067F435f5691Ee4e467DD,
                    0x0000000000000000000000000000000000000003,
                    0xeC1d8303b8fa33afB59012Fc3b49458B57883326,
                    0x372C35caeED54907d694DF6229319779fbC79440
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("WETH"))) {
                  return Token(
                    0xd74047010D77c5901df5b0f9ca518aED56C85e8D,
                    0x0000000000000000000000000000000000000004,
                    0x608D11E704baFb68CfEB154bF7Fd641120e33aD4,
                    0x7666ca6911bEcBA7d38Fa2da8278b82297EC7e6F
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("USDT"))) {
                  return Token(
                    0x326005cFdF58bfB38650396836BEBF815F5ab4dD,
                    0x0000000000000000000000000000000000000005,
                    0x377D3F732CBeB84D0EebF71e1a4e3546Da86C76d,
                    0xCC28d19D8e8A64D2Fc1709e8FE7b6139e25Fd524
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("AAVE"))) {
                  return Token(
                    0x100aB78E5A565a94f2a191714A7a1B727268eFFb,
                    0x0000000000000000000000000000000000000006,
                    0x3fc92c5f08c361EB21ef86a31d55df4b92ab7874,
                    0x951a8575A0b18A1180D5e8DD0e2e646E235b42bb
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("EURS"))) {
                  return Token(
                    0x7eEB186F13538e6795a0823e2D7283FEeD2738f5,
                    0x0000000000000000000000000000000000000007,
                    0xC6B64D19EeF69071F32b043F8e57e506A86B8612,
                    0xEa7619f4AE50C3a6ad07e8Bd029b937B8D57A2b8
                  );
              } else revert('Token does not exist');
    }
}
