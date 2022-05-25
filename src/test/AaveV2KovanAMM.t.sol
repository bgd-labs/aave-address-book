// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {AaveV2KovanAMM} from "../libs/AaveV2KovanAMM.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testFailPoolAddressProviderIs0Address() public {
        assertEq(address(AaveV2KovanAMM.POOL_ADDRESSES_PROVIDER), address(0));
    }

    function testFailPoolAddressIs0Address() public {
        assertEq(address(AaveV2KovanAMM.POOL), address(0));
    }

    function testFailPoolConfiguratorIs0Address() public {
        assertEq(address(AaveV2KovanAMM.POOL_CONFIGURATOR), address(0));
    }

    function testFailOracleIs0Address() public {
        assertEq(address(AaveV2KovanAMM.ORACLE), address(0));
    }

    function testFailPoolAdminIs0Address() public {
        assertEq(AaveV2KovanAMM.POOL_ADMIN, address(0));
    }

    function testFailEmergencyAdminIs0Address() public {
        assertEq(AaveV2KovanAMM.EMERGENCY_ADMIN, address(0));
    }
}
