// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

library PayloadsControllerUtils {
  /// @notice enum with supported access levels
  enum AccessControl {
    Level_null, // to not use 0
    Level_1, // LEVEL_1 - short executor before, listing assets, changes of assets params, updates of the protocol etc
    Level_2 // LEVEL_2 - long executor before, payloads controller updates
  }

  /**
   * @notice Object containing the necessary payload information.
   * @param chain
   * @param accessLevel
   * @param payloadsController
   * @param payloadId
   */
  struct Payload {
    uint256 chain;
    AccessControl accessLevel;
    address payloadsController; // address which holds the logic to execute after success proposal voting
    uint40 payloadId; // number of the payload placed to payloadsController, max is: ~10¹²
  }
}

interface IGovernancePowerStrategy {
  /**
 * @notice method to get the full voting power of an user. This method is only use for consulting purposes.
             As its not used for voting calculations, it is not needed to force blockNumber - 1 to protect against
             FlashLoan attacks.
   * @param user address where we want to get the power from
   * @return full voting power of a user
   */
  function getFullVotingPower(address user) external view returns (uint256);

  /**
   * @notice method to get the full proposal power of an user. It is not needed to protect against FlashLoan
             attacks because once user returns the tokens (power) the proposal will get canceled as proposal creator
             will loose the proposition power.
   * @param user address where we want to get the power from
   * @return full proposition power of a user
   */
  function getFullPropositionPower(
    address user
  ) external view returns (uint256);
}


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
  function getPayloadById(
    uint40 payloadId
  ) external view returns (Payload memory);

  /**
   * @notice get the current state of a payload
   * @param payloadId id of the payload to retrieve the state from
   * @return payload state
   */
  function getPayloadState(
    uint40 payloadId
  ) external view returns (PayloadState);

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
  function createPayload(
    ExecutionAction[] calldata actions
  ) external returns (uint40);

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

interface IVotingMachineWithProofs {
  /**
   * @notice Object to use over submitVoteBySignature and in case of bridging for protect against wrong roots inclusion
   * @param underlyingAsset address of the token on L1, used for voting
   * @param slot base storage position where the balance on underlyingAsset contract resides on L1. (Normally position 0)
   */
  struct VotingAssetWithSlot {
    address underlyingAsset;
    uint128 slot;
  }
}

interface IGovernanceCore {
  /**
   * @notice Object storing the vote configuration for a specific access level
   * @param coolDownBeforeVotingStart number of seconds indicating how much time should pass before proposal will be moved to vote
   * @param votingDuration number of seconds indicating the duration of a vote
   * @param yesThreshold minimum number of yes votes needed for a proposal to pass.
            FOR VOTES > YES THRESHOLD
            we consider that this param in case of AAVE don't need decimal places
   * @param yesNoDifferential number of for votes that need to be bigger than against votes to pass a proposal.
            FOR VOTES - AGAINST VOTES > YES NO DIFFERENTIAL
            we consider that this param in case of AAVE don't need decimal places
   * @param minPropositionPower the minimum needed power to create a proposal.
            we consider that this param in case of AAVE don't need decimal places
   */
  struct VotingConfig {
    uint24 coolDownBeforeVotingStart;
    uint24 votingDuration;
    uint56 yesThreshold;
    uint56 yesNoDifferential;
    uint56 minPropositionPower;
  }

  /**
   * @notice object storing the input parameters of a voting configuration
   * @param accessLevel number of access level needed to execute a proposal in this settings
   * @param coolDownBeforeVotingStart number of seconds indicating the time that must pass from proposal creation for
            the voting to be activated
   * @param votingDuration number of seconds indicating the duration of a vote
   * @param yesThreshold minimum number of yes votes needed for a proposal to pass.
            FOR VOTES > YES THRESHOLD
            in normal units with 18 decimals
   * @param yesNoDifferential number of for votes that need to be bigger than against votes to pass a proposal.
            FOR VOTES - AGAINST VOTES > YES NO DIFFERENTIAL
            in normal units with 18 decimals
   * @param minPropositionPower the minimum needed power to create a proposal.
            in normal units with 18 decimals
   */
  struct SetVotingConfigInput {
    PayloadsControllerUtils.AccessControl accessLevel;
    uint24 coolDownBeforeVotingStart;
    uint24 votingDuration;
    uint256 yesThreshold;
    uint256 yesNoDifferential;
    uint256 minPropositionPower;
  }

