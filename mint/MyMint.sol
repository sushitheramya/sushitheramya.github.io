// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {

    string tokenName = "My LOL Coin minting smart contract.";
    string tokenSymbol = "LOLL";
    uint256 tokenDecimals = 18;
    uint256 maxTokenSupply = 9000000 * (10 ** tokenDecimals);

    constructor() ERC20(tokenName, tokenSymbol) {}

    function mintFunction(uint256 amountToMint) public {
        require(amountToMint == 1, "You can only mint one token at a time.");

        uint256 amountInDecimals = amountToMint * 10 ** tokenDecimals;
        uint256 currentSupply = totalSupply();

        require(currentSupply + amountInDecimals <= maxTokenSupply, 
            "Minting the amount requested would exceed the max supply allowed.");

        _mint(msg.sender, amountInDecimals);
    }
}
