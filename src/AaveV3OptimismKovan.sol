// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Token} from "./AaveV3.sol";

library AaveV3OptimismKovan {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xD15d36975A0200D11B8a8964F4F267982D2a1cFe);

    IPool internal constant POOL =
        IPool(0x139d8F557f70D1903787e929D7C42165c4667229);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x12F6E19b968e34fEE34763469c7EAf902Af6914B);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xce87225e5A0ABFe6241C6A60158840d509a84B47);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x2f733c0389bfF96a3f930Deb2f6DB1d767Cd3215);

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
                    0xd6B095c27bDf158C462AaB8Cb947BdA9351C0e1d,
                    0x0000000000000000000000000000000000000000,
                    0x4cdb5D85687Fa162446c7Cf263f9be9614E6314B,
                    0xF7f1a6f7A614b12F2f3bcc8a2e0952B2c6bF283d
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("LINK"))
        ) {
            return
                Token(
                    0xFbBCcCCA95b5F676D8f044Ec75e7eA5899280efF,
                    0x0000000000000000000000000000000000000001,
                    0x70713F22F01f0053803F1520d526a2C7b26b318a,
                    0x2074341b6880f6B7FC4f3B2B3B15ef91712182E6
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("USDC"))
        ) {
            return
                Token(
                    0x9cCc44Aa7C301b6655ec9891BdaD20fa6eb2b552,
                    0x0000000000000000000000000000000000000002,
                    0x0849Cd326DC590bF313a0b1E5a04790CBb4eE387,
                    0xE953b08a7908921e179187bAf7dFb4e36f9b40CA
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WBTC"))
        ) {
            return
                Token(
                    0xfF5b900f020d663719EEE1731C21778632e6C424,
                    0x0000000000000000000000000000000000000003,
                    0x2D89bE7Cfbe21ed728A5AeDdA03cACFCAf04aA08,
                    0x4c9D6192E7920b2C56400aBFa8909EC7A572a315
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("WETH"))
        ) {
            return
                Token(
                    0x46e213C62d4734C64986879af00eEc5128395776,
                    0x0000000000000000000000000000000000000004,
                    0xCb5Df0b49BCa05B2478a606074ec39e3fa181a6f,
                    0x52B61cD2CbC22A386a8F5d2Cec685e938A0379BB
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("USDT"))
        ) {
            return
                Token(
                    0xeE6b5ad81c7d88a632b24Bcdac055D6f5F469495,
                    0x0000000000000000000000000000000000000005,
                    0x98A978662670A35cA2b4aD12319486a3F294a78b,
                    0x1b187f0e91934c94aFb324cD9cd03FBa0C7a8B71
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("AAVE"))
        ) {
            return
                Token(
                    0xb532118d86765Eb544958e47df77bb8bDDe2F096,
                    0x0000000000000000000000000000000000000006,
                    0x5994ce8E7F595AFE3115D72854e0EAeCbD902ea7,
                    0xBe7c6a35A2932411A379081a745bcb99d83574EC
                );
        } else if (
            keccak256(abi.encodePacked(token)) ==
            keccak256(abi.encodePacked("SUSD"))
        ) {
            return
                Token(
                    0x6883D765088f90bAE62048dE45f2202D72985B01,
                    0x0000000000000000000000000000000000000007,
                    0xE603E221fa3a858BdAE91FB51cE09BA6C53B19A5,
                    0xF864A79eE389859A33DA2CDec69fb1d723dB319B
                );
        } else revert("Token does not exist");
    }
}
