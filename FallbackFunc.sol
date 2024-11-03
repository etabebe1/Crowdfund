// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FallbackAndReceive {
    uint256 public x;
    uint256 public y;
    receive() external payable {
        x = 4;
    }

    fallback () external payable {
        y = 5;
    }

    function getBalance () public view returns(uint) {
        return address(this).balance;
    }
}

// Ether is sent to contract
//      is msg.data empty?
//          /   \
//         yes  no
//         /     \
//    receive()?  fallback()
//     /   \
//   yes   no
//  /        \
//receive()  fallback()