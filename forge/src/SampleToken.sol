// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import "../lib/openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract SampleToken is ERC20 {
    uint8 constant _decimals = 18;
    uint256 constant _totalSupply = 10_000_000 * 10**_decimals;  // 100m tokens for distribution

    constructor() ERC20("SampleToken", "ST") {
        _mint(msg.sender, _totalSupply);
    }
}
