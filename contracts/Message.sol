// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;


contract Message{
    address public owner;

    string public message;

    constructor(){
        owner = msg.sender;
    }

    event messageSet(address setter, string message);
    event messageGet(address getter, string message);
    event OwnwershipTransfered(address previousOwner, address newOwner);

    function setMessage(string memory _message) public {
        require(msg.sender != address(0), "you can't set your own message");
        require(msg.sender == owner, "you are not the owner");
        message =_message;

        emit messageSet(msg.sender, message);
    }

    function getMessage() public view returns (string memory){
        return message;
    }

    function transferOwnership(address _newOwner) public{
        require(msg.sender == owner, "you are not the owner");
        require(_newOwner != address(0), "you can't transfer ownership to address zero");
        emit OwnwershipTransfered(owner, _newOwner);
        owner = _newOwner; 
    }


}