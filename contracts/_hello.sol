// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract HelloWorld {
    string public message;

    constructor(string memory _message){
        message = _message;
    }

    function setMessage(string memory _newMsg) public {
        message = _newMsg;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}