// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

interface Isolution1 {
    function solution(uint256[2][3] calldata firstArray, uint256[2][3] calldata secondArray) external pure returns (uint256[2][3] memory finalArray);
}

import "forge-std/Vm.sol";
Vm constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

function Level1TemplateYul() returns (Isolution1 instance) {
    string memory path = string.concat(vm.projectRoot(), "/out/Lvl1.yul/Level1TemplateYul.json");
    bytes memory payload = vm.parseJsonBytes(vm.readFile(path), ".bytecode.object");
    assembly {
        let offset := add(payload, 0x20)
        let length := mload(payload)
	instance := create(0, offset, length)
    }
}

contract Level1Template is Isolution1 {
    function solution(uint256[2][3] calldata x, uint256[2][3] calldata y) external pure returns (uint256[2][3] memory finalArray) {
	// TODO: Implement your solution here
	for (uint i = 0; i < 3; i++) {
	    for (uint j = 0; j < 2; j++) {
		finalArray[i][j] = x[i][j] + y[i][j];
	    }
	}
    }
}
