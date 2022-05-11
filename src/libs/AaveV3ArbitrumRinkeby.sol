// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;
  
  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle} from "./AaveV3.sol";
  
  
  library AaveV3ArbitrumRinkeby {
      IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          IPoolAddressesProvider(
              0xF7158D1412Bdc8EAfc6BF97DB4e2178379c9521c
          );
  
      IPool internal constant POOL =
          IPool(0x9C55a3C34de5fd46004Fa44a55490108f7cE388F);
  
      IPoolConfigurator internal constant POOL_CONFIGURATOR =
          IPoolConfigurator(0xCf7e77c25e04d5F44AA20C505fbda04BFCF60c0b);
  
      IAaveOracle internal constant ORACLE =
          IAaveOracle(0x2560A04c24E8870bB12eE7A9E2DcC4186362F3A1);
  
      address internal constant POOL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  
      address internal constant ACL_ADMIN =
          0x77c45699A715A64A7a7796d5CEe884cf617D5254;
  }
    