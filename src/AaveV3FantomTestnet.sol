// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV3.sol";
import {Token} from "./Common.sol";

library AaveV3FantomTestnet {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xE339D30cBa24C70dCCb82B234589E3C83249e658);

    IPool internal constant POOL =
        IPool(0x771A45a19cE333a19356694C5fc80c76fe9bc741);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x59B84a6C943dD655D9E3B4024fC6AdC0E3f4Ff60);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA840C768f7143495790eC8dc2D5f32B71B6Dc113);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0xCbAcff915f2d10727844ab0f2A4D9768954981e4);

    address internal constant POOL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_ADMIN =
        0x77c45699A715A64A7a7796d5CEe884cf617D5254;

    address internal constant ACL_MANAGER =
        0x94f154aba287b3024fb32386463FC52d488bb09B;

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
                    0xc469ff24046779DE9B61Be7b5DF91dbFfdF1AE02,
                    0xfb08e04E9c7AfFE693290F739d11D5C3Dd2e19B5,
                    0x87d62612a58a806B926a0A1276DF5C9c6DbE8a5e,
                    0x78243313999d4582cfEE48bD5B4466efF6c90fE1
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0x42Dc50EB0d35A62eac61f4E4Bc81875db9F9366e,
                    0x1A7e068f35B19Ff89B7d646D83Ae15C2Db1D93c5,
                    0x475e4C43caE948578685462F17FB7fedB85E3F79,
                    0x57066BC9569260e9dEC8d224BeB9A8a56209Ff64
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0x06f0790c687A1bED6186ce3624EDD9806edf9F4E,
                    0xf1090cB4f56fDb659D24DDbC4972bE9D379A6E8c,
                    0x7e90CE7a0463cc5656c38B5a85C33dF4C8F2523C,
                    0x946765C86B534D8114475BFec8De8De481bA4d1F
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0xd0404A349A76CD2a4B7AB322B9a6C993dbC3A7E7,
                    0xd2ecf7aA363A9dE20088eF1a92D76D4147828B58,
                    0x7e72682d8c90A1eeE1403730f31DCf81551C5aFA,
                    0x68C3E2eb8F2550E13328B4a9cccac65Ba6C200Be
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x2aF63215417F90bd45608115452d86D0a1bEAE5E,
                    0xd29fF48d6Fc110fe227286D5A509a4CB6503732E,
                    0xfD7D3f98aF173B18e5A98fE3b1aE530edab1a988,
                    0x27dF3D6eF22A6aC1c8744Fd7A4516a4C8B22084f
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0x1b901d3C9D4ce153326BEeC60e0D4A2e8a9e3cE3,
                    0x1364B761d75E348B861D7EFaEB64A5b3a37965ec,
                    0xCcE4E4c5327870EfD280645B5a24A50dC01125a4,
                    0x81Ed0a1D00841B68C6F3956E4E210EFaaeBEBAF1
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0x2a6202B83Bd2562d7460F91E9298abC27a2F0a95,
                    0xeCbA9a45fDb849548F3e7a621fcBa4f11b3BBDcF,
                    0x460d55849094CDcc8c9582Cf4B58485C08405Ae7,
                    0xe90400D7D8acdCcC8c335883097A722AB653890D
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("WFTM"))
        ) {
            return
                Token(
                    0xF7475b635EbE06d9C5178CC40D50856Fa98C7332,
                    0x22FDD5F19C49fe954847A6424E4a24C2742fD9EF,
                    0x67196249e5fE6c2f532ff456E342Abf8eE19D4E3,
                    0x812388F32346e99078B987e84f60dA68348Ac665
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("CRV"))
        ) {
            return
                Token(
                    0xAC1a9503D1438B56BAa99939D44555FC2dC286Fc,
                    0x552f5C364090B954ADA025f0D7963D0a7A60d52b,
                    0x48Cf4cA307f321f0FC24bfAe3119f9abF6B32Ff5,
                    0xe4CFEa97831CB0d95CA22597e02dD793bB8f45ae
                );
        } else if (
            keccak256(abi.encodePacked(symbol)) ==
            keccak256(abi.encodePacked("SUSHI"))
        ) {
            return
                Token(
                    0x484b87Aa284f51e71F15Eba1aEb06dFD202D5511,
                    0x6cC739A29b8Eb06981B8bbF22464E4F3f082bBA5,
                    0x5f933d8c8fbc9651f3E6bC0652d94fdd09EA139a,
                    0x5522dFE4b4056BA819D8e675e6999011A31BAf7a
                );
        } else revert("Token does not exist");
    }
}
