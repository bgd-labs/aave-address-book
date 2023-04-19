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
