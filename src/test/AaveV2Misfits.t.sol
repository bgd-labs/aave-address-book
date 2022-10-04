// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import 'forge-std/Test.sol';
import {AaveV2Avalanche, AaveV2Polygon, AaveV2EthereumArc} from '../AaveAddressBook.sol';

/**
 * @dev This test contains regression tests for markets that are slightly different then the default.
 */
contract AaveAddressMisfitsTest is Test {
  function setUp() public {}

  /**
   * @dev Only the v2 ethereum market has the new treasury version.
   * To maintain interface compatibility the address-book contains 0 addresses for networks where it doesn't yet exist.
   */
  function testCollectorControllerIs0Address() public {
    assertEq(address(AaveV2Avalanche.COLLECTOR_CONTROLLER), address(0));
  }

  /**
   * @dev This test tests against a bug that got visible after adding arc market.
   * The arc is the only market where owner != POOL_ADMIN right now.
   * So this test ensures we actually use the pool admin.
   */
  function testArcPoolAdminIsCorrect() public {
    assertEq(
      address(AaveV2EthereumArc.POOL_ADMIN),
      address(0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218)
    );
  }
}
