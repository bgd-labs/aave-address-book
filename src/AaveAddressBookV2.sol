// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveAddressBookV2 {
    string public constant AaveV2Ethereum = "AaveV2Ethereum";
    string public constant AaveV2EthereumAMM = "AaveV2EthereumAMM";
    string public constant AaveV2EthereumArc = "AaveV2EthereumArc";
    string public constant AaveV2Polygon = "AaveV2Polygon";
    string public constant AaveV2Avalanche = "AaveV2Avalanche";

    struct Market {
        ILendingPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        ILendingPool POOL;
        ILendingPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider AAVE_PROTOCOL_DATA_PROVIDER;
        address POOL_ADMIN;
        address EMERGENCY_ADMIN;
        address COLLECTOR;
        address COLLECTOR_CONTROLLER;
    }

    function getMarket(string calldata market)
        public
        pure
        returns (Market memory m)
    {
        if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Ethereum))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5
                    ),
                    ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9),
                    ILendingPoolConfigurator(
                        0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756
                    ),
                    IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9),
                    IAaveProtocolDataProvider(
                        0x057835Ad21a177dbdd3090bB1CAE03EaCF78Fc6d
                    ),
                    0xEE56e2B3D491590B5b31738cC34d5232F378a8D5,
                    0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633,
                    0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c,
                    0x3d569673dAa0575c936c7c67c4E6AedA69CC630C
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2EthereumAMM))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5
                    ),
                    ILendingPool(0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB),
                    ILendingPoolConfigurator(
                        0x23A875eDe3F1030138701683e42E9b16A7F87768
                    ),
                    IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9),
                    IAaveProtocolDataProvider(
                        0x0000000000000000000000000000000000000000
                    ),
                    0xEE56e2B3D491590B5b31738cC34d5232F378a8D5,
                    0xB9062896ec3A615a4e4444DF183F0531a77218AE,
                    0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c,
                    0x3d569673dAa0575c936c7c67c4E6AedA69CC630C
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2EthereumArc))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0x6FdfafB66d39cD72CFE7984D3Bbcc76632faAb00
                    ),
                    ILendingPool(0x37D7306019a38Af123e4b245Eb6C28AF552e0bB0),
                    ILendingPoolConfigurator(
                        0x4e1c7865e7BE78A7748724Fa0409e88dc14E67aA
                    ),
                    IAaveOracle(0xB8a7bc0d13B1f5460513040a97F404b4fea7D2f3),
                    IAaveProtocolDataProvider(
                        0x71B53fC437cCD988b1b89B1D4605c3c3d0C810ea
                    ),
                    0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218,
                    0x33B09130b035d6D7e57d76fEa0873d9545FA7557,
                    0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c,
                    0x3d569673dAa0575c936c7c67c4E6AedA69CC630C
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Polygon))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xd05e3E715d945B59290df0ae8eF85c1BdB684744
                    ),
                    ILendingPool(0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf),
                    ILendingPoolConfigurator(
                        0x26db2B833021583566323E3b8985999981b9F1F3
                    ),
                    IAaveOracle(0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d),
                    IAaveProtocolDataProvider(
                        0x7551b5D2763519d4e37e8B81929D336De671d46d
                    ),
                    0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772,
                    0x1450F2898D6bA2710C98BE9CAF3041330eD5ae58,
                    0x7734280A4337F37Fbf4651073Db7c28C80B339e9,
                    0xDB89487A449274478e984665b8692AfC67459deF
                );
        } else if (
            keccak256(abi.encodePacked(market)) ==
            keccak256(abi.encodePacked(AaveV2Avalanche))
        ) {
            return
                Market(
                    ILendingPoolAddressesProvider(
                        0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
                    ),
                    ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C),
                    ILendingPoolConfigurator(
                        0x230B618aD4C475393A7239aE03630042281BD86e
                    ),
                    IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89),
                    IAaveProtocolDataProvider(
                        0x65285E9dfab318f57051ab2b139ccCf232945451
                    ),
                    0x01244E7842254e3FD229CD263472076B1439D1Cd,
                    0x01244E7842254e3FD229CD263472076B1439D1Cd,
                    0x467b92aF281d14cB6809913AD016a607b5ba8A36,
                    address(0)
                );
        } else revert("Market does not exist");
    }
}
