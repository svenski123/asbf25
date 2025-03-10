// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {deploy_bytecode, get_ctf, Ilevel} from "test/lib/CTF.t.sol";
import {Test, console2} from "forge-std/Test.sol";
import {Isolution4, Level4Template, Level4TemplateYul} from "../src/Lvl4.sol";

contract Lvl4Test is Test {
    Isolution4 lvl4;
    Ilevel ctf;

    function setUp() public {
	ctf = get_ctf(4);
        //lvl4 = new Level4Template();
	//lvl4 = Level4TemplateYul();
	//bytes memory bc = hex"60398060093d393df36004358060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c17805f109060011c015f5260205ff3";
	//bytes memory bc = hex"60388060093d393df3600435805f108060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c1760011c015f5260205ff3";
	//bytes memory bc = hex"60398060093d393df3600435805f10908060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c1760011c015f5260205ff3";
	//bytes memory bc = hex"60398060093d393df36004358060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c178060011c905f10015f5260205ff3";
	//bytes memory bc = hex"60388060093d393df36004358060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c178060011c905f10015f52595ff3";
	//	bytes memory bc = hex"60358060093d393df36004358060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c178060011c185f52595ff3";
	bytes memory bc = hex"60d58060093d393df36004357f80000000000000000000000000000000000000000000000000000000000000001161004f577f80000000000000000000000000000000000000000000000000000000000000005f52595ff35b6004357f40000000000000000000000000000000000000000000000000000000000000001161009f577f40000000000000000000000000000000000000000000000000000000000000005f52595ff35b6004358060011c178060021c178060041c178060081c178060101c178060201c178060401c178060801c178060011c185f52595ff3";
	lvl4 = Isolution4(deploy_bytecode(bc));
    }

    /*
    function test_impl1() public view {
	uint16 a;
	bool b;
	bytes6 c;
	//	(a, b, c) = lvl4.impl1(bytes(hex"1234015566778899aa"));
	(a, b, c) = lvl4.impl1(abi.encodePacked(uint16(0x1234), true, bytes6(hex"5566778899aa")));
	assertEq(a, 0x1234);
	assertEq(b, true);
	assertEq(c, hex"5566778899aa");
    }
    */

    function test_lvl4_0() public view { assertEq(0, lvl4.solution(0)); }
    function test_lvl4_1() public view { assertEq(1, lvl4.solution(1)); }
    function test_lvl4_2() public view { assertEq(2, lvl4.solution(2)); }
    function test_lvl4_3() public view { assertEq(2, lvl4.solution(3)); }

    function test_lvl4_x() public view {
	for (uint i=0; i<256; i++) {
	    uint x = 1<<i;
	    assertEq(x>>1, lvl4.solution(x-1));
	    assertEq(x, lvl4.solution(x));
	    assertEq(x + (i==0?1:0), lvl4.solution(x+1));
	    assertEq(x, lvl4.solution(x-1+x));
	}
    }

    function test_solution() public {
	uint8 a;
	uint256 b;
	(a, b) = ctf.completeLevel(address(lvl4));
	console2.logUint(a);
	console2.logUint(b);
    }
}
