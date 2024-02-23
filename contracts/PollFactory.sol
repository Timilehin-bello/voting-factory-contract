// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;



import "./Poll.sol";
 contract PollFactory {
     Poll[] public polls;
 
     event PollCreated(address pollAddress, address creator);
 
     function createPoll(string[] memory _options) public {
         Poll newPoll = new Poll(_options, msg.sender);
         polls.push(newPoll);
         emit PollCreated(address(newPoll), msg.sender);
     }
 
     function getPolls() external view returns (Poll[] memory) {
         return polls;
     }
 }