  /**
   * @notice enum storing the different states of a proposal
   */
  enum State {
    Null, // proposal does not exists
    Created, // created, waiting for a cooldown to initiate the balances snapshot
    Active, // balances snapshot set, voting in progress
    Queued, // voting results submitted, but proposal is under grace period when guardian can cancel it
    Executed, // results sent to the execution chain(s)
    Failed, // voting was not successful
    Cancelled, // got cancelled by guardian, or because proposition power of creator dropped below allowed minimum
    Expired
  }

  /**
   * @notice object storing all the information of a proposal including the different states in time that can have
   * @param state current state of the proposal
   * @param accessLevel minimum level needed to be able to execute this proposal
   * @param votingDuration number of seconds indicating the duration of a vote. max is: 16'777'216 (ie 194.18 days)
   * @param creationTime timestamp in seconds of when the proposal was created. max is: 1.099511628×10¹² (ie 34'865 years)
   * @param votingActivationTime timestamp in seconds of when the voting activates for the proposal
   * @param queuingTime timestamp in seconds of when the proposal was queued
   * @param cancelTimestamp timestamp in seconds of when the proposal was canceled
   * @param creator address of the creator of the proposal
   * @param votingPortal address of the votingPortal used to communicate with the voting chain
   * @param snapshotBlockHash block hash of when the proposal was created, as to be able to get the correct balances on this specific block
   * @param ipfsHash ipfs has containing the proposal metadata information
   * @param forVotes number of votes in favor of the proposal
   * @param againstVotes number of votes against the proposal
   * @param payloads list of objects containing the payload information necessary for execution
   */
  struct Proposal {
    State state;
    PayloadsControllerUtils.AccessControl accessLevel;
    uint40 creationTime;
    uint24 votingDuration;
    uint40 votingActivationTime;
    uint40 queuingTime;
    uint40 cancelTimestamp;
    address creator;
    address votingPortal;
    bytes32 snapshotBlockHash;
    bytes32 ipfsHash;
    uint128 forVotes;
    uint128 againstVotes;
    PayloadsControllerUtils.Payload[] payloads;
  }

  /**
   * @notice emitted when powerStrategy got updated
   * @param newPowerStrategy address of the new powerStrategy
   */
  event PowerStrategyUpdated(address indexed newPowerStrategy);

  /**
   * @notice emitted when one of the _votingConfigs got updated
   * @param accessLevel minimum level needed to be able to execute this proposal
   * @param votingDuration duration of the voting period in seconds
   * @param coolDownBeforeVotingStart time in seconds between proposal creation and voting activation
   * @param yesThreshold min amount of yes votes needed to pass a proposal
   * @param yesNoDifferential minimal difference between you and no votes for proposal to pass
   * @param minPropositionPower minimal proposition power of a user to be able to create proposal
   */
  event VotingConfigUpdated(
    PayloadsControllerUtils.AccessControl indexed accessLevel,
    uint24 votingDuration,
    uint24 coolDownBeforeVotingStart,
    uint256 yesThreshold,
    uint256 yesNoDifferential,
    uint256 minPropositionPower
  );

  /**
   * @notice emitted when a proposal is created.
   * @param proposalId id of the proposal
   * @param creator address of the creator of the proposal
   * @param accessLevel minimum level needed to be able to execute this proposal
   * @param ipfsHash ipfs has containing the proposal metadata information
   */
  event ProposalCreated(
    uint256 indexed proposalId,
    address indexed creator,
    PayloadsControllerUtils.AccessControl indexed accessLevel,
    bytes32 ipfsHash
  );
  /**
   * @notice emitted when voting is activated. Meaning that the vote configuration will be sent to voting machine
   * @param proposalId id of the proposal
   * @param snapshotBlockHash block hash of when the proposal was created, as to be able to get the correct balances on this specific block
   * @param votingDuration duration of the voting period in seconds
   */
  event VotingActivated(
    uint256 indexed proposalId,
    bytes32 indexed snapshotBlockHash,
    uint24 votingDuration
  );

