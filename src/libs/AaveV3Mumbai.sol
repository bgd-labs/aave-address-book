// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3Mumbai {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0x5343b5bA672Ae99d627A1C87866b8E53F47Db2E6
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x6C9fB0D5bD9429eb9Cd96B85B81d872281771E6B);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x7b47e727eC539CB74A744ae5259ef26743294fca);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0x520D14AE678b41067f029Ad770E2870F85E76588);
  
      address internal constant POOL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  
      address internal constant EMERGENCY_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  }
    