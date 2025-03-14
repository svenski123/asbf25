// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

import "forge-std/Vm.sol";

Vm constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external view returns (uint256[10] memory sortedArray);
}

contract Level2Template is Isolution2 {
    function sort10(uint a,uint b,uint c,uint d,uint e,uint f,uint g,uint h,uint i,uint j) public pure returns (uint,uint,uint,uint,uint,uint,uint,uint,uint,uint) {
	if (b<a) (a,b)=(b,a);
	if (c<a) (a,c)=(c,a);
	if (d<a) (a,d)=(d,a);
	if (e<a) (a,e)=(e,a);
	if (f<a) (a,f)=(f,a);
	if (g<a) (a,g)=(g,a);
	if (h<a) (a,h)=(h,a);
	if (i<a) (a,i)=(i,a);
	if (j<a) (a,j)=(j,a);
	if (c<b) (b,c)=(c,b);
	if (d<b) (b,d)=(d,b);
	if (e<b) (b,e)=(e,b);
	if (f<b) (b,f)=(f,b);
	if (g<b) (b,g)=(g,b);
	if (h<b) (b,h)=(h,b);
	if (i<b) (b,i)=(i,b);
	if (j<b) (b,j)=(j,b);
	if (d<c) (c,d)=(d,c);
	if (e<c) (c,e)=(e,c);
	if (f<c) (c,f)=(f,c);
	if (g<c) (c,g)=(g,c);
	if (h<c) (c,h)=(h,c);
	if (i<c) (c,i)=(i,c);
	if (j<c) (c,j)=(j,c);
	if (e<d) (d,e)=(e,d);
	if (f<d) (d,f)=(f,d);
	if (g<d) (d,g)=(g,d);
	if (h<d) (d,h)=(h,d);
	if (i<d) (d,i)=(i,d);
	if (j<d) (d,j)=(j,d);
	if (f<e) (e,f)=(f,e);
	if (g<e) (e,g)=(g,e);
	if (h<e) (e,h)=(h,e);
	if (i<e) (e,i)=(i,e);
	if (j<e) (e,j)=(j,e);
	if (g<f) (f,g)=(g,f);
	if (h<f) (f,h)=(h,f);
	if (i<f) (f,i)=(i,f);
	if (j<f) (f,j)=(j,f);
	if (h<g) (g,h)=(h,g);
	if (i<g) (g,i)=(i,g);
	if (j<g) (g,j)=(j,g);
	if (i<h) (h,i)=(i,h);
	if (j<h) (h,j)=(j,h);
	if (j<i) (i,j)=(j,i);
	return (a,b,c,d,e,f,g,h,i,j);
    }

    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray) {
        // TODO: Implement your solution here.
	uint256[10] calldata X = unsortedArray;
	uint256[10] memory Y = sortedArray;
	(Y[0], Y[1], Y[2], Y[3], Y[4], Y[5], Y[6], Y[7], Y[8], Y[9]) = sort10
	    (X[0], X[1], X[2], X[3], X[4], X[5], X[6], X[7], X[8], X[9]);
    }
}

function Level2TemplateYul() returns (Isolution2 instance) {
    string memory path = string.concat(vm.projectRoot(), "/out/Lvl2.yul/Level2TemplateYul.json");
    bytes memory payload = vm.parseJsonBytes(vm.readFile(path), ".bytecode.object");
    assembly {
        let offset := add(payload, 0x20)
        let length := mload(payload)
	instance := create(0, offset, length)
    }
}
