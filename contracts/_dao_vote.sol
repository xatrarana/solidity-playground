// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// DAO wants to let people vote on a proposal. This smart contract will:

// allow poepl to voet "yes" or "no"

// prevent double voting

// what will i be learning
// mapping(address => bool) track who has voted 
// require() restrict bad actions
// uint logic counting votes
// constructor  // setting up the contract state




contract Voting {
    string public proposal;
    address public voter;

    uint public yesVotes;
    uint public noVotes;

    mapping(address => bool) public hasVoted;

    // set the proposal and the voter
    constructor(string memory _proposal){
        proposal = _proposal;
        voter = msg.sender;
    }
    function vote(bool _voteYes) public {
        require(!hasVoted[msg.sender], "You have already voted!");
        hasVoted[msg.sender] = true;

        if (_voteYes) {
            yesVotes++;
        }else {
            noVotes++;
        }
    }

    function resetVotes(string memory _newProposal) public {
        require(msg.sender == voter, "Only owner can reset");
        proposal = _newProposal;
        yesVotes = 0;
        noVotes = 0;
    }
}


// TODOS:
// readlworld limitations
// mappings can't be reset cleanly in solidity(needs off-chain indexing or array of voters)
// cannot iterate over mappoings
// public voitn = not fully private
// in real DAO voting, intgergrate with toekn balance(1token = 1 vote)

