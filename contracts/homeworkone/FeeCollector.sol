// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender; // that is my public adress
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint256 amount, address payable destAddress) public {
        require(msg.sender == owner, "Only owner can withdraw!");
        require(amaunt <= balance, "Insufficient funds");

        destAddress.transfer(amount);
        balance -= amaunt;
    }
}