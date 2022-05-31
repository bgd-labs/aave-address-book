// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";


library AaveV2Avalanche {
    struct Token {
        address aTokenAddress;
        address stableDebtTokenAddress;
        address variableDebtTokenAddress;
    }

    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x230B618aD4C475393A7239aE03630042281BD86e);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89);

    address internal constant POOL_ADMIN =
        0x01244E7842254e3FD229CD263472076B1439D1Cd;

    address internal constant EMERGENCY_ADMIN =
        0x01244E7842254e3FD229CD263472076B1439D1Cd;

    function getTokens(address underlyingAsset) public pure returns(Token memory t) {
        if(underlyingAsset == 0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39) {
            return Token(0x0Ca2e42e8c21954af73Bc9af1213E4e81D6a669A,0x9fb7F546E60DDFaA242CAeF146FA2f4172088117,0xCC71e4A38c974e19bdBC6C0C19b63b8520b1Bb09);
        } else revert('Token does not exist');
    }
}
