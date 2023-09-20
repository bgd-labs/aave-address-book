// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

import {IVotingMachineWithProofs} from './governance-v3/IVotingMachineWithProofs.sol';
import {IDataWarehouse} from './governance-v3/IDataWarehouse.sol';
import {IVotingStrategy} from './governance-v3/IVotingStrategy.sol';

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
  function getFullPropositionPower(address user) external view returns (uint256);
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

interface IGovernanceCore {
  /**
   * @notice Object with the necessary information of a representative
   * @param representative address that represents the voter
   * @param chainId id of the chain where the representative is on
   */
  struct RepresentativeInput {
    address representative;
    uint256 chainId;
  }

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
   * @dev State enum defines the state machine of a proposal so the order on which the state is defined is important.
          Check logic correctness if new states are added / removed
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
   * @param cancellationFee amount in eth that will be retained if proposal is cancelled
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
    uint256 cancellationFee;
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
  event ProposalQueued(uint256 indexed proposalId, uint128 votesFor, uint128 votesAgainst);

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
  event ProposalFailed(uint256 indexed proposalId, uint128 votesFor, uint128 votesAgainst);

  /**
   * @notice emitted when a voting machine gets updated
   * @param votingPortal address of the voting portal updated
   * @param approved boolean indicating if a voting portal has been added or removed
   */
  event VotingPortalUpdated(address indexed votingPortal, bool indexed approved);

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
   * @notice emitted when the cancellation fee is updated
   * @param cancellationFee amount of the new cancellation fee
   */
  event CancellationFeeUpdated(uint256 cancellationFee);

  /**
   * @notice emitted when the cancellation fee is redeemed
   * @param proposalId id of the proposal the fee was redeemed from
   * @param to address that will receive the cancellation fee
   * @param cancellationFee amount of the cancellation fee redeemed
   * @param success flag indicating if the transfer was successful or not
   */
  event CancellationFeeRedeemed(
    uint256 indexed proposalId,
    address indexed to,
    uint256 cancellationFee,
    bool indexed success
  );

  /**
   * @notice method to get the Cancellation Fee Collector address
   * @return cancellation fee collector address
   */
  function CANCELLATION_FEE_COLLECTOR() external view returns (address);

  /**
   * @notice method to update the cancellation fee
   * @param cancellationFee the fee amount to collateralize against a proposal cancellation
   */
  function updateCancellationFee(uint256 cancellationFee) external;

  /**
   * @notice method to get the cancellation fee
   * @return cancellation fee amount
   */
  function getCancellationFee() external view returns (uint256);

  /**
   * @notice method to redeem the cancellation fee from a proposal
   * @param proposalIds array of ids of the proposals to redeem the cancellation fee from
   */
  function redeemCancellationFee(uint256[] calldata proposalIds) external;

  /**
   * @notice emitted when a voter updates its representative
   * @param voter address of the voter that updates
   * @param representative address of the chosen representative
   * @param chainId id of the chain where representative is representing the voter on
   */
  event RepresentativeUpdated(
    address indexed voter,
    address indexed representative,
    uint256 indexed chainId
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
  ) external payable returns (uint256);

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
  function setVotingConfigs(SetVotingConfigInput[] calldata votingConfigs) external;

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
  function getProposal(uint256 proposalId) external view returns (Proposal memory);

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
  function isVotingPortalApproved(address votingPortal) external view returns (bool);

  /**
   * @notice method to queue a proposal for execution
   * @param proposalId the id of the proposal to queue
   * @param forVotes number of votes in favor of the proposal
   * @param againstVotes number of votes against of the proposal
   */
  function queueProposal(uint256 proposalId, uint128 forVotes, uint128 againstVotes) external;

  /**
   * @notice method to send proposal to votingMachine
   * @param proposalId id of the proposal to start the voting on
   */
  function activateVoting(uint256 proposalId) external;

  /**
   * @notice method to get the representative of a voter on a chain
   * @param voter address of the voter
   * @param chainId id of the chain to get the representative from
   * @return address of the representative of the voter on chainId
   */
  function getRepresentativeByChain(address voter, uint256 chainId) external view returns (address);

