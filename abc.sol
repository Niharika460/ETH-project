// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyTokenExample {
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalTokenSupply;

    mapping(address => uint256) public balances;

    constructor(string memory _tokenName, string memory _tokenSymbol, uint256 _totalTokenSupply) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        totalTokenSupply = _totalTokenSupply;
        balances[msg.sender] = _totalTokenSupply;
    }

    function mintTokens(address account, uint256 value) public {
        totalTokenSupply += value;
        balances[account] += value;
    }

    function burnTokens(address account, uint256 value) public {
        require(balances[account] >= value, "Insufficient balance");
        
        totalTokenSupply -= value;
        balances[account] -= value;
    }
}
