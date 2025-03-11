// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Main} from "../src/Main.sol";

uint256 constant beValue = 86177475670493197073919501659849812897660611100807883281033508768520888346190;
uint256 constant deValue = 100651486825157721501865874785935801379319359184012953785965706769510029551182;
uint256 constant aaValue = 0xaa21501865874785935801379319359184012953785965706769510029551182;

contract MainTest is Test {
    Main public main;

    function setUp() public {
        main = new Main();
    }

    function impl_f() internal {
	uint x = main.x();
	main.f();
	uint y = main.x();
	console.log("[f] Before/After:", x, y);
    }

    function impl_g() internal {
	uint x = main.x();
	main.f();
	uint y = main.x();
	console.log("[g] Before/After:", x, y);
    }

    function test_f_be() public { main.setx(beValue); impl_f(); assertEq(main.x(), beValue>>4); }
    function test_f_de() public { main.setx(deValue); impl_f(); assertEq(main.x(), deValue<<4); }
    function test_f_aa() public { main.setx(aaValue); impl_f(); assertEq(main.x(), aaValue); }
    function test_g_be() public { main.setx(beValue); impl_g(); assertEq(main.x(), beValue>>4); }
    function test_g_de() public { main.setx(deValue); impl_g(); assertEq(main.x(), deValue<<4); }
    function test_g_aa() public { main.setx(aaValue); impl_g(); assertEq(main.x(), aaValue); }

    function testFuzz_SetNumber(uint256 x) public {
        main.setx(x);
        assertEq(main.x(), x);
    }
}
