// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

import "forge-std/Vm.sol";

Vm constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

interface Isolution4 {
    function solution(uint256 number) external pure returns (uint256);
}

contract Level4Template is Isolution4 {
    // stdin: 1                     stdout: 1 or 2**0
    // stdin: 10                    stdout: 8 or 2**3
    // stdin: 21                    stdout: 16 or 2**4
    // stdin: 2048                  stdout: 2048 or 2**11
    // stdin: 9223372036854775808   stdout: 9223372036854775808 or 2**63
    // stdin: 0xffffffff            stdout: 2147483648 or 0x80000000 or 2**31
    function solution(uint256 number) external pure returns (uint256) {
        // TODO: Write your solution here
	unchecked {
	uint256 x = number;
	if (x == 0) return 0;
	uint256 y = 1;
	x |= x>>y; y<<=1;
	x |= x>>y; y<<=1;
	x |= x>>y; y<<=1;
	x |= x>>y; y<<=1;
	x |= x>>y; y<<=1;
	x |= x>>y; y<<=1;
	x |= x>>y; y<<=1;
	x |= x>>y;
	x>>=1;
	x++;
	return x;
	}
    }
}

function Level4TemplateYul() returns (Isolution4 instance) {
    string memory path = string.concat(vm.projectRoot(), "/out/Lvl4.yul/Level4TemplateYul.json");
    bytes memory payload = vm.parseJsonBytes(vm.readFile(path), ".bytecode.object");
    assembly {
        let offset := add(payload, 0x20)
        let length := mload(payload)
	instance := create(0, offset, length)
    }
}
