# Compile (Solidity) based on the Truffle 

## Install Truffle and Ganache-cli
```bash
$ git clone ....
$ cd truffle
$ npm install truffle -g
$ npm install ganache-cli -g
```

## Install Dependencies (for openzeppelin)
```bash
$ npm install
(npm install --save @openzeppelin/contracts)
$ truffle compile // make artifacts
```

## Ganache-cli
```bash
$ ganache-cli
```

## Set a Network (truffle-config.js - networks)
```
# In this project, already set a network.
module.exports = {
  networks:{
    development:{
      host: '127.0.0.1',
      port: 8545,
      network_id: '*' // match any netwrok id
    }
  }
};
```

## Migration (migrations - xx_deploy_contracts.js, In this project, already set a migration.)
```javascript
const TokenLockUp = artifacts.require("TokenLockUp");
const TestToken = artifacts.require("TestToken");
module.exports = function(_deployer) {
  // Use deployer to state migration tasks.
  _deployer.deploy(TestToken).then(function() {
    return _deployer.deploy(TokenLockUp, TestToken.address);
  });
};

$ truffle create migration deploy_contracts
```


## Compile and Migrate
```bash
$ cd truffle
$ truffle compile
$ truffle migrate
```

## Test
```bash
$ truffle test
```


## License
MIT