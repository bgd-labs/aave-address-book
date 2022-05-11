// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3Avalanche {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C);
  
      address internal constant POOL_ADMIN =
          0xa35b76E4935449E33C56aB24b23fcd3246f13470;
  
      address internal constant EMERGENCY_ADMIN =
          0xa35b76E4935449E33C56aB24b23fcd3246f13470;
  }
    