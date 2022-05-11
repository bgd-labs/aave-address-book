// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3Fuji {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0x1775ECC8362dB6CaB0c7A9C0957cF656A5276c29
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0xb47673b7a73D78743AFF1487AF69dBB5763F00cA);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x01743372F0F0318AaDF690f960A4c6c4eab58782);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xAc6D153BF94aFBdC296e72163735B0f94581F736);
  
      address internal constant POOL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  
      address internal constant EMERGENCY_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  }
    