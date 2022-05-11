# Aave Address Book :book:

This repository contains an up-to-date registry of all addresses of the Aave ecosystem's smart contracts, for its usage in Solidity codebases.

The goal is for Solidity developers to have the most integrated environment possible when they want to develop on top of Aave, by just importing a package with all the necessary addresses to interact with.

<br>

## Usage

ADD SAMPLE PROJECTS FOR FOUNDRY, HARDHAT, TRUFFLE AND REMIX.

## Foundry

With Foundry installed and being in a Git repository:
```
forge install bgd-labs/aave-address-book
```

Then add to your Foundry remappings:
`"aave-address-book/=lib/aave-address-book/src/"`

And you will be able to import on any Solidity file of your any collection of addresses per network:
```
import {AaveV2Eth} from "aave-address-book/AaveAddressBook.sol"
```



## Running this repository

### Dependencies

```
make update
```

### Compilation

```
make build
```

### Testing

```
make test
```
