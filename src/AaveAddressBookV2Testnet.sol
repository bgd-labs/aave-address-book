// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Market, Token} from "./AaveV2.sol";

library AaveAddressBookV2Testnet {
    string public constant AaveV2Mumbai = "AaveV2Mumbai";
    string public constant AaveV2Fuji = "AaveV2Fuji";

    function getMarket(string calldata market)
        public
        pure
        returns (Market memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Mumbai))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0x178113104fEcbcD7fF8669a0150721e231F0FD4B
                    ),
                    ILendingPool(0x9198F13B08E299d85E096929fA9781A1E3d5d827),
                    ILendingPoolConfigurator(
                        0xc3c37E2aA3dc66464fa3C29ce2a6EC85beFC45e1
                    ),
                    IAaveOracle(0xC365C653f7229894F93994CD0b30947Ab69Ff1D5),
                    IAaveProtocolDataProvider(
                        0xFA3bD19110d986c5e5E9DD5F69362d05035D045B
                    ),
                    0x943E44157dC0302a5CEb172374d1749018a00994,
                    0x943E44157dC0302a5CEb172374d1749018a00994
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Fuji))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f
                    ),
                    ILendingPool(0x76cc67FF2CC77821A70ED14321111Ce381C2594D),
                    ILendingPoolConfigurator(
                        0x4ceBAFAAcc6Cb26FD90E4cDe138Eb812442bb5f3
                    ),
                    IAaveOracle(0xfa4f5B081632c4709667D467F817C09d9008A46A),
                    IAaveProtocolDataProvider(
                        0x0668EDE013c1c475724523409b8B6bE633469585
                    ),
                    0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e,
                    0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e
                );
        } else revert("Market does not exist");
    }

    function getToken(string calldata market, string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Mumbai))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("DAI"))
            ) {
                return
                    Token(
                        0x001B3B4d0F3714Ca98ba10F6042DaEbF0B1B7b6F,
                        0x639cB7b21ee2161DF9c882483C9D55c90c20Ca3e,
                        0x10dec6dF64d0ebD271c8AdD492Af4F5594358919,
                        0x6D29322ba6549B95e98E9B08033F5ffb857f19c5
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDC"))
            ) {
                return
                    Token(
                        0x2058A9D7613eEE744279e3856Ef0eAda5FCbaA7e,
                        0x2271e3Fef9e15046d09E1d78a8FF038c691E9Cf9,
                        0x83A7bC369cFd55D9F00267318b6D221fb9Fa739F,
                        0x05771A896327ee702F965FB6E4A35A9A57C84a2a
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0xBD21A10F619BE90d6066c941b04e340841F1F989,
                        0xF8744C0bD8C7adeA522d6DDE2298b17284A79D1b,
                        0xdD250d4e7ff5f7414F3EBe8fcBbB13583191BDaC,
                        0x6C0a86573a63672D8a66C037036e441A59086d68
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x0d787a4a1548f673ed375445535a6c7A1EE56180,
                        0xc9276ECa6798A14f64eC33a526b547DAd50bDa2F,
                        0x29A36d45e8d9f446EC9529b28907bc850B398154,
                        0xc156967272b7177DcE40E3b3E7c4269f750F3160
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x3C68CE8504087f89c640D02d133646d98e64ddd9,
                        0x7aE20397Ca327721F013BB9e140C707F82871b56,
                        0x35D88812d32b966da90db9F546fbf43553C4F35b,
                        0x0F2656e068b77cdA65213Ef25705B728d5C73340
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WMATIC"))
            ) {
                return
                    Token(
                        0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889,
                        0xF45444171435d0aCB08a8af493837eF18e86EE27,
                        0xfeedbD76ac61616f270911CCaBb43a36380f40ae,
                        0x11b884339E453E3d66A8E22246782D40E62cB5F2
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("AAVE"))
            ) {
                return
                    Token(
                        0x341d1f30e77D3FBfbD43D17183E2acb9dF25574E,
                        0x7ec62b6fC19174255335C8f4346E0C2fcf870a6B,
                        0x14bD9790e15294608Df4160dcF45B64adBFdCBaA,
                        0x5A6659794E3Fe10eee90833B36a4819953AaB9A1
                    );
            } else revert("Token does not exist");
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Fuji))
        ) {
            if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WETH"))
            ) {
                return
                    Token(
                        0x9668f5f55f2712Dd2dfa316256609b516292D554,
                        0x2B2927e26b433D92fC598EE79Fa351d6591B8F95,
                        0x056AaAc3aAf49d00C4fA10bCf9661D2371427ECB,
                        0xB61CC359E2133b8618cc0319F359F8CA1d3d2b33
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("USDT"))
            ) {
                return
                    Token(
                        0x02823f9B469960Bb3b1de0B3746D4b95B7E35543,
                        0x5f049c41aF3856cBc171F61FB04D58C1e7445f5F,
                        0x8c5a8eB9dd4e029c1A5B9e740086eB6Cf4Ba7F13,
                        0x6422A7C91A48dD211BF6BdE1Db14d7734f9cbD69
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WBTC"))
            ) {
                return
                    Token(
                        0x9C1DCacB57ADa1E9e2D3a8280B7cfC7EB936186F,
                        0xD5B516FDbfb7264676Fd4901B9dD3F707db68733,
                        0x38A9d8f89Cf87FD4C50dd7B019b9af30c2540512,
                        0xbd0601970fE5b35649Fb92f292cde21f0f52eAE9
                    );
            } else if (
                keccak256(abi.encodePacked(symbol)) ==
                keccak256(abi.encodePacked("WAVAX"))
            ) {
                return
                    Token(
                        0xd00ae08403B9bbb9124bB305C09058E32C39A48c,
                        0xf8C78Ba24DD965487f4472dfb280c46800a0c9B6,
                        0xE1c2E4E85d34CAed5c29447135c3ADfaD30364f1,
                        0x333f38B8E76077539Cde1d50Fb5dE0AC6F7E6837
                    );
            } else revert("Token does not exist");
        } else revert("Market does not exist");
    }
}
