// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

contract MainScript is Script {
    function setUp() public {}

    function run() external pure {
	console.log("hi");
	uint y=0x80000000_00000000_00000000_00000000_00000000_00000000_00000000_deadbeef;
	for (uint i=0; i<512; i++) {
	    console.log("SHL:", i, y, uint(int(y)>>i));
	}
    }
}
