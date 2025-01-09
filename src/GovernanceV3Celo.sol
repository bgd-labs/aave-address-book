// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
import {IGovernanceCore, IPayloadsControllerCore, IDataWarehouse, IVotingStrategy} from './GovernanceV3.sol';
library GovernanceV3Celo {
  // https://celoscan.io/address/0x50F4dAA86F3c747ce15C3C38bD0383200B61d6Dd
  address internal constant CROSS_CHAIN_CONTROLLER = 0x50F4dAA86F3c747ce15C3C38bD0383200B61d6Dd;

  // https://celoscan.io/address/0x91b21900E91CD302EBeD05E45D8f270ddAED944d
  address internal constant CL_EMERGENCY_ORACLE = 0x91b21900E91CD302EBeD05E45D8f270ddAED944d;

  // https://celoscan.io/address/0xE48E10834C04E394A04BF22a565D063D40b9FA42
  IPayloadsControllerCore internal constant PAYLOADS_CONTROLLER =
    IPayloadsControllerCore(0xE48E10834C04E394A04BF22a565D063D40b9FA42);

  // https://celoscan.io/address/0x8657Cd5a0957e8C5BE15c69C67078b5d730D720a
  address internal constant PC_DATA_HELPER = 0x8657Cd5a0957e8C5BE15c69C67078b5d730D720a;

  // https://celoscan.io/address/0xbE815420A63A413BB8D508d8022C0FF150Ea7C39
  address internal constant GRANULAR_GUARDIAN = 0xbE815420A63A413BB8D508d8022C0FF150Ea7C39;

  // https://celoscan.io/address/0x056E4C4E80D1D14a637ccbD0412CDAAEc5B51F4E
  address internal constant GOVERNANCE_GUARDIAN = 0x056E4C4E80D1D14a637ccbD0412CDAAEc5B51F4E;

  // https://celoscan.io/address/0x1dF462e2712496373A347f8ad10802a5E95f053D
  address internal constant EXECUTOR_LVL_1 = 0x1dF462e2712496373A347f8ad10802a5E95f053D;
}
