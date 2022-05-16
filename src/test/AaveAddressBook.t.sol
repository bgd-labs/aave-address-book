// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {AaveV2Eth} from "../AaveAddressBook.sol";

contract AaveAddressBookTest is Test {
    function setUp() public {}

    function testOne() public {
        console.log(AaveV2Eth.EMERGENCY_ADMIN);
    }
}
