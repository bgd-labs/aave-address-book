// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from './AaveV2.sol';

library AaveV2Avalanche {
  ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    ILendingPoolAddressesProvider(0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f);

  ILendingPool internal constant POOL = ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C);

  ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
    ILendingPoolConfigurator(0x230B618aD4C475393A7239aE03630042281BD86e);

  IAaveOracle internal constant ORACLE = IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89);

  IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IAaveProtocolDataProvider(0x65285E9dfab318f57051ab2b139ccCf232945451);

  address internal constant POOL_ADMIN = 0x01244E7842254e3FD229CD263472076B1439D1Cd;

  address internal constant EMERGENCY_ADMIN = 0x01244E7842254e3FD229CD263472076B1439D1Cd;

  address internal constant COLLECTOR = 0x467b92aF281d14cB6809913AD016a607b5ba8A36;

  address internal constant COLLECTOR_CONTROLLER = address(0);

  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x4235E22d9C3f28DCDA82b58276cb6370B01265C2;

  address internal constant WETH_GATEWAY = 0xC27d4dBefc2C0CE57916a699971b58a3BD9C7d5b;

  address internal constant SWAP_COLLATERAL_ADAPTER = 0x2EcF2a2e74B19Aab2a62312167aFF4B78E93B6C5;

  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x935b362EE3E1f342cc48118C528AAbee5118F6e6;

  address internal constant MIGRATION_HELPER = 0xf50a080aC535e531EC33cC05b227E910De2fb1fA;

  address internal constant WALLET_BALANCE_PROVIDER = 0x73e4898a1Bfa9f710B6A6AB516403A6299e01fc6;

  address internal constant UI_POOL_DATA_PROVIDER = 0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x11979886A6dBAE27D7a72c49fCF3F23240D647bF;
}
