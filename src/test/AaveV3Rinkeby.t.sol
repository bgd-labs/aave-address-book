// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import "forge-std/Test.sol";
import {AaveV3Rinkeby} from "../libs/AaveV3Rinkeby.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(address(AaveV3Rinkeby.POOL_ADDRESSES_PROVIDER), address(0));
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(AaveV3Rinkeby.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(AaveV3Rinkeby.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(AaveV3Rinkeby.ORACLE), address(0));
    }

    function testFailPoolAdminIs0Address() public {
        assertEq(AaveV3Rinkeby.POOL_ADMIN, address(0));
    }

    function testFailACLAdminIs0Address() public {
        assertEq(AaveV3Rinkeby.ACL_ADMIN, address(0));
    }
}
