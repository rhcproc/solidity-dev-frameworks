// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SampleLockUp {

    struct Lockup {
        uint256 lockupPeriod;
        uint256 lockupAmount;
        uint256 lockupStart;
    }

    mapping (address => Lockup) public lockups;

    event Deposit(address indexed user, uint256 lockupPeriod, uint256 lockupAmount, uint256 lockupStart);
    event Withdraw(address indexed user, uint256 lockupAmount);

    IERC20 public immutable KEEPER;

    constructor(address _GRACYTokenAddress) {
        KEEPER = IERC20(_GRACYTokenAddress);
    }

    function deposit(uint256 _lockupPeriod, uint256 _lockupAmount) public {
        require(_lockupPeriod > 0, "Lockup period must be greater than 0");
        require(_lockupAmount > 0, "Lockup amount must be greater than 0");
        require(KEEPER.balanceOf(msg.sender) >= _lockupAmount, "Insufficient balance");

        lockups[msg.sender] = Lockup({
            lockupPeriod: _lockupPeriod,
            lockupAmount: _lockupAmount,
            lockupStart: block.timestamp
        });

        KEEPER.transferFrom(msg.sender, address(this), _lockupAmount);
        emit Deposit(msg.sender, _lockupPeriod, _lockupAmount, block.timestamp);
    }

    function withdraw() public {
        Lockup memory lockup = lockups[msg.sender];
        require(block.timestamp >= lockup.lockupStart + lockup.lockupPeriod, "Tokens are still locked");

        KEEPER.transfer(msg.sender, lockup.lockupAmount);
        emit Withdraw(msg.sender, lockup.lockupAmount);
    }
}
