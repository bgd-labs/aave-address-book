// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import 'forge-std/Test.sol';
import {AaveV3Avalanche} from '../AaveAddressBook.sol';
import {IAaveProtocolDataProvider, IPoolDataProvider, IDefaultInterestRateStrategy} from '../AaveV3.sol';

contract AaveAddressBookTest is Test {
  function setUp() public {}

  function testPoolAddressProviderIsCorrect() public {
    assertEq(
      address(AaveV3Avalanche.POOL_ADDRESSES_PROVIDER),
      address(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb)
    );
  }

  function testPoolAddressIsCorrect() public {
    assertEq(address(AaveV3Avalanche.POOL), address(0x794a61358D6845594F94dc1DB02A252b5b4814aD));
  }

  function testPoolConfiguratorIsCorrect() public {
    assertEq(
      address(AaveV3Avalanche.POOL_CONFIGURATOR),
      address(0x8145eddDf43f50276641b55bd3AD95944510021E)
    );
  }

  function testOracleIsCorrect() public {
    assertEq(address(AaveV3Avalanche.ORACLE), address(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C));
  }

  function testACLManagerIsCorrect() public {
    assertEq(
      address(AaveV3Avalanche.ACL_MANAGER),
      address(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B)
    );
  }

  function testACLAdminIsCorrect() public {
    assertEq(AaveV3Avalanche.ACL_ADMIN, address(0xa35b76E4935449E33C56aB24b23fcd3246f13470));
  }

  function testCollectorIsCorrect() public {
    assertEq(AaveV3Avalanche.COLLECTOR, address(0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0));
  }

  function testCollectorControllerIsCorrect() public {
    assertEq(
      address(AaveV3Avalanche.COLLECTOR_CONTROLLER),
      address(0xaCbE7d574EF8dC39435577eb638167Aca74F79f0)
    );
  }

  function testEmissionManagerIsCorrect() public {
    assertEq(
      address(AaveV3Avalanche.EMISSION_MANAGER),
      address(0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73)
    );
  }
}
