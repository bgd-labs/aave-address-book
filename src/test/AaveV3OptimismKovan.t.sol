// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import "forge-std/Test.sol";
import {AaveV3OptimismKovan} from "../AaveAddressBook.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(
            address(AaveV3OptimismKovan.POOL_ADDRESSES_PROVIDER),
            address(0)
        );
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(AaveV3OptimismKovan.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(AaveV3OptimismKovan.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(AaveV3OptimismKovan.ORACLE), address(0));
    }

    function testFailACLAdminIs0Address() public {
        assertEq(AaveV3OptimismKovan.ACL_ADMIN, address(0));
    }
}
