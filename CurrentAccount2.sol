pragma solidity >= 0.5.0 < 0.7.0;

contract Coin{
    address public minter;

    /// We create a mapping for the balances
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    /// Constructor method
    constructor() public{
        minter = msg.sender;
    }

    /// Create a new amount of coin on a specific balance
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    /// Transfer money from an address to another
    function send(address receiver, uint amount) public{
        require(amount <= balances[msg.sender], 'Insufficient balance');
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
