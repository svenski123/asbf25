// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import {deploy_bytecode, get_ctf, Ilevel} from "test/lib/CTF.t.sol";
import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "src/Lvl0.sol";

contract Lvl0Test is Test {
    Isolution0 lvl0;
    Ilevel ctf;

    function setUp() public {
	ctf = get_ctf(0);
	if (false) {
	    lvl0 = new Lvl0();
	} else {
	    bytes memory payload = hex"6006600a5f39602a5ff3385f52595ff3";
	    lvl0 = Lvl0(deploy_bytecode(payload));
	}
    }

    function test0() public view {
        uint8 rc = lvl0.solution();
        console2.logUint(rc);
        assertEq(42, rc);
    }

    function test_solution() public {
	uint8 a;
	uint256 b;
	(a, b) = ctf.completeLevel(address(lvl0));
	console2.logUint(a);
	console2.logUint(b);
    }
}
