// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBaseReceiverPortal} from './IBaseReceiverPortal.sol';
import {IVotingMachineWithProofs} from './IVotingMachineWithProofs.sol';

/**
 * @title IVotingPortal
 * @author BGD Labs
 * @notice interface containing the objects, events and methods definitions of the VotingPortal contract
 */
interface IVotingPortal is IBaseReceiverPortal {
  /**
   * @notice enum containing the different type of messages that can be bridged
   * @param Null empty state
   * @param Proposal indicates that the message is to bridge a proposal configuration
   */
  enum MessageType {
    Null,
    Proposal
  }

  /**
   * @notice emitted when "Start voting" gas limit gets updated
   * @param gasLimit the new gas limit
   */
  event StartVotingGasLimitUpdated(uint128 gasLimit);

  /**
   * @notice emitted when a vote message is received
   * @param originSender address that sent the message on the origin chain
   * @param originChainId id of the chain where the message originated
   * @param delivered flag indicating if message has been delivered
   * @param message bytes containing the necessary information to queue the bridged proposal id
   * @param reason bytes with the revert information
   */
  event VoteMessageReceived(
    address indexed originSender,
    uint256 indexed originChainId,
    bool indexed delivered,
    bytes message,
    bytes reason
  );

  /**
   * @notice get the chain id where the voting machine which is deployed
   * @return network id
   */
  function VOTING_MACHINE_CHAIN_ID() external view returns (uint256);

  /**
   * @notice gets the address of the voting machine on the destination network
   * @return voting machine address
   */
  function VOTING_MACHINE() external view returns (address);

  /**
   * @notice gets the address of the connected governance
   * @return governance address
   */
  function GOVERNANCE() external view returns (address);

  /**
   * @notice gets the address of the CrossChainController deployed on current network
   * @return CrossChainController address
   */
  function CROSS_CHAIN_CONTROLLER() external view returns (address);

  /**
   * @notice method to set the gas limit for "Start voting" bridging tx
   * @param gasLimit the new gas limit
   */
  function setStartVotingGasLimit(uint128 gasLimit) external;

  /**
   * @notice method to get the gas limit for "Start voting" bridging tx
   * @return the gas limit
   */
  function getStartVotingGasLimit() external view returns (uint128);

  /**
   * @notice method to bridge the vote configuration to voting chain, so a vote can be started.
   * @param proposalId id of the proposal bridged to start the vote on
   * @param blockHash hash of the block on L1 when the proposal was activated for voting
   * @param votingDuration duration in seconds of the vote
   */
  function forwardStartVotingMessage(
    uint256 proposalId,
    bytes32 blockHash,
    uint24 votingDuration
  ) external;

  /**
   * @notice method to decode a message from from voting machine chain
   * @param message encoded message with message type
   * @return proposalId, forVotes, againstVotes from the decoded message
   */
  function decodeMessage(bytes memory message) external pure returns (uint256, uint128, uint128);
}
