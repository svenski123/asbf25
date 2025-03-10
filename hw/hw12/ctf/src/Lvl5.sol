// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "forge-std/Vm.sol";
Vm constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

interface Isolution5 {
    function solution(int256 a, int256 b) external pure returns (int256);
}

contract Level5Template is Isolution5 {
    // Give an overflow-free method for computing the average, rounding up, of 2 signed integers, (a + b) / 2 
    // Your function will take 2 values (a,b) and return the average of these values
    // Keep in mind that you will be rounding the average up (ceil) NOT rounding down (floor)
    // Floor -> rounding towards zero
    // Ceil -> rounding away from zero
    function solution(int256 a, int256 b) external pure returns (int256) {
	unchecked {
        // TODO: Write your solution here
	int256 c = (a|b)&1;
	int256 d = (a>>1) + (b>>1) + c;
	return d;
	}
    }
}

function Level5TemplateYul() returns (Isolution5 instance) {
    string memory path = string.concat(vm.projectRoot(), "/out/Lvl5.yul/Level5TemplateYul.json");
    bytes memory payload = vm.parseJsonBytes(vm.readFile(path), ".bytecode.object");
    assembly {
        let offset := add(payload, 0x20)
        let length := mload(payload)
	instance := create(0, offset, length)
    }
}
