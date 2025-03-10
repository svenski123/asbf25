// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface Isolution0 {
    function solution() external pure returns (uint8);
}

contract Lvl0 is Isolution0 {
    //    fallback(bytes calldata) external payable returns (bytes memory) {
    function solution() external pure returns (uint8) {
	return 42;
	//x	return abi.encode("uint8", 42);
    }
}
