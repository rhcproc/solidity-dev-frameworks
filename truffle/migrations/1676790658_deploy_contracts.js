// import "TokenLockUp.sol";
const TokenLockUp = artifacts.require("SampleLockUp");
const TestToken = artifacts.require("SampleToken");


module.exports = function(_deployer) {
  // Use deployer to state migration tasks.
  _deployer.deploy(TestToken).then(function() {
    return _deployer.deploy(TokenLockUp, TestToken.address);
  });
};
