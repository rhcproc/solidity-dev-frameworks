// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SampleLockUp.sol";
import "../src/SampleToken.sol";

contract LockUpTest is Test {
    SampleLockUp public lockup;
    SampleToken public token;

    function setUp() public {
        token = new SampleToken();
        lockup = new SampleLockUp(address(token));
    }

    function testDeposit() public {
        token.approve(address(lockup), 100);
        lockup.deposit(100, 100);
        console.log(lockup.lockups(address(this)));
        // assertEq(lockup.lockups(address(this)).lockupPeriod, 100);
        // assertEq(lockup.lockups(address(this)).lockupAmount, 100);
        // assertEq(lockup.lockups(address(this)).lockupStart, block.timestamp);
    }

    function testWithdraw() public {
        token.approve(address(lockup), 100);
        lockup.deposit(100, 100);
        lockup.withdraw();
        // assertEq(lockup.lockups(address(this)).lockupPeriod, 0);
        // assertEq(lockup.lockups(address(this)).lockupAmount, 0);
        // assertEq(lockup.lockups(address(this)).lockupStart, 0);
    }
}

// contract TokenTest is Test {
//     Counter public counter;

//     function setUp() public {
//         counter = new Counter();
//         counter.setNumber(0);
//     }

//     function testIncrement() public {
//         counter.increment();
//         assertEq(counter.number(), 1);
//     }

//     function testSetNumber(uint256 x) public {
//         counter.setNumber(x);
//         assertEq(counter.number(), x);
//     }
// }
