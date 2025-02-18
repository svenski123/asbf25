// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Array} from "../src/Array.sol";

contract ArrayScript is Script {
    Array public array;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        array = new Array();

        vm.stopBroadcast();
    }
}
