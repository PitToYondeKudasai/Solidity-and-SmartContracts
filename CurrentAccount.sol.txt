pragma solidity ^0.5.0;

/*
This smartcontract implements a simple current account where everyone can deposit money but only the 
owner can withdraw them
*/

contract CurrentAccount{
    uint balance = 0;
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getBalance() public view returns(uint){
        return balance;
    }
    
    function deposit(uint newDeposit) public positiveDeposit(newDeposit){
        balance = balance + newDeposit;
    }
    
    function withdrawl(uint amount) public{
        require(
            msg.sender == owner,
            "Only owner can withdrawl money"
        );
        balance = balance - amount;
    }
    
    modifier positiveDeposit(uint newDeposit){
        require(newDeposit > 0);
        _;
    }
    
}