<p align="center"><img width="200" src="./addressbook_logo.png" alt="Address book logo"></a></p>

# Aave Address Book :book:

This repository contains an up-to-date registry of all addresses of the Aave ecosystem's smart contracts, for its usage in Solidity codebases.

The goal is for Solidity developers to have the most integrated environment possible when they want to develop on top of Aave, by just importing a package with all the necessary addresses to interact with.

## Usage with foundry

With Foundry installed and being in a Git repository:

```sh
forge install bgd-labs/aave-address-book
```

**Import a pool specific collection of addresses & interfaces:**

```sh
import {AaveV2Ethereum} from "aave-address-book/AaveV2Ethereum.sol";
import {AaveV3Avalanche} from "aave-address-book/AaveV3Avalanche.sol";
```

Included addresses:

```sh
// v2 libraries
ILendingPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
ILendingPool POOL;
ILendingPoolConfigurator POOL_CONFIGURATOR;
IAaveOracle ORACLE;
IAaveProtocolDataProvider AAVE_PROTOCOL_DATA_PROVIDER;
address POOL_ADMIN;
address EMERGENCY_ADMIN;
address COLLECTOR;
address COLLECTOR_CONTROLLER;

// v3 libraries
IPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
IPool POOL;
IPoolConfigurator POOL_CONFIGURATOR;
IAaveOracle ORACLE;
IAaveProtocolDataProvider AAVE_PROTOCOL_DATA_PROVIDER;
IACLManager ACL_MANAGER;
address ACL_ADMIN;
address COLLECTOR;
ICollector COLLECTOR_CONTROLLER;
address DEFAULT_INCENTIVES_CONTROLLER;
address DEFAULT_A_TOKEN_IMPL_REV_1;
address DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1;
address DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1;
```

**Import addresses and interfaces to interact with Governance:**

```sh
import {AaveGovernanceV2} from "aave-address-book/AaveGovernanceV2.sol";
```

Included addresses:

```sh
IAaveGovernanceV2 GOV;
address SHORT_EXECUTOR;
address LONG_EXECUTOR;
address ARC_TIMELOCK;
```

**Import miscellaneous addresses and interfaces relevant to the aave protocol:**

```sh
import {AaveMisc} from "aave-address-book/AaveMisc.sol";
```

Included addresses:

```sh
IAaveEcosystemReserveController AAVE_ECOSYSTEM_RESERVE_CONTROLLER;
address ECOSYSTEM_RESERVE;
```

### Production Recommendations

While there is a index import available in "aave-address-book/AaveAddressBook.sol", we only recommend using it in tests.
Foundry currently does not eliminate unused code for [verification](https://github.com/foundry-rs/foundry/issues/2266).
This results in rather gigantic verifications when using the index file import from [aave-address-book/AaveAddressBook.sol](./src/AaveAddressBook.sol).
For production code we therefore recommend to use pool specific libraries (`Aave[Version][Network][?SubPool]`) exported from `aave-address-book` like `AaveV2Ethereum` for the `V2` `Ethereum` pool.

## Usage with node

### Install

```sh
npm i @bgd-labs/aave-address-book
```

### Usage

```js
import * as pools from "@bgd-labs/aave-address-book"; // wildcard import
import { AaveV2Avalanche } from "@bgd-labs/aave-address-book"; // import specific pool

// all variables available on solidity version are available in javascript as well
console.log(AaveV2Avalanche.POOL_ADDRESSES_PROVIDER);
// "0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb"

// in addition the chainId of the respecitve addresses is exported alongside
console.log(AaveV2Avalanche.CHAIN_ID);
// 43114
```

## Running this repository

### Generate files

The library is generated based on the config file located in `scripts/config.ts`. You can regenerate the files by running `yarn generate`.

### Dependencies

```sh
forge update
```

### Compilation

```sh
forge build
```

### Testing

```sh
forge test
```

### Adding a new Pool

To list a new pool in the address book, you simply need to add a new pool in the [pools config](./scripts/config.ts) and run `yarn generate`.

### Adding new Addresses

a) Adding an address that **can be optained via onchain calls** so it doesn't need to be hardcoded on the configs:

To achieve an addition here you need to add the address to the respective [v2 type](https://github.com/bgd-labs/aave-address-book/blob/main/scripts/generator_v2.ts#L11) and/or [v3 type](https://github.com/bgd-labs/aave-address-book/blob/main/scripts/generator_v3.ts#L11) and adjust the generator scripts accordingly. New types should be added to the [AaveV2](https://github.com/bgd-labs/aave-address-book/blob/main/src/AaveV2.sol) and [AaveV3](https://github.com/bgd-labs/aave-address-book/blob/main/src/AaveV3.sol) files.

b) Adding an address that **cannot be optained via onchain calls** so it needs to be manually maintained:

To achieve an addition here, you need to alter the [additionalAddresses section](https://github.com/bgd-labs/aave-address-book/blob/main/scripts/config.ts#L46) on the pool type and add your address to the respecive pools. Additional addresses will currently be exported as type `address`. There's currently no possibility to define a custom type.

In any case you need to run `yarn generate` afterwards and commit the altered artifacts.

## Sample projects

- [aave v2 asset listing template](https://github.com/bgd-labs/example-aave-v2-listing)
