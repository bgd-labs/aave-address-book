// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {BaseTest, console} from "./base/BaseTest.sol";
import {AaveV2Eth} from "../AaveAddressBook.sol";

contract AddressBookTest is BaseTest {
    function setUp() public {}

    function testOne() public {
        console.log(AaveV2Eth.EMERGENCY_ADMIN);
    }
}
