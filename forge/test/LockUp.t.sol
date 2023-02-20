// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// import "forge-std/Test.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {stdStorage, StdStorage, Test} from "../lib/forge-std/src/Test.sol";
import "../src/SampleLockUp.sol";
import "../src/SampleToken.sol";

contract LockUpTest is Test {
    SampleLockUp public lockup;
    SampleToken public token;
    // address internal alice;
    // address internal bob;

    function setUp() public {
        token = new SampleToken();
        lockup = new SampleLockUp(address(token));
        vm.warp(1672392900);
        // alice = address(0x1);
        // bob = address(0x2);
    }

    function testDeposit() public {
        token.approve(address(lockup), 100);
        lockup.deposit(100, 100);

        (uint256 lockupPeriod, uint256 lockupAmount, uint256 lockupStart) = lockup.lockups(address(this));
        console.log('lockupPeriod', lockupPeriod);
        console.log('lockupAmount', lockupAmount);
        console.log('lockupStart', lockupStart);
    
        assertEq(lockupPeriod, 100);
        assertEq(lockupAmount, 100);
        assertEq(lockupStart, block.timestamp);
    }

    function testWithdraw() public {
        vm.warp(1672392900);
        token.approve(address(lockup), 100);
        lockup.deposit(100, 100);
        vm.warp(1672392900+(150*1));
        lockup.withdraw();

        (uint256 lockupPeriod, uint256 lockupAmount, uint256 lockupStart) = lockup.lockups(address(this));

        console.log('lockupPeriod', lockupPeriod);
        console.log('lockupAmount', lockupAmount);
        console.log('lockupStart', lockupStart);
        assertEq(lockupPeriod, 0);
        assertEq(lockupAmount, 0);
        assertEq(lockupStart, 0);
    }
}