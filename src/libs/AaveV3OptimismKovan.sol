// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";
  
  
  library AaveV3OptimismKovan {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              0xD15d36975A0200D11B8a8964F4F267982D2a1cFe
          );
  
      ILendingPool internal constant POOL =
          ILendingPool(0x139d8F557f70D1903787e929D7C42165c4667229);
  
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(0x12F6E19b968e34fEE34763469c7EAf902Af6914B);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0xce87225e5A0ABFe6241C6A60158840d509a84B47);
  
      address internal constant POOL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  
      address internal constant EMERGENCY_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  }
    