  /**
   * @notice emitted when proposal change state to Queued
   * @param proposalId id of the proposal
   * @param votesFor votes for proposal
   * @param votesAgainst votes against proposal
   */
  event ProposalQueued(
    uint256 indexed proposalId,
    uint128 votesFor,
    uint128 votesAgainst
  );

  /**
   * @notice emitted when proposal change state to Executed
   * @param proposalId id of the proposal
   */
  event ProposalExecuted(uint256 indexed proposalId);

  /**
   * @notice emitted when proposal change state to Canceled
   * @param proposalId id of the proposal
   */
  event ProposalCanceled(uint256 indexed proposalId);

  /**
   * @notice emitted when proposal change state to Failed
   * @param proposalId id of the proposal
   * @param votesFor votes for proposal
   * @param votesAgainst votes against proposal
   */
  event ProposalFailed(
    uint256 indexed proposalId,
    uint128 votesFor,
    uint128 votesAgainst
  );

  /**
   * @notice emitted when a voting machine gets updated
   * @param votingPortal address of the voting portal updated
   * @param approved boolean indicating if a voting portal has been added or removed
   */
  event VotingPortalUpdated(
    address indexed votingPortal,
    bool indexed approved
  );

  /**
   * @notice emitted when a payload is successfully sent to the execution chain
   * @param proposalId id of the proposal containing the payload sent for execution
   * @param payloadId id of the payload sent for execution
   * @param payloadsController address of the payloads controller on the execution chain
   * @param chainId id of the execution chain
   * @param payloadNumberOnProposal number of payload sent for execution, from the number of payloads contained in proposal
   * @param numberOfPayloadsOnProposal number of payloads that are in the proposal
   */
  event PayloadSent(
    uint256 indexed proposalId,
    uint40 payloadId,
    address indexed payloadsController,
    uint256 indexed chainId,
    uint256 payloadNumberOnProposal,
    uint256 numberOfPayloadsOnProposal
  );

  /**
   * @notice emitted when a vote is successfully sent to voting chain
   * @param proposalId id of the proposal the vote is for
   * @param voter address that wants to vote on a proposal
   * @param support indicates if vote is in favor or against the proposal
   * @param votingAssetsWithSlot list of token addresses with the base storage slot to use for the vote
   */
  event VoteForwarded(
    uint256 indexed proposalId,
    address indexed voter,
    bool indexed support,
    IVotingMachineWithProofs.VotingAssetWithSlot[] votingAssetsWithSlot
  );

  /**
   * @notice method to get the number of registered voting portals
   * @return number of registered voting portals
   */
  function getVotingPortalsCount() external view returns (uint256);

  /**
   * @notice method to approve new voting machines
   * @param votingPortals array of voting portal addresses to approve
   */
  function addVotingPortals(address[] calldata votingPortals) external;

  /**
   * @notice method to add a new voting portal
   * @param votingPortal address of the new voting portal
   * @dev This method is only callable by the Guardian.
   * @dev This method is only callable when there are no voting portals registered. Its rationale is for the Guardian
          to be able to "rescue" the system in case all voting portals were removed by mistake. This is needed because
          to add a new voting portal a full governance flow is required, and without the portal, the system would be bricked.
          To limit the Guardian's power, can only happen if there are no voting portals registered, and the guardian
          could only add one voting portal.
   */
  function rescueVotingPortal(address votingPortal) external;

  /**
   * @notice method to remove an accepted voting portal.
   * @param votingPortals list of addresses of the voting machines that are no longer valid
   * @dev removing a voting portal effectively removes a voting machine
   */
  function removeVotingPortals(address[] calldata votingPortals) external;

  /**
   * @notice creates a proposal, with configuration specified in VotingConfig corresponding to the accessLevel
   * @param payloads which user propose to vote for
   * @param votingPortal address of the contract which will bootstrap voting, and provide results in the end
   * @param ipfsHash ipfs hash of a document with proposal description
   * @return created proposal ID
   */
  function createProposal(
    PayloadsControllerUtils.Payload[] calldata payloads,
    address votingPortal,
    bytes32 ipfsHash
  ) external returns (uint256);

  /**
   * @notice executes a proposal, can be called by anyone if proposal in Queued state
   * @notice and passed more then COOLDOWN_PERIOD seconds after proposal entered this state
   * @param proposalId id of the proposal
   */
  function executeProposal(uint256 proposalId) external;

