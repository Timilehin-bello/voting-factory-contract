// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Poll contract, which is deployed for each new poll
contract Poll {
    struct Option {
        string name;
        uint voteCount;
    }

    Option[] public options;
    address public pollCreator;
    mapping(address => bool) public hasVoted;

    event Voted(address voter, uint option);

    constructor(string[] memory _options, address creator) {
        for (uint i = 0; i < _options.length; i++) {
            options.push(Option({
                name: _options[i],
                voteCount: 0
            }));
        }
        pollCreator = creator;
    }

    function vote(uint _optionId) external {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_optionId < options.length, "Invalid option.");

        options[_optionId].voteCount += 1;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, _optionId);
    }

    function getOptionsCount() external view returns (uint) {
        return options.length;
    }
}