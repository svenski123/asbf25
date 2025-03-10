// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

import "forge-std/Vm.sol";

Vm constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

interface Isolution3 {
    function solution(bytes memory packed) external view returns (uint16 a, bool b, bytes6 c);
}

contract Level3Template is Isolution3 {
    function impl0(bytes memory packed) internal pure returns (uint16 a, bool b, bytes6 c) {
	uint x = uint72(bytes9(packed));
	a = uint16(x>>56);
	b = (x>>48) & 0xff != 0;
	c = bytes6(uint48(x));
    }
    function impl1(bytes calldata) public pure returns (uint16, bool, bytes6) {
	assembly {
	    let x := calldataload(68)
	    mstore(0x20, shr(240, x))
		//calldatacopy(0x5f, 70, 1)
		calldatacopy(0x60, 71, 6)
		mstore8(0x5f, shr(232, x))
		//	    mstore(32, and(shr(232, x), 0xff))
		//		mstore(0x60, and(shl(24, x), 0xffffffffffff0000000000000000000000000000000000000000000000000000))
	    return(0x20, 96)
	}
    }

    function solution(bytes calldata packed) external pure returns (uint16 a, bool b, bytes6 c) {
        // TODO: Write your solution here
	return impl1(packed);
    }
}

function Level3TemplateYul() returns (Isolution3 instance) {
    string memory path = string.concat(vm.projectRoot(), "/out/Lvl3.yul/Level3TemplateYul.json");
    bytes memory payload = vm.parseJsonBytes(vm.readFile(path), ".bytecode.object");
    assembly {
        let offset := add(payload, 0x20)
        let length := mload(payload)
	instance := create(0, offset, length)
    }
}
