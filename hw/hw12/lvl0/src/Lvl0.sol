// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Lvl0 {
    fallback(bytes calldata) external payable returns (bytes memory) {
	return abi.encode("uint8", 42);
    }
}