  /**
   * @notice method to update the representative of a voter on certain chain.
   * @param representatives Array of objects with the representative information
   */
  function updateRepresentativesForChain(RepresentativeInput[] calldata representatives) external;

  /**
   * @notice method to get the voters a representative is representing
   * @param representative address of the representative
   * @param chainId id of the chain to search for represented voters
   */
  function getRepresentedVotersByChain(
    address representative,
    uint256 chainId
  ) external view returns (address[] memory);
}

library Errors {
  string public constant VOTING_PORTALS_COUNT_NOT_0 = '1'; // to be able to rescue voting portals count must be 0
  string public constant AT_LEAST_ONE_PAYLOAD = '2'; // to create a proposal, it must have at least one payload
  string public constant VOTING_PORTAL_NOT_APPROVED = '3'; // the voting portal used to vote on proposal must be approved
  string public constant PROPOSITION_POWER_IS_TOO_LOW = '4'; // proposition power of proposal creator must be equal or higher than the specified threshold for the access level
  string public constant PROPOSAL_NOT_IN_CREATED_STATE = '5'; // proposal should be in the CREATED state
  string public constant PROPOSAL_NOT_IN_ACTIVE_STATE = '6'; // proposal must be in an ACTIVE state
  string public constant PROPOSAL_NOT_IN_QUEUED_STATE = '7'; // proposal must be in a QUEUED state
  string public constant VOTING_START_COOLDOWN_PERIOD_NOT_PASSED = '8'; // to activate a proposal vote, the cool down delay must pass
  string public constant CALLER_NOT_A_VALID_VOTING_PORTAL = '9'; // only an allowed voting portal can queue a proposal
  string public constant QUEUE_COOLDOWN_PERIOD_NOT_PASSED = '10'; // to execute a proposal a cooldown delay must pass
  string public constant PROPOSAL_NOT_IN_THE_CORRECT_STATE = '11'; // proposal must be created but not executed yet to be able to be canceled
  string public constant CALLER_NOT_GOVERNANCE = '12'; // caller must be governance
  string public constant VOTER_ALREADY_VOTED_ON_PROPOSAL = '13'; // voter can only vote once per proposal using voting portal
  string public constant WRONG_MESSAGE_ORIGIN = '14'; // received message must come from registered source address, chain id, CrossChainController
  string public constant NO_VOTING_ASSETS = '15'; // Strategy must have voting assets
  string public constant PROPOSAL_VOTE_ALREADY_CREATED = '16'; // vote on proposal can only be created once
  string public constant INVALID_SIGNATURE = '17'; // submitted signature is not valid
  string public constant PROPOSAL_VOTE_NOT_FINISHED = '18'; // proposal vote must be finished
  string public constant PROPOSAL_VOTE_NOT_IN_ACTIVE_STATE = '19'; // proposal vote must be in active state
  string public constant PROPOSAL_VOTE_ALREADY_EXISTS = '20'; // proposal vote already exists
  string public constant VOTE_ONCE_FOR_ASSET = '21'; // an asset can only be used once per vote
  string public constant USER_BALANCE_DOES_NOT_EXISTS = '22'; // to vote an user must have balance in the token the user is voting with
  string public constant USER_VOTING_BALANCE_IS_ZERO = '23'; // to vote an user must have some balance between all the tokens selected for voting
  string public constant MISSING_AAVE_ROOTS = '24'; // must have AAVE roots registered to use strategy
  string public constant MISSING_STK_AAVE_ROOTS = '25'; // must have stkAAVE roots registered to use strategy
  string public constant MISSING_STK_AAVE_SLASHING_EXCHANGE_RATE = '26'; // must have stkAAVE slashing exchange rate registered to use strategy
  string public constant UNPROCESSED_STORAGE_ROOT = '27'; // root must be registered beforehand
  string public constant NOT_ENOUGH_MSG_VALUE = '28'; // method was not called with enough value to execute the call
  string public constant FAILED_ACTION_EXECUTION = '29'; // action failed to execute
  string public constant SHOULD_BE_AT_LEAST_ONE_EXECUTOR = '30'; // at least one executor is needed
  string public constant INVALID_EMPTY_TARGETS = '31'; // target of the payload execution must not be empty
  string public constant EXECUTOR_WAS_NOT_SPECIFIED_FOR_REQUESTED_ACCESS_LEVEL = '32'; // payload executor must be registered for the specified payload access level
  string public constant PAYLOAD_NOT_IN_QUEUED_STATE = '33'; // payload must be en the queued state
  string public constant TIMELOCK_NOT_FINISHED = '34'; // delay has not passed before execution can be called
  string public constant PAYLOAD_NOT_IN_THE_CORRECT_STATE = '35'; // payload must be created but not executed yet to be able to be canceled
  string public constant PAYLOAD_NOT_IN_CREATED_STATE = '36'; // payload must be in the created state
  string public constant MISSING_A_AAVE_ROOTS = '37'; // must have aAAVE roots registered to use strategy
  string public constant MISSING_PROPOSAL_BLOCK_HASH = '38'; // block hash for this proposal was not bridged before
  string public constant PROPOSAL_VOTE_CONFIGURATION_ALREADY_BRIDGED = '39'; // configuration for this proposal bridged already
  string public constant INVALID_VOTING_PORTAL_ADDRESS = '40'; // voting portal address can't be 0x0
  string public constant INVALID_POWER_STRATEGY = '41'; // 0x0 is not valid as the power strategy
  string public constant INVALID_EXECUTOR_ADDRESS = '42'; // executor address can't be 0x0
  string public constant EXECUTOR_ALREADY_SET_IN_DIFFERENT_LEVEL = '43'; // executor address already being used as executor of a different level
  string public constant INVALID_VOTING_DURATION = '44'; // voting duration can not be bigger than the time it takes to execute a proposal
  string public constant VOTING_DURATION_NOT_PASSED = '45'; // at least votingDuration should have passed since voting started for a proposal to be queued
  string public constant INVALID_PROPOSAL_ACCESS_LEVEL = '46'; // the bridged proposal access level does not correspond with the maximum access level required by the payload
  string public constant PAYLOAD_NOT_CREATED_BEFORE_PROPOSAL = '47'; // payload must be created before proposal
  string public constant INVALID_CROSS_CHAIN_CONTROLLER_ADDRESS = '48';
  string public constant INVALID_MESSAGE_ORIGINATOR_ADDRESS = '49';
  string public constant INVALID_ORIGIN_CHAIN_ID = '50';
  string public constant INVALID_ACTION_TARGET = '51';
  string public constant INVALID_ACTION_ACCESS_LEVEL = '52';
  string public constant INVALID_EXECUTOR_ACCESS_LEVEL = '53';
  string public constant INVALID_VOTING_PORTAL_CROSS_CHAIN_CONTROLLER = '54';
  string public constant INVALID_VOTING_PORTAL_VOTING_MACHINE = '55';
  string public constant INVALID_VOTING_PORTAL_GOVERNANCE = '56';
  string public constant INVALID_VOTING_MACHINE_CHAIN_ID = '57';
  string public constant G_INVALID_CROSS_CHAIN_CONTROLLER_ADDRESS = '58';
  string public constant G_INVALID_IPFS_HASH = '59';
  string public constant G_INVALID_PAYLOAD_ACCESS_LEVEL = '60';
  string public constant G_INVALID_PAYLOADS_CONTROLLER = '61';
  string public constant G_INVALID_PAYLOAD_CHAIN = '62';
  string public constant POWER_STRATEGY_HAS_NO_TOKENS = '63'; // power strategy should at least have
  string public constant INVALID_VOTING_CONFIG_ACCESS_LEVEL = '64';
  string public constant VOTING_DURATION_TOO_SMALL = '65';
  string public constant NO_BRIDGED_VOTING_ASSETS = '66';
  string public constant INVALID_VOTER = '67';
  string public constant INVALID_DATA_WAREHOUSE = '68';
  string public constant INVALID_VOTING_MACHINE_CROSS_CHAIN_CONTROLLER = '69';
  string public constant INVALID_L1_VOTING_PORTAL = '70';
  string public constant INVALID_VOTING_PORTAL_CHAIN_ID = '71';
  string public constant INVALID_VOTING_STRATEGY = '72';
  string public constant INVALID_VOTE_CONFIGURATION_BLOCKHASH = '73';
  string public constant INVALID_VOTE_CONFIGURATION_VOTING_DURATION = '74';
  string public constant INVALID_GAS_LIMIT = '75';
  string public constant INVALID_VOTING_CONFIGS = '76'; // a lvl2 voting configuration must be sent to initializer
  string public constant INVALID_EXECUTOR_DELAY = '77';
  string public constant REPEATED_STRATEGY_ASSET = '78';
  string public constant EMPTY_ASSET_STORAGE_SLOTS = '79';
  string public constant REPEATED_STRATEGY_ASSET_SLOT = '80';
  string public constant INVALID_EXECUTION_TARGET = '81';
  string public constant MISSING_VOTING_CONFIGURATIONS = '82'; // voting configurations for lvl1 and lvl2 must be included on initialization
  string public constant INVALID_PROPOSITION_POWER = '83';
  string public constant INVALID_YES_THRESHOLD = '84';
  string public constant INVALID_YES_NO_DIFFERENTIAL = '85';
  string public constant ETH_TRANSFER_FAILED = '86';
  string public constant INVALID_INITIAL_VOTING_CONFIGS = '87'; // initial voting configurations can not be of the same level
  string public constant INVALID_VOTING_PORTAL_ADDRESS_IN_VOTING_MACHINE = '88';
  string public constant INVALID_VOTING_PORTAL_OWNER = '89';
  string public constant CANCELLATION_FEE_REDEEM_FAILED = '90'; // cancellation fee was not able to be redeemed
  string public constant INVALID_CANCELLATION_FEE_COLLECTOR = '91'; // collector can not be address 0
  string public constant INVALID_CANCELLATION_FEE_SENT = '92'; // cancellation fee sent does not match the needed amount
  string public constant CANCELLATION_FEE_ALREADY_REDEEMED = '93'; // cancellation fee already redeemed
  string public constant INVALID_STATE_TO_REDEEM_CANCELLATION_FEE = '94'; // proposal state is not a valid state to redeem cancellation fee
  string public constant MISSING_REPRESENTATION_ROOTS = '95'; // to represent a voter the representation roots need to be registered
  string public constant CALLER_IS_NOT_VOTER_REPRESENTATIVE = '96'; // to represent a voter, caller must be the stored representative
  string public constant VM_INVALID_GOVERNANCE_ADDRESS = '97'; // governance address can not be 0
}

interface IExecutor {
  /**
   * @notice emitted when an action got executed
   * @param target address of the targeted contract
   * @param value wei value of the transaction
   * @param signature function signature of the transaction
   * @param data function arguments of the transaction or callData if signature empty
   * @param executionTime time at which to execute the transaction
   * @param withDelegatecall boolean, true = transaction delegatecalls the target, else calls the target
   * @param resultData the actual callData used on the target
   **/
  event ExecutedAction(
    address indexed target,
    uint256 value,
    string signature,
    bytes data,
    uint256 executionTime,
    bool withDelegatecall,
    bytes resultData
  );

  /**
   * @notice Function, called by Governance, that executes a transaction, returns the callData executed
   * @param target smart contract target
   * @param value wei value of the transaction
   * @param signature function signature of the transaction
   * @param data function arguments of the transaction or callData if signature empty
   * @param withDelegatecall boolean, true = transaction delegatecalls the target, else calls the target
   * @return result data of the execution call.
   **/
  function executeTransaction(
    address target,
    uint256 value,
    string memory signature,
    bytes memory data,
    bool withDelegatecall
  ) external payable returns (bytes memory);
}
