// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import "forge-std/Test.sol";
import {AaveV3Mumbai} from "../libs/AaveV3Mumbai.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(address(AaveV3Mumbai.POOL_ADDRESSES_PROVIDER), address(0));
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(AaveV3Mumbai.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(AaveV3Mumbai.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(AaveV3Mumbai.ORACLE), address(0));
    }

    function testFailPoolAdminIs0Address() public {
        assertEq(AaveV3Mumbai.POOL_ADMIN, address(0));
    }

    function testFailACLAdminIs0Address() public {
        assertEq(AaveV3Mumbai.ACL_ADMIN, address(0));
    }
}
