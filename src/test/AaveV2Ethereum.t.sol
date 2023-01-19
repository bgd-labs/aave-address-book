// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import 'forge-std/Test.sol';
import {AaveV2Ethereum} from '../AaveAddressBook.sol';

contract AaveAddressBookTest is Test {
  function setUp() public {}

  function testPoolAddressProviderIsCorrect() public {
    assertEq(
      address(AaveV2Ethereum.POOL_ADDRESSES_PROVIDER),
      address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5)
    );
  }

  function testPoolAddressIsCorrect() public {
    assertEq(address(AaveV2Ethereum.POOL), address(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9));
  }

  function testPoolConfiguratorIsCorrect() public {
    assertEq(
      address(AaveV2Ethereum.POOL_CONFIGURATOR),
      address(0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756)
    );
  }

  function testOracleIsCorrect() public {
    assertEq(address(AaveV2Ethereum.ORACLE), address(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9));
  }

  function testAaveProtocolDataProviderIsCorrect() public {
    assertEq(
      address(AaveV2Ethereum.AAVE_PROTOCOL_DATA_PROVIDER),
      address(0x057835Ad21a177dbdd3090bB1CAE03EaCF78Fc6d)
    );
  }

  function testPoolAdminIsCorrect() public {
    assertEq(AaveV2Ethereum.POOL_ADMIN, address(0xEE56e2B3D491590B5b31738cC34d5232F378a8D5));
  }

  function testEmergencyAdminIsCorrect() public {
    assertEq(AaveV2Ethereum.EMERGENCY_ADMIN, address(0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633));
  }

  function testCollectorIsCorrect() public {
    assertEq(AaveV2Ethereum.COLLECTOR, address(0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c));
  }

  function testCollectorControllerIsCorrect() public {
    assertEq(
      AaveV2Ethereum.COLLECTOR_CONTROLLER,
      address(0x3d569673dAa0575c936c7c67c4E6AedA69CC630C)
    );
  }
}
