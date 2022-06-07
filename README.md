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



### Usage in production

For production code we recommend to use market specific libraries (`Aave[Version][Network][?SubMarket]`) exported from `AaveAddressBook` like `AaveV2Ethereum` for the `V2` `Ethereum` market. These entrypoints contain constants for all the immutable market specific addresses.

Each market consists of the following constants:

```sh
// v2 libraries
POOL_ADDRESSES_PROVIDER = ILendingPoolAddressesProvider;
POOL = ILendingPool;
POOL_CONFIGURATOR = ILendingPoolConfigurator;
ORACLE = IAaveOracle;
AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider;
POOL_ADMIN = address;
EMERGENCY_ADMIN = address;
```

```sh
// v3 libraries
POOL_ADDRESSES_PROVIDER = IPoolAddressesProvider;
POOL = IPool;
POOL_CONFIGURATOR = IPoolConfigurator;
ORACLE = IAaveOracle;
AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider;
POOL_ADMIN = address;
ACL_ADMIN = address;
```

### Usage in tests

In tests it's useful to have a generic way to import different markets and tokens across networks. Sometimes it also makes sense to fetch a specific token on a network. To streamline this process there is a generic `AaveAddressBookV2` and `AaveAddressBookV3` entrypoint which contains a `getMarket(marketName: string): Market` and a `getToken(marketName: string, symbol: string): Token` function allowing you to fetch any market and token. The returned `Market` is a struct following the same layout as the market specific libraries.
**We don't recommend using these generic libraries in production code though as they are quite gas & code-size intensive.**

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
