// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3HarmonyTestnet {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xd19443202328A66875a51560c28276868B8C61C2
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x85C1F3f1bB439180f7Bfda9DFD61De82e10bD554);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0xdb903B5a28260E87cF1d8B56740a90Dba1c8fe15);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0x29Ff3c19C6853A0b6544b3CC241c360f422aBaD1);
  
      address internal constant POOL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  
      address internal constant EMERGENCY_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  }
    