// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import 'forge-std/Test.sol';
import {AaveV2Ethereum} from '../AaveAddressBook.sol';
// imports are unused but required so forge inspect can find the source code
import {IERC20Detailed} from 'aave-v3-origin/contracts/dependencies/openzeppelin/contracts/IERC20Detailed.sol';
import {IWithGuardian} from 'solidity-utils/contracts/access-control/interfaces/IWithGuardian.sol';
import {IStataTokenFactory} from 'aave-v3-origin/contracts/extensions/static-a-token/interfaces/IStataTokenFactory.sol';
import {IStataTokenV2} from 'aave-v3-origin/contracts/extensions/static-a-token/interfaces/IStataTokenV2.sol';

contract AaveAddressBookTest is Test {
  function setUp() public {}

  function testPoolAddressProviderIsCorrect() public pure {
    assertEq(
      address(AaveV2Ethereum.POOL_ADDRESSES_PROVIDER),
      address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5)
    );
  }

  function testPoolAddressIsCorrect() public pure {
    assertEq(address(AaveV2Ethereum.POOL), address(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9));
  }

  function testPoolConfiguratorIsCorrect() public pure {
    assertEq(
      address(AaveV2Ethereum.POOL_CONFIGURATOR),
      address(0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756)
    );
  }

  function testOracleIsCorrect() public pure {
    assertEq(address(AaveV2Ethereum.ORACLE), address(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9));
  }

  function testAaveProtocolDataProviderIsCorrect() public pure {
    assertEq(
      address(AaveV2Ethereum.AAVE_PROTOCOL_DATA_PROVIDER),
      address(0x057835Ad21a177dbdd3090bB1CAE03EaCF78Fc6d)
    );
  }

  function testPoolAdminIsCorrect() public pure {
    assertEq(AaveV2Ethereum.POOL_ADMIN, address(0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A));
  }

  function testEmergencyAdminIsCorrect() public pure {
    assertEq(AaveV2Ethereum.EMERGENCY_ADMIN, address(0x2CFe3ec4d5a6811f4B8067F0DE7e47DfA938Aa30));
  }

  function testCollectorIsCorrect() public pure {
    assertEq(
      address(AaveV2Ethereum.COLLECTOR),
      address(0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c)
    );
  }
}
