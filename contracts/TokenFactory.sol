// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenFactory {
    address[] public tokens;

    event TokenCreated(address tokenAddress);

    function createToken(string memory name, string memory symbol, uint256 initialSupply) public {
        ERC20Token newToken = new ERC20Token(name, symbol, initialSupply, msg.sender);
        tokens.push(address(newToken));
        emit TokenCreated(address(newToken));
    }
}

contract ERC20Token is ERC20 {
    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner) ERC20(name, symbol) {
        _mint(owner, initialSupply);
    }
}
