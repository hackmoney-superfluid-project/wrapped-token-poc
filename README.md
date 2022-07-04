# Wrapped token POC

This repository contains the code for the following:

## Custom super token that extends the functionality the Superfluid `SuperToken.sol`:

This implementation can be deployed using the `deploy.js` script. It has an additional function located at the bottom of the file called `readMessage` that returns a hardcoded string.

**Contracts**

-   AqueductToken.sol
-   SuperToken.sol

To run tests for `AqueductToken.sol`, open a terminal and enter:
`npx hardhat node --fork https://polygon-mainnet.g.alchemy.com/v2/<yourApiKey>`

Then open a separate terminal and enter:
`npx hardhat test --network localhost `

## Custom native super token

This implementation was taken from the [following guide](https://medium.com/@jtriley15/custom-super-tokens-6cdeffd6c923). You can test it out by adding the contracts to Remix and following the instructions. The contracts can be found in the `custom-token-guide-contracts` folder

**Contracts**

-   SuperJuicyToken.sol
-   SuperTokenBase.sol
-   UUPSProxy.sol
