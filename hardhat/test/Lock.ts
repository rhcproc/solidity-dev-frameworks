import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Lock", function () {
  let inst: any;
  let testToken: any;

  this.beforeEach(async () => {
    const [owner] = await ethers.getSigners();
    const TestToken = await ethers.getContractFactory("SampleToken");
    testToken = await TestToken.deploy();

    const Instance = await ethers.getContractFactory("SampleLockUp");
    inst = await Instance.deploy(testToken.address);
    console.log(inst.address);
  });

  it("should assert true", async function () {

    const [owner] = await ethers.getSigners();

    // transfer
    await testToken.transfer(owner.address, 10000000, {from: owner.address});

    // approve
    await testToken.approve(inst.address, 10000000, {from: owner.address});

    // Period, Amount
    await inst.deposit(10000, 10000000, {from: owner.address});

    const info = await inst.lockups(owner.address);
    console.log(info.lockupAmount.words);
    console.log(info.lockupPeriod.toNumber());

    expect(info.lockupAmount.toNumber()).to.equal(10000000);
  });

  
});

