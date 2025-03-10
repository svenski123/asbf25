// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {deploy_bytecode, get_ctf, Ilevel} from "test/lib/CTF.t.sol";
import {Test, console2} from "forge-std/Test.sol";
import {Isolution3, Level3Template, Level3TemplateYul} from "../src/Lvl3.sol";

contract Lvl3Test is Test {
    //Isolution2 public lvl3;
    Isolution3 public lvl3;
    Ilevel ctf;

    function setUp() public {
	ctf = get_ctf(3);
        //lvl3 = new Level3Template();
	//lvl3 = Level3TemplateYul();
	bytes memory bc = hex"600f600a5f39601e5ff3600758604438376046603f37595ff3";
	lvl3 = Isolution3(deploy_bytecode(bc));
    }

    /*
    function test_impl1() public view {
	uint16 a;
	bool b;
	bytes6 c;
	//	(a, b, c) = lvl3.impl1(bytes(hex"1234015566778899aa"));
	(a, b, c) = lvl3.impl1(abi.encodePacked(uint16(0x1234), true, bytes6(hex"5566778899aa")));
	assertEq(a, 0x1234);
	assertEq(b, true);
	assertEq(c, hex"5566778899aa");
    }
    */

    function test0() public view {
	uint16 a;
	bool b;
	bytes6 c;
	//	(a, b, c) = lvl3.impl1(bytes(hex"1234015566778899aa"));
	(a, b, c) = lvl3.solution(abi.encodePacked(uint16(0x1234), true, bytes6(hex"5566778899aa")));
	assertEq(a, 0x1234);
	assertEq(b, true);
	assertEq(c, hex"5566778899aa");
    }
    
    function test_solution() public {
	uint8 a;
	uint256 b;
	(a, b) = ctf.completeLevel(address(lvl3));
	console2.logUint(a);
	console2.logUint(b);
    }
}
