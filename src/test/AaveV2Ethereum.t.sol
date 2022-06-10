// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import "forge-std/Test.sol";
  import {AaveV2Ethereum} from "../AaveAddressBook.sol";
  
  contract AaveAddressBookTest is Test {
      function setUp() public {}
  
      function testFailPoolAddressProviderIs0Address() public {
          assertEq(address(AaveV2Ethereum.POOL_ADDRESSES_PROVIDER), address(0));
      }
  
      function testFailPoolAddressIs0Address() public {
          assertEq(address(AaveV2Ethereum.POOL), address(0));
      }
  
      function testFailPoolConfiguratorIs0Address() public {
          assertEq(address(AaveV2Ethereum.POOL_CONFIGURATOR), address(0));
      }
  
      function testFailOracleIs0Address() public {
          assertEq(address(AaveV2Ethereum.ORACLE), address(0));
      }
  
      function testFailPoolAdminIs0Address() public {
          assertEq(AaveV2Ethereum.POOL_ADMIN, address(0));
      }
  
      function testFailEmergencyAdminIs0Address() public {
          assertEq(AaveV2Ethereum.EMERGENCY_ADMIN, address(0));
      }
  }
