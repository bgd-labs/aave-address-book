// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
import {IGovernanceCore, IPayloadsControllerCore, IDataWarehouse, IVotingStrategy} from './GovernanceV3.sol';

library GovernanceV3ZkSync {
  // https://era.zksync.network//address/0xA707c95C9e9acB5168971E92b6152aeb0d853153
  address internal constant CROSS_CHAIN_CONTROLLER = 0xA707c95C9e9acB5168971E92b6152aeb0d853153;

  // https://era.zksync.network//address/0x693E85a21287f3EA255E83bDf5e1192486251360
  IPayloadsControllerCore internal constant PAYLOADS_CONTROLLER =
    IPayloadsControllerCore(0x693E85a21287f3EA255E83bDf5e1192486251360);

  // https://era.zksync.network//address/0xe28A3235DCF1Acb8397B546bd588bAAFD7081505
  address internal constant PC_DATA_HELPER = 0xe28A3235DCF1Acb8397B546bd588bAAFD7081505;

  // https://era.zksync.network//address/0x04cE39789e11a49595cD0ECEf6f4Bd54ABF4d020
  address internal constant EXECUTOR_LVL_1 = 0x04cE39789e11a49595cD0ECEf6f4Bd54ABF4d020;
}
