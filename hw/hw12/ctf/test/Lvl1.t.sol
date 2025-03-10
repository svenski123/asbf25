// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {get_ctf, Ilevel} from "test/lib/CTF.t.sol";
import {Test, console2} from "forge-std/Test.sol";
import {Isolution1, Level1Template, Level1TemplateYul} from "../src/Lvl1.sol";

contract Lvl1Test is Test {
    Isolution1 lvl1;
    Ilevel ctf;

    function setUp() public {
        //lvl1 = new Level1Template();
	lvl1 = Level1TemplateYul();
	ctf = get_ctf(1);
    }

    function test0() public view {
	uint256[2][3] memory x = [[uint(1),2],[uint(4),8],[uint(16),32]];
	uint256[2][3] memory y = [[uint(2048),1024],[uint(512),256],[uint(128),64]];
	uint256[2][3] memory z = lvl1.solution(x,y);
	assertEq(z[0][0], 2049);
	assertEq(z[1][0], 516);
	assertEq(z[2][0], 144);
	assertEq(z[0][1], 1026);
	assertEq(z[1][1], 264);
	assertEq(z[2][1], 96);
    }

    function test_solution() public {
	uint8 a;
	uint256 b;
	(a, b) = ctf.completeLevel(address(lvl1));
	console2.logUint(a);
	console2.logUint(b);
    }
}
