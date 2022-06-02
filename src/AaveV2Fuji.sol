// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Token} from "./AaveV2.sol";

library AaveV2Fuji {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x76cc67FF2CC77821A70ED14321111Ce381C2594D);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x4ceBAFAAcc6Cb26FD90E4cDe138Eb812442bb5f3);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xfa4f5B081632c4709667D467F817C09d9008A46A);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x0668EDE013c1c475724523409b8B6bE633469585);

    address internal constant POOL_ADMIN =
        0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e;

    address internal constant EMERGENCY_ADMIN =
        0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e;

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
                    0x9668f5f55f2712Dd2dfa316256609b516292D554,
                    0x2B2927e26b433D92fC598EE79Fa351d6591B8F95,
                    0x056AaAc3aAf49d00C4fA10bCf9661D2371427ECB,
                    0xB61CC359E2133b8618cc0319F359F8CA1d3d2b33
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("USDT")))
        ) {
            return
                Token(
                    0x02823f9B469960Bb3b1de0B3746D4b95B7E35543,
                    0x5f049c41aF3856cBc171F61FB04D58C1e7445f5F,
                    0x8c5a8eB9dd4e029c1A5B9e740086eB6Cf4Ba7F13,
                    0x6422A7C91A48dD211BF6BdE1Db14d7734f9cbD69
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0x9C1DCacB57ADa1E9e2D3a8280B7cfC7EB936186F,
                    0xD5B516FDbfb7264676Fd4901B9dD3F707db68733,
                    0x38A9d8f89Cf87FD4C50dd7B019b9af30c2540512,
                    0xbd0601970fE5b35649Fb92f292cde21f0f52eAE9
                );
        } else if (
            keccak256(abi.encodePacked((token))) ==
            keccak256(abi.encodePacked(("WAVAX")))
        ) {
            return
                Token(
                    0xd00ae08403B9bbb9124bB305C09058E32C39A48c,
                    0xf8C78Ba24DD965487f4472dfb280c46800a0c9B6,
                    0xE1c2E4E85d34CAed5c29447135c3ADfaD30364f1,
                    0x333f38B8E76077539Cde1d50Fb5dE0AC6F7E6837
                );
        } else revert("Token does not exist");
    }
}
