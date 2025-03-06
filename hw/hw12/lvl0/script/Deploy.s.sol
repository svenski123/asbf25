// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Script.sol";

interface Lvl0 {
  function solution() external pure returns (uint8);
}

contract Deploy is Script {
  function run() public returns (Lvl0 lvl0) {
    lvl0 = Lvl0(HuffDeployer.deploy("Lvl0"));
  }
}
