// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
import {IGovernanceCore, IPayloadsControllerCore, IDataWarehouse, IVotingStrategy} from './GovernanceV3.sol';
library GovernanceV3Metis {
  // https://explorer.metis.io/address/0x6fDaFb26915ABD6065a1E1501a37Ac438D877f70
  address internal constant CROSS_CHAIN_CONTROLLER = 0x6fDaFb26915ABD6065a1E1501a37Ac438D877f70;

  // https://explorer.metis.io/address/0x2233F8A66A728FBa6E1dC95570B25360D07D5524
  IPayloadsControllerCore internal constant PAYLOADS_CONTROLLER =
    IPayloadsControllerCore(0x2233F8A66A728FBa6E1dC95570B25360D07D5524);

  // https://explorer.metis.io/address/0x81d32B36380e6266e1BDd490eAC56cdB300afBe0
  address internal constant PC_DATA_HELPER = 0x81d32B36380e6266e1BDd490eAC56cdB300afBe0;

  // https://explorer.metis.io/address/0x61BE97d3a0550549f67CA7421725fA73Fa2036B5
  address internal constant GRANULAR_GUARDIAN = 0x61BE97d3a0550549f67CA7421725fA73Fa2036B5;

  // https://explorer.metis.io/address/0x360c0a69Ed2912351227a0b745f890CB2eBDbcFe
  address internal constant GOVERNANCE_GUARDIAN = 0x360c0a69Ed2912351227a0b745f890CB2eBDbcFe;

  // https://explorer.metis.io/address/0x6fD45D32375d5aDB8D76275A3932c740F03a8718
  address internal constant EXECUTOR_LVL_1 = 0x6fD45D32375d5aDB8D76275A3932c740F03a8718;
}
