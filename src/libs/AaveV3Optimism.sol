// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3Optimism {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xD81eb3728a631871a7eBBaD631b5f424909f0c77);
  
      address internal constant POOL_ADMIN =
          0xE50c8C619d05ff98b22Adf991F17602C774F785c;
  
      address internal constant EMERGENCY_ADMIN =
          0xE50c8C619d05ff98b22Adf991F17602C774F785c;
  }
    