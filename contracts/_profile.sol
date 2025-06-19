// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Profile {
    string public name;
    uint public age;

    constructor(string memory _name, uint _age){
        name = _name;
        age = _age;
    }

    function updateProfile(string memory _name, uint _age) public  {
        name = _name;
        age = _age;
    }

    function getProfile() public view returns (string memory, uint) {
        return (name, age);
    }
}