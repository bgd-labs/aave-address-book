// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import "forge-std/Test.sol";
import {AaveV3Arbitrum} from "../AaveV3Arbitrum.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(address(AaveV3Arbitrum.POOL_ADDRESSES_PROVIDER), address(0));
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(AaveV3Arbitrum.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(AaveV3Arbitrum.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(AaveV3Arbitrum.ORACLE), address(0));
    }

    function testFailPoolAdminIs0Address() public {
        assertEq(AaveV3Arbitrum.POOL_ADMIN, address(0));
    }

    function testFailACLAdminIs0Address() public {
        assertEq(AaveV3Arbitrum.ACL_ADMIN, address(0));
    }
}
