// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {deploy_bytecode, get_ctf, Ilevel} from "test/lib/CTF.t.sol";
import {Test, console2} from "forge-std/Test.sol";
import {Isolution5, Level5Template, Level5TemplateYul} from "../src/Lvl5.sol";

contract Lvl5Test is Test {
    Isolution5 lvl5;
    Ilevel ctf;

    function setUp() public {
	ctf = get_ctf(5);
        //lvl5 = new Level5Template();
	//lvl5 = Level5TemplateYul();
	//bytes memory bc = hex"6024356004358181176001169060011c9160011c01015f5260205ff3";
	//bytes memory bc = hex"601c8060093d393df36024356004358160011c918160011c911760011601015f5260205ff3";
	//	bytes memory bc = hex"601c8060093d393df36024356004358181176001169060011c9160011c01015f5260205ff3";
	//	bytes memory bc = hex"601d8060093d393df360243560011c6004358060011c906024351760011601015f5260205ff3";
	//	bytes memory bc = hex"601b8060093d393df36024358060011c906004358060011c911760011601015f52595ff3";
	//	bytes memory bc = hex"601a600a5f3960245ff338358060011c906004358060011c911760011601015f52595ff3";

	//bytes memory bc = hex"601a600a5f3960245ff36004358060011c383560011c0190383517600116015f52595ff3";
	bytes memory bc = hex"6019600a5f3960245ff36004358060011c38358060011c921760011601015f52595ff3";
	lvl5 = Isolution5(deploy_bytecode(bc));
    }

    /*
    function test_impl1() public view {
	uint16 a;
	bool b;
	bytes6 c;
	//	(a, b, c) = lvl5.impl1(bytes(hex"1234015566778899aa"));
	(a, b, c) = lvl5.impl1(abi.encodePacked(uint16(0x1234), true, bytes6(hex"5566778899aa")));
	assertEq(a, 0x1234);
	assertEq(b, true);
	assertEq(c, hex"5566778899aa");
    }
    */

    function test_lvl5_0() public view {
	int rc = lvl5.solution(7, 7);
	assertEq(7, rc);
    }

    function test_solution() public {
	uint8 a;
	uint256 b;
	(a, b) = ctf.completeLevel(address(lvl5));
	console2.logUint(a);
	console2.logUint(b);
    }
}