  /**
   * @notice cancels a proposal, can be initiated by guardian,
   * @notice or if proposition power of proposal creator will go below minPropositionPower specified in VotingConfig
   * @param proposalId id of the proposal
   */
  function cancelProposal(uint256 proposalId) external;

  /**
   * @notice gets the state of a proposal
   * @param proposalId id of the proposal
   * @return state of the proposal
   */
  function getProposalState(uint256 proposalId) external view returns (State);

  /**
   * @notice method to set a new powerStrategy contract
   * @param newPowerStrategy address of the new contract containing the voting a voting strategy
   */

  function setPowerStrategy(IGovernancePowerStrategy newPowerStrategy) external;

  /**
   * @notice method to set the voting configuration for a determined access level
   * @param votingConfigs object containing configuration for an access level
   */
  function setVotingConfigs(
    SetVotingConfigInput[] calldata votingConfigs
  ) external;

  /**
   * @notice method to get the voting configuration from an access level
   * @param accessLevel level for which to get the configuration of a vote
   * @return the voting configuration assigned to the specified accessLevel
   */
  function getVotingConfig(
    PayloadsControllerUtils.AccessControl accessLevel
  ) external view returns (VotingConfig memory);

  /**
   * @notice method to get the reasonably achievable voting participation, taking into total supply, and market situation
   * @return maximum voting participation in wei
   */
  function ACHIEVABLE_VOTING_PARTICIPATION() external view returns (uint256);

  /**
   * @notice method to get the cool down period between queuing and execution
   * @return time in seconds
   */
  function COOLDOWN_PERIOD() external view returns (uint256);

  /**
   * @notice method to get the minimum voting duration time in seconds
   * @return time in seconds
   */
  function MIN_VOTING_DURATION() external view returns (uint256);

  /**
   * @notice method to get the precision divider used to remove unneeded decimals
   * @return decimals of 1 ether (18)
   */
  function PRECISION_DIVIDER() external view returns (uint256);

  /**
   * @notice method to get the the voting tokens cap
   * @return cap for the voting tokens
   * @dev This cap is used to limit the number of voting tokens, so as to not drain the bridging funds
          with a message too big.
   */
  function VOTING_TOKENS_CAP() external view returns (uint256);

  /**
   * @notice method to get the expiration time from creation from which the proposal will be invalid
   * @return time in seconds
   */
  function PROPOSAL_EXPIRATION_TIME() external view returns (uint256);

  /**
   * @notice method to get the name of the contract
   * @return name string
   */
  function NAME() external view returns (string memory);

  /**
   * @notice method to get the proposal identified by passed id
   * @param proposalId id of the proposal to get the information of
   * @return proposal object containing all the information
   */
  function getProposal(
    uint256 proposalId
  ) external view returns (Proposal memory);

  /**
   * @notice address of the current voting strategy to use on the governance
   * @return address of the voting strategy
   */
  function getPowerStrategy() external view returns (IGovernancePowerStrategy);

  /**
   * @notice proposals counter.
   * @return the current number proposals created
   */
  function getProposalsCount() external view returns (uint256);

  /**
   * @notice method to get if a voting portal is approved by the governance
   * @param votingPortal address of the voting portal to check if approved
   * @return flag indicating the approval status of the voting portal
   */
  function isVotingPortalApproved(
    address votingPortal
  ) external view returns (bool);

  /**
   * @notice method to queue a proposal for execution
   * @param proposalId the id of the proposal to queue
   * @param forVotes number of votes in favor of the proposal
   * @param againstVotes number of votes against of the proposal
   */
  function queueProposal(
    uint256 proposalId,
    uint128 forVotes,
    uint128 againstVotes
  ) external;

  /**
   * @notice method to send proposal to votingMachine
   * @param proposalId id of the proposal to start the voting on
   */
  function activateVoting(uint256 proposalId) external;

  /**
   * @notice method that enables smart contracts that are on governance chain to vote on voting machine
   * @param proposalId id of the proposal to vote of
   * @param support boolean indicating if the vote is in favor or against the proposal
   * @param votingAssetsWithSlot list of token addresses with the base storage slots the voter wants to vote with
   */
  function voteViaPortal(
    uint256 proposalId,
    bool support,
    IVotingMachineWithProofs.VotingAssetWithSlot[] memory votingAssetsWithSlot
  ) external;
}
