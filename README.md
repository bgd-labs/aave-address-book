<p align="center"><img width="200" src="./addressbook_logo.png" alt="Address book logo"></a></p>

# Aave Address Book :book:

This repository contains an up-to-date registry of all addresses of the Aave ecosystem's smart contracts, for its usage in Solidity codebases.

The goal is for Solidity developers to have the most integrated environment possible when they want to develop on top of Aave, by just importing a package with all the necessary addresses to interact with.

You can find a searchable version of the address book on [https://book.onaave.com/](https://book.onaave.com/).

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

**Import addresses and interfaces to interact with Governance:**

```sh
import {AaveGovernanceV2} from "aave-address-book/AaveGovernanceV2.sol";
import {IGovernanceCore} from "aave-address-book/GovernanceV3.sol";

```

**Import miscellaneous network addresses and interfaces relevant to the aave protocol:**

```sh
import {Misc<Network>} from "aave-address-book/Aave<Network>.sol";
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

// in addition the chainId of the respective addresses is exported alongside
console.log(AaveV2Avalanche.CHAIN_ID);
// 43114
```

## Running this repository

### Generate files

The library is generated based on the `scripts/generateAddresses.ts` and `scripts/generateABIs.ts` scripts. You can regenerate the files by running `npm run start`.

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

To list a new pool in the address book, you simply need to add a new pool in the respective [pools config](./scripts/configs/<type>/<network>) and run `npm run generate:addresses`.

### Adding new Addresses

a) Adding an address that **can be obtained via onchain calls** so it doesn't need to be hardcoded on the configs:

To achieve an addition here you need to add the address to the respective [v2 type](https://github.com/bgd-labs/aave-address-book/blob/main/scripts/generator_v2.ts#L11) and/or [v3 type](https://github.com/bgd-labs/aave-address-book/blob/main/scripts/generator_v3.ts#L11) and adjust the generator scripts accordingly. New types should be added to the [AaveV2](https://github.com/bgd-labs/aave-address-book/blob/main/src/AaveV2.sol) and [AaveV3](https://github.com/bgd-labs/aave-address-book/blob/main/src/AaveV3.sol) files.

b) Adding an address that **cannot be obtained via onchain calls** so it needs to be manually maintained:

To achieve an addition here, you need to alter the [additionalAddresses section](https://github.com/bgd-labs/aave-address-book/blob/main/scripts/config.ts#L46) on the pool type and add your address to the respective pools. Additional addresses will currently be exported as type `address`. There's currently no possibility to define a custom type.

In any case you need to run `npm run generate:addresses` afterwards and commit the altered artifacts.

### Troubleshooting

#### Error generating the addresses

This repository will try to use public rpcs.
For some networks they are not very reliable though, therefore you can set `RPC_<NETWORK>` in your .env to use a private rpc.
Check https://github.com/bgd-labs/aave-address-book/blob/main/scripts/clients.ts#L39 for the chain naming convention.
Alternatively you can provide an `ALCHEMY_API_KEY` which will use alchemy as a fallback if no exact RPC is specified.
