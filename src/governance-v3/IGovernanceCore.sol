// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PayloadsControllerUtils} from './PayloadsControllerUtils.sol';
import {IVotingMachineWithProofs} from './IVotingMachineWithProofs.sol';
import {IGovernancePowerStrategy} from './IGovernancePowerStrategy.sol';

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
