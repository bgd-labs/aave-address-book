# Aave Address Book :book:

This repository contains an up-to-date registry of all addresses of the Aave ecosystem's smart contracts, for its usage in Solidity codebases.

The goal is for Solidity developers to have the most integrated environment possible when they want to develop on top of Aave, by just importing a package with all the necessary addresses to interact with.

<br>

## Usage with foundry

With Foundry installed and being in a Git repository:

```
forge install bgd-labs/aave-address-book
```

You will be able to import on any Solidity file any collection of addresses per network:

```
import {AaveV2Ethereum} from "aave-address-book/AaveAddressBook.sol"
```

You can use this library in two ways:

### Testing

In tests it's useful to have a generic way to import different markets and tokens across networks. Sometimes it also makes sense to fetch a specific token on a network. To streamline this process there is a generic `AaveAddressBookV2` and `AaveAddressBookV3` entrypoint which contains a `getMarket(marketName: string)` and a `getToken(marketName: string, token: string)` function allowing you to fetch any market and token. We don't recommend using these libraries in production code though as they are quite gas & code-size intensive.

### Production

For production code we recommend to use market specific entry-points (`Aave[Version][Network][?SubMarket]`) exported from `AaveAddressBook` like `AaveV2Ethereum` for the `V2` `Ethereum` market. These entrypoint contain constants for all the immutable market specific addresses.

## Running this repository

### Generate files

The library is generated based on the config file located in `scripts/config.ts`. You can regenerate the files by running `yarn generate`.

### Dependencies

```
forge update
```

### Compilation

```
forge build
```

### Testing

```
forge test
```

## Sample projects

- [aave v2 asset listing template](https://github.com/bgd-labs/example-aave-v2-listing)
