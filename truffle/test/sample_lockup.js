const SampleLockUp = artifacts.require("SampleLockUp");
const SampleToken = artifacts.require("SampleToken");

contract("SampleLockUp", function (accounts ) {

  before(async function () {
    token = await SampleToken.deployed();
    instance = await SampleLockUp.deployed(token.address);
  });

  it("should assert true", async function () {

    // transfer
    await token.transfer(accounts[0], 10000000, {from: accounts[0]});

    // approve
    await token.approve(SampleLockUp.address, 10000000, {from: accounts[0]});

    // Period, Amount
    await instance.deposit(10000, 10000000, {from: accounts[0]});

    const info = await instance.lockups(accounts[0]);
    console.log(info.lockupAmount.words);
    console.log(info.lockupPeriod.toNumber());
  });

});
