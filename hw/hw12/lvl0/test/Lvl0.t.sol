// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console2.sol";

contract Lvl0Test is Test {
    /// @dev Address of the SimpleStore contract.
    Lvl0 public lvl0;

    /// @dev Setup the testing environment.
    function setUp() public {
        lvl0 = Lvl0(HuffDeployer.deploy("Lvl0"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue(uint256 value) public {
        uint8 rc = lvl0.solution();
        console2.logUint(value);
        console2.logUint(rc);
        assertEq(42, rc);
    }
}

interface Lvl0 {
    function solution() external pure returns (uint8);
}
