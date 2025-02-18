// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Array {
    uint256[] public items;

    function copy() public view returns (uint256[] memory) {
	return items;
    }

    function size() external view returns (uint256) {
	return items.length;
    }

    function append(uint256[] calldata new_items) public {
	for (uint256 i=0; i<new_items.length; i++) {
	    items.push(new_items[i]);
	}
    }

    function push(uint256 item) public {
	items.push(item);
    }

    function pop() public returns (uint256) {
	uint256 item = items[items.length-1];
	items.pop();
	return item;
    }

    // removes an element by (possibly) swapping with last element and popping.
    // does not maintain order but avoids copying other elements.
    function remove(uint256 index) public {
	uint256 last = items.length-1;
	if (index < last) {
	    items[index] = items[last];
	}
	if (index <= last) {
	    items.pop();
	}
    }
}
