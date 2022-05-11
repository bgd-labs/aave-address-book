// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3Fantom {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xfd6f3c1845604C8AE6c6E402ad17fb9885160754);
  
      address internal constant POOL_ADMIN =
          0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949;
  
      address internal constant EMERGENCY_ADMIN =
          0x39CB97b105173b56b5a2b4b33AD25d6a50E6c949;
  }
    