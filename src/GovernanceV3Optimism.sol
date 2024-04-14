// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
import {IGovernanceCore, IPayloadsControllerCore, IDataWarehouse, IVotingStrategy} from './GovernanceV3.sol';

library GovernanceV3Optimism {
  // https://optimistic.etherscan.io/address/0x48A9FE90bce5EEd790f3F4Ce192d1C0B351fd4Ca
  address internal constant CROSS_CHAIN_CONTROLLER = 0x48A9FE90bce5EEd790f3F4Ce192d1C0B351fd4Ca;

  // https://optimistic.etherscan.io/address/0x0E1a3Af1f9cC76A62eD31eDedca291E63632e7c4
  IPayloadsControllerCore internal constant PAYLOADS_CONTROLLER =
    IPayloadsControllerCore(0x0E1a3Af1f9cC76A62eD31eDedca291E63632e7c4);

  // https://optimistic.etherscan.io/address/0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A
  address internal constant PC_DATA_HELPER = 0xE3B770Dc4ae3f8bECaB3Ed12dE692c741603e16A;

  // https://optimistic.etherscan.io/address/0x746c675dAB49Bcd5BB9Dc85161f2d7Eb435009bf
  address internal constant EXECUTOR_LVL_1 = 0x746c675dAB49Bcd5BB9Dc85161f2d7Eb435009bf;
}
