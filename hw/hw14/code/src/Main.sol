// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Main {
    uint256 public x;

    function setx(uint _x) public {
	x = _x;
    }

    function f() public {
	uint y = x;
	y |= y>>1;
	y |= y>>2;
	y |= y>>4;
	y |= y>>8;
	y |= y>>16;
	y |= y>>32;
	y |= y>>64;
	y |= y>>128;
	y ^= y>>1;
	y >>= 7;

	uint z;
	z = y*0xbe;
	if (x & z == z) {
	    x >>= 4;
	    return;
	}
	z = y*0xde;
	if (x & z == z) {
	    x <<= 4;
	    return;
	}
    }

    function g() public { assembly {
	let b := sload(x.slot)
	let a := b
	a := or(a, shr(1, a))
	a := or(a, shr(2, a))
	a := or(a, shr(4, a))
	a := or(a, shr(8, a))
	a := or(a, shr(16, a))
	a := or(a, shr(32, a))
	a := or(a, shr(64, a))
	a := or(a, shr(128, a))
	a := xor(a, shr(1, a))
	a := shr(7, a)
	let c := mul(0xbe, a)
	sstore(x.slot, shr(shl(2, eq(and(b, c), c)), b))
	    //	if iszero(xor(and(b, c), c)) {
	    //	    sstore(x.slot, shr(4, b))
	    //	    stop()
	    //	}
	c := mul(0xde, a)
	sstore(x.slot, shl(shl(2, eq(and(b, c), c)), b))
	    //	if iszero(xor(and(b, c), c)) {
	    //	    sstore(x.slot, shl(4, b))
	    //	    stop()
	    //	}
	stop()
	}
    }
}
