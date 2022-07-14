// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveV2EthereumArc {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0x6FdfafB66d39cD72CFE7984D3Bbcc76632faAb00
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x37D7306019a38Af123e4b245Eb6C28AF552e0bB0);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x4e1c7865e7BE78A7748724Fa0409e88dc14E67aA);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xB8a7bc0d13B1f5460513040a97F404b4fea7D2f3);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x71B53fC437cCD988b1b89B1D4605c3c3d0C810ea);

    address internal constant POOL_ADMIN =
        0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218;

    address internal constant EMERGENCY_ADMIN =
        0x33B09130b035d6D7e57d76fEa0873d9545FA7557;

    address internal constant COLLECTOR =
        0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c;

    address internal constant COLLECTOR_CONTROLLER = address(0);

    function getToken(string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDC")))
        ) {
            return
                Token(
                    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
                    0xd35f648C3C7f17cd1Ba92e5eac991E3EfcD4566d,
                    0x2a278CDA70D2Fa3eC52B50D9cB84a309CE13A308,
                    0xe8D876034F96081063cD57Cd87b94a156b4E03E1
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599,
                    0xe6d6E7dA65A2C18109Ff56B7CBBdc7B706Fc13F8,
                    0x8975Aa9d57a40796001Ae98d8C54336cA7Ebe7f1,
                    0xc371FB4513c23Fc962fe23B12cFBD75E1D37ED91
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WETH")))
        ) {
            return
                Token(
                    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
                    0x319190E3Bbc595602A9E63B2bCfB61c6634355b1,
                    0x1c2921BA94b8C15daa8458905460B70e41127296,
                    0x932167279A4ed3b879bA7eDdC85Aa83551f3989D
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("AAVE")))
        ) {
            return
                Token(
                    0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9,
                    0x89eFaC495C65d43619c661df654ec64fc10C0A75,
                    0x5166F949e8658d743D5b9fb1c5c61CDFd6398058,
                    0x0ac4c7790BC96923b71BfCee44a6923fd085E0c8
                );
        } else revert("Token does not exist");
    }
}
