// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PayloadsControllerUtils} from './PayloadsControllerUtils.sol';

interface IPayloadsControllerCore {
  /// @notice Enum indicating the possible payload states
  enum PayloadState {
    None, // state 0 left as empty
    Created,
    Queued,
    Executed,
    Cancelled,
    Expired
  }

  /**
   * @notice holds configuration of the executor
   * @param executor address of the executor
   * @param delay time in seconds between queuing and execution
   */
  struct ExecutorConfig {
    address executor;
    uint40 delay;
  }

  /**
   * @notice Object containing the information necessary to set a new executor
   * @param accessLevel level of access that the executor will be assigned to
   * @param executorConfig object containing the configurations for the accessLevel specified
   */
  struct UpdateExecutorInput {
    PayloadsControllerUtils.AccessControl accessLevel;
    ExecutorConfig executorConfig;
  }

  /**
   * @notice Object containing the information necessary to define a payload action
   * @param target address of the contract that needs to be executed
   * @param withDelegateCall boolean indicating if execution needs to be delegated
   * @param accessLevel access level of the executor needed for the execution
   * @param value value amount that needs to be sent to the executeTransaction method
   * @param signature method signature that will be executed
   * @param callData data needed for the execution of the signature
   */
  struct ExecutionAction {
    address target;
    bool withDelegateCall;
    PayloadsControllerUtils.AccessControl accessLevel;
    uint256 value;
    string signature;
    bytes callData;
  }

  /**
   * @notice Object containing a payload information
   * @param creator address of the createPayload method caller
   * @param maximumAccessLevelRequired min level needed to be able to execute all actions
   * @param state indicates the current state of the payload
   * @param createdAt time indicating when payload has been created. In seconds // max is: 1.099511628×10¹² (ie 34'865 years)
   * @param queuedAt time indicating when payload has been queued. In seconds  // max is: 1.099511628×10¹² (ie 34'865 years)
   * @param executedAt time indicating when a payload has been executed. In seconds  // max is: 1.099511628×10¹² (ie 34'865 years)
   * @param cancelledAt time indicating when the payload has been cancelled. In seconds
   * @param expirationTime time indicating when the Payload will expire
   * @param delay time in seconds that a payload must remain queued before execution
   * @param gracePeriod time in seconds that a payload has to be executed
   * @param actions array of actions to be executed
   */
  struct Payload {
    address creator;
    PayloadsControllerUtils.AccessControl maximumAccessLevelRequired;
    PayloadState state;
    uint40 createdAt;
    uint40 queuedAt;
    uint40 executedAt;
    uint40 cancelledAt;
    uint40 expirationTime;
    uint40 delay;
    uint40 gracePeriod;
    ExecutionAction[] actions;
  }

  /**
   * @notice Event emitted when an executor has been set for a determined access level
   * @param accessLevel level of access that the executor will be set to
   * @param executor address that will be set for the determined access level
   * @param delay time in seconds between queuing and execution
   */
  event ExecutorSet(
    PayloadsControllerUtils.AccessControl indexed accessLevel,
    address indexed executor,
    uint40 delay
  );

  /**
   * @notice Event emitted when a payload has been created
   * @param payloadId id of the payload created
   * @param creator address pertaining to the caller of the method createPayload
   * @param actions array of the actions conforming the payload
   * @param maximumAccessLevelRequired maximum level of the access control
   */
  event PayloadCreated(
    uint40 indexed payloadId,
    address indexed creator,
    ExecutionAction[] actions,
    PayloadsControllerUtils.AccessControl indexed maximumAccessLevelRequired
  );

  /**
   * @notice emitted when a cross chain message gets received
   * @param originSender address that sent the message on the origin chain
   * @param originChainId id of the chain where the message originated
   * @param delivered flag indicating if message has been delivered
   * @param message bytes containing the necessary information to queue the bridged payload id
   * @param reason bytes with the revert information
   */
  event PayloadExecutionMessageReceived(
    address indexed originSender,
    uint256 indexed originChainId,
    bool indexed delivered,
    bytes message,
    bytes reason
  );

  /**
   * @notice Event emitted when a payload has been executed
   * @param payloadId id of the payload being enqueued
   */
  event PayloadExecuted(uint40 payloadId);

  /**
   * @notice Event emitted when a payload has been queued
   * @param payloadId id of the payload being enqueued
   */
  event PayloadQueued(uint40 payloadId);

  /**
   * @notice Event emitted when cancelling a payload
   * @param payloadId id of the cancelled payload
   */
  event PayloadCancelled(uint40 payloadId);

  /**
   * @notice get the expiration delay of a payload
   * @return expiration delay in seconds
   */
  function EXPIRATION_DELAY() external view returns (uint40);

  /**
   * @notice get the maximum time in seconds that a proposal must spend being queued
   * @return max delay in seconds
   */
  function MAX_EXECUTION_DELAY() external view returns (uint40);

  /**
   * @notice get the minimum time in seconds that a proposal must spend being queued
   * @return min delay in seconds
   */
  function MIN_EXECUTION_DELAY() external view returns (uint40);

  /**
   * @notice time in seconds where the proposal can be executed (from executionTime) before it expires
   * @return grace period in seconds
   */
  function GRACE_PERIOD() external view returns (uint40);

  /**
   * @notice get a previously created payload object
   * @param payloadId id of the payload to retrieve
   * @return payload information
   */
  function getPayloadById(uint40 payloadId) external view returns (Payload memory);

  /**
   * @notice get the current state of a payload
   * @param payloadId id of the payload to retrieve the state from
   * @return payload state
   */
  function getPayloadState(uint40 payloadId) external view returns (PayloadState);

  /**
   * @notice get the total count of payloads created
   * @return number of payloads
   */
  function getPayloadsCount() external view returns (uint40);

  /**
   * @notice method that will create a Payload object for every action sent
   * @param actions array of actions which this proposal payload will contain
   * @return id of the created payload
   */
  function createPayload(ExecutionAction[] calldata actions) external returns (uint40);

  /**
   * @notice method to execute a payload
   * @param payloadId id of the payload that needs to be executed
   */
  function executePayload(uint40 payloadId) external payable;

  /**
   * @notice method to cancel a payload
   * @param payloadId id of the payload that needs to be canceled
   */
  function cancelPayload(uint40 payloadId) external;

  /**
   * @notice method to add executors and its configuration
   * @param executors array of UpdateExecutorInput objects
   */
  function updateExecutors(UpdateExecutorInput[] calldata executors) external;

  /**
   * @notice method to get the executor configuration assigned to the specified level
   * @param accessControl level of which we want to get the executor configuration from
   * @return executor configuration
   */
  function getExecutorSettingsByAccessControl(
    PayloadsControllerUtils.AccessControl accessControl
  ) external view returns (ExecutorConfig memory);
}
