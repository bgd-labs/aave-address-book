// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3Arbitrum {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xb56c2F0B653B2e0b10C9b928C8580Ac5Df02C7C7);
  
      address internal constant POOL_ADMIN =
          0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb;
  
      address internal constant EMERGENCY_ADMIN =
          0xbbd9f90699c1FA0D7A65870D241DD1f1217c96Eb;
  }
    