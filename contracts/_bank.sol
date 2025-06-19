// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// minimal back where users can:
// deposit ETH
// withdraw ETH
// checkbalance
// only access their own balance

contract MinimalBank {
    mapping (address => uint) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Must deposit more than ETH 0");

        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalances() public view  returns (uint){
        return balances[msg.sender];
    }
}