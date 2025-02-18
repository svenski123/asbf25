// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Array} from "../src/Array.sol";

contract ArrayTest is Test {
    Array public array;

    function logArray() private {
	uint256 n = array.size();
	for (uint256 i=0; i<n; i++) {
	    emit log_uint(array.items(i));
	}
    }

    function setUp() public {
        array = new Array();
    }

    function test_push(uint256 item) public {
        array.push(item);
        assertEq(array.items(array.size()-1), item);
    }

    function test_append() public {
	uint256[4] memory ITEMS = [uint256(1),2,3,4];
	uint256[] memory items = new uint256[](ITEMS.length);
	for (uint256 i=0; i<ITEMS.length; i++) {
	    items[i] = ITEMS[i];
	}
        array.append(items);
	logArray();
	array.remove(1);
	logArray();
    }
    /*
    function testFuzz_SetNumber(uint256 x) public {
        array.setNumber(x);
        assertEq(array.number(), x);
    }
    */
}
