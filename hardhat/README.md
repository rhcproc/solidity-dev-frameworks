# Compile (Solidity) based on the Truffle 

## 1. Install Hardhat
```bash
npm install --save-dev hardhat
```

## 2. Create a Hardhat project
```bash
(If you need to create a new project, run the following command.)
npx hardhat init
```

## 3. Install openzeppelin and ethers
```bash
npm install --save-dev @openzeppelin/contracts
npm install --save-dev @nomiclabs/hardhat-ethers ethers
```

## 4. Compile
```bash
npx hardhat compile
```

## 5. Run test
```bash
npx hardhat test
```

## 6. Run test with coverage
```bash
npm install --save-dev solidity-coverage
npx hardhat coverage
```

## License
MIT