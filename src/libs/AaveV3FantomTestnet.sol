// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3FantomTestnet {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xE339D30cBa24C70dCCb82B234589E3C83249e658
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x771A45a19cE333a19356694C5fc80c76fe9bc741);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x59B84a6C943dD655D9E3B4024fC6AdC0E3f4Ff60);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xA840C768f7143495790eC8dc2D5f32B71B6Dc113);
  
      address internal constant POOL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  
      address internal constant EMERGENCY_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  }
    