// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IDataWarehouse} from './IDataWarehouse.sol';
import {IVotingStrategy} from './IVotingStrategy.sol';

interface IVotingMachineWithProofs {
  /**
   * @notice Object containing the signature parameters to be able to vote as a representative
   * @param v v part of the voter signature
   * @param r r part of the voter signature
   * @param s s part of the voter signature
   */
  struct SignatureParams {
    uint8 v;
    bytes32 r;
    bytes32 s;
  }

  /**
   * @notice Object to use over submitVoteBySignature and in case of bridging for protect against wrong roots inclusion
   * @param underlyingAsset address of the token on L1, used for voting
   * @param slot base storage position where the balance on underlyingAsset contract resides on L1. (Normally position 0)
   */
  struct VotingAssetWithSlot {
    address underlyingAsset;
    uint128 slot;
  }

  /**
   * @notice object containing the information of a bridged vote
   * @param support indicates if vote is in favor or against the proposal
   * @param votingAssetsWithSlots list of token addresses with storage slots, that the voter will use for voting
   */
  struct BridgedVote {
    bool support;
    VotingAssetWithSlot[] votingAssetsWithSlot;
  }

  /**
   * @notice enum delimiting the possible states a proposal can have on the voting machine
   * @dev ProposalState enum defines the state machine of a proposal being voted, so the order on which the state is
          defined is important. Check logic correctness if new states are added / removed
   */
  enum ProposalState {
    NotCreated,
    Active,
    Finished,
    SentToGovernance
  }

  /**
   * @notice Object with vote information
   * @param support boolean indicating if the vote is in favor or against a proposal
   * @param votingPower the power used for voting
   */
  struct Vote {
    bool support;
    uint248 votingPower;
  }

  /**
   * @notice Object containing a proposal information
   * @param id numeric identification of the proposal
   * @param sentToGovernance boolean indication if the proposal results have been sent back to L1 governance
   * @param startTime timestamp of the start of voting on the proposal
   * @param endTime timestamp when the voting on the proposal finishes (startTime + votingDuration)
   * @param votingClosedAndSentTimestamp timestamp indicating when the vote has been closed and sent to governance chain
   * @param forVotes votes cast in favor of the proposal
   * @param againstVotes votes cast against the proposal
   * @param creationBlockNumber blockNumber from when the proposal has been created in votingMachine
   * @param votingClosedAndSentBlockNumber block from when the vote has been closed and sent to governance chain
   * @param votes mapping indication for every voter of the proposal the information of that vote
   */
  struct Proposal {
    uint256 id;
    bool sentToGovernance;
    uint40 startTime;
    uint40 endTime;
    uint40 votingClosedAndSentTimestamp;
    uint128 forVotes;
    uint128 againstVotes;
    uint256 creationBlockNumber;
    uint256 votingClosedAndSentBlockNumber;
    mapping(address => Vote) votes;
  }

  /**
   * @notice Object containing a proposal information
   * @param id numeric identification of the proposal
   * @param sentToGovernance boolean indication if the proposal results have been sent back to L1 governance
   * @param startTime timestamp of the start of voting on the proposal
   * @param endTime timestamp when the voting on the proposal finishes (startTime + votingDuration)
   * @param votingClosedAndSentTimestamp timestamp indicating when the vote has been closed and sent to governance chain
   * @param forVotes votes cast in favor of the proposal
   * @param againstVotes votes cast against the proposal
   * @param creationBlockNumber blockNumber from when the proposal has been created in votingMachine
   * @param votingClosedAndSentBlockNumber block from when the vote has been closed and sent back to governance chain
   */
  struct ProposalWithoutVotes {
    uint256 id;
    bool sentToGovernance;
    uint40 startTime;
    uint40 endTime;
    uint40 votingClosedAndSentTimestamp;
    uint128 forVotes;
    uint128 againstVotes;
    uint256 creationBlockNumber;
    uint256 votingClosedAndSentBlockNumber;
  }

  /**
   * @notice vote configuration passed from l1
   * @param votingDuration duration in seconds of the vote for a proposal
   * @param l1BlockHash hash of the block on L1 from the block when the proposal was activated for voting (sent to voting machine)
            this block hash is used to delimit from when the voting power is accounted for voting
   */
  struct ProposalVoteConfiguration {
    uint24 votingDuration;
    bytes32 l1ProposalBlockHash;
  }

  /**
   * @notice Object with the necessary information to process a vote
   * @param underlyingAsset address of the token on L1, used for voting
   * @param slot base storage position where the balance on underlyingAsset contract resides on L1. (Normally position 0)
   * @param proof bytes of the generated proof on L1 with the slot information of underlying asset.
   */
  struct VotingBalanceProof {
    address underlyingAsset;
    uint128 slot;
    bytes proof;
  }

  /**
   * @notice emitted when a proposal is created
   * @param proposalId numeric id of the created proposal
   * @param l1BlockHash block hash from the block on l1 from when the proposal was activated for voting
   * @param startTime timestamp when the proposal was created and ready for voting
   * @param endTime timestamp of when the voting period ends. (startTime + votingDuration)
   */
  event ProposalVoteStarted(
    uint256 indexed proposalId,
    bytes32 indexed l1BlockHash,
    uint256 startTime,
    uint256 endTime
  );

  /**
   * @notice emitted when the results of a vote on a proposal are sent to L1
   * @param proposalId numeric id of the proposal which results are sent to L1
   * @param forVotes votes cast in favor of proposal
   * @param againstVotes votes cast against the proposal
   */
  event ProposalResultsSent(uint256 indexed proposalId, uint256 forVotes, uint256 againstVotes);

  /**
   * @notice emitted when a vote is registered
   * @param proposalId Id of the proposal
   * @param voter address of the voter
   * @param support boolean, true = vote for, false = vote against
   * @param votingPower Power of the voter/vote
   */
  event VoteEmitted(
    uint256 indexed proposalId,
    address indexed voter,
    bool indexed support,
    uint256 votingPower
  );

  /**
   * @notice emitted when a voting configuration of a proposal gets received. Meaning that has been bridged successfully
   * @param proposalId id of the proposal bridged to start the vote on
   * @param blockHash hash of the block on L1 when the proposal was activated for voting
   * @param votingDuration duration in seconds of the vote
   * @param voteCreated boolean indicating if the vote has been created or not.
   * @dev the vote will only be created automatically if when the configuration is bridged, all necessary roots
          have been registered already.
   */
  event ProposalVoteConfigurationBridged(
    uint256 indexed proposalId,
    bytes32 indexed blockHash,
    uint24 votingDuration,
    bool indexed voteCreated
  );

  /**
   * @notice method to get the representatives mapping slot in Governance contract
   * @return representatives slot
   */
  function REPRESENTATIVES_SLOT() external view returns (uint256);

  /**
   * @notice method to get the Governance contract address
   * @return Governance address
   */
  function GOVERNANCE() external view returns (address);

  /**
   * @notice method to get the voting asset with slot signature
   * @return signature of the voting asset with slot method
   */
  function VOTING_ASSET_WITH_SLOT_RAW() external view returns (string memory);

  /**
   * @notice method to get the DataWarehouse contract
   * @return DataWarehouse contract
   */
  function DATA_WAREHOUSE() external view returns (IDataWarehouse);

  /**
   * @notice method to get the VotingStrategy contract
   * @return VotingStrategy contract
   */
  function VOTING_STRATEGY() external view returns (IVotingStrategy);

  /**
   * @notice Get the v4 compatible domain separator
   * @dev Return cached value if chainId matches cache, otherwise recomputes separator
   * @return The domain separator of the token at current chain
   */
  function DOMAIN_SEPARATOR() external view returns (bytes32);

  /**
   * @notice method to get the vote submitted type hash for permits digest
   * @return hash of vote submitted string
   */
  function VOTE_SUBMITTED_TYPEHASH() external view returns (bytes32);

  /**
   * @notice method to get the vote submitted by representative type hash for permits digest
   * @return hash of vote submitted by representative string
   */
  function VOTE_SUBMITTED_BY_REPRESENTATIVE_TYPEHASH() external view returns (bytes32);

  /**
   * @notice method to get the voting asset with slot type hash for permits digest
   * @return hash of vote submitted string
   */
  function VOTING_ASSET_WITH_SLOT_TYPEHASH() external view returns (bytes32);

  /**
   * @notice method to get the contract name for permits digest
   * @return contract name string
   */
  function NAME() external view returns (string memory);

  /**
   * @notice method to get a proposal information specified by its id
   * @param proposalId id of the proposal to retrieve
   * @return the proposal information without the users vote
   */
  function getProposalById(uint256 proposalId) external view returns (ProposalWithoutVotes memory);

  /**
   * @notice method to get the state of a proposal specified by its id
   * @param proposalId id of the proposal to retrieve the state of
   * @return the state of the proposal
   */
  function getProposalState(uint256 proposalId) external view returns (ProposalState);

  /**
   * @notice method to get the voting configuration of a proposal specified by its id
   * @param proposalId id of the proposal to retrieve the voting configuration from
   * @return the proposal vote configuration object
   */
  function getProposalVoteConfiguration(
    uint256 proposalId
  ) external view returns (ProposalVoteConfiguration memory);

  /**
  * @notice method to get a paginated list of proposalIds. The proposals are taken from a list of proposals that have
            received vote configuration from governance chain
  * @param skip number of proposal ids to skip. from latest in the list of proposal ids with voting configuration
  * @param size length of proposal ids to ask for.
  * @return list of proposal ids
  * @dev This is mainly used to get a list of proposals that require automation in some step of the proposal live cycle.
  */
  function getProposalsVoteConfigurationIds(
    uint256 skip,
    uint256 size
  ) external view returns (uint256[] memory);

  /**
   * @notice method to get the vote set by a user on a proposal specified by its id
   * @param user address of the user that voted
   * @param proposalId id of the proposal to retrieve the vote from
   * @return the vote (support and voting power) emitted
   */
  function getUserProposalVote(
    address user,
    uint256 proposalId
  ) external view returns (Vote memory);

  /**
    * @notice method to start a vote on a proposal specified by its id.
    * @param proposalId id of the proposal to start the vote on.
    * @return the id of the proposal that had the vote started on.
    * @dev this method can be called by anyone, requiring that the appropriate conditions are met.
           basically that the proper roots have been registered.
           It can also be called internally when the bridged message is received and the the required roots
           have been registered
    */
  function startProposalVote(uint256 proposalId) external returns (uint256);

  /**
    * @notice method to cast a vote on a proposal specified by its id
    * @param proposalId id of the proposal on which the vote will be cast
    * @param support boolean indicating if the vote is in favor or against the proposal
    * @param votingBalanceProofs list of objects containing the information necessary to vote using the tokens
             allowed on the voting strategy.
    * @dev A vote does not need to use all the tokens allowed, can be a subset
    */
  function submitVote(
    uint256 proposalId,
    bool support,
    VotingBalanceProof[] calldata votingBalanceProofs
  ) external;

  /**
   * @notice Function to register the vote of user that has voted offchain via signature
   * @param proposalId id of the proposal
   * @param voter the voter address
   * @param support boolean, true = vote for, false = vote against
   * @param votingBalanceProofs list of voting assets proofs
   * @param v v part of the voter signature
   * @param r r part of the voter signature
   * @param s s part of the voter signature
   */
  function submitVoteBySignature(
    uint256 proposalId,
    address voter,
    bool support,
    VotingBalanceProof[] calldata votingBalanceProofs,
    uint8 v,
    bytes32 r,
    bytes32 s
  ) external;

  /**
   * @notice method to close a vote on a proposal specified by its id and send the results back to governance
   * @param proposalId id of the proposal to close the vote on and send the voting result to governance
   * @dev This method will trigger the bridging flow
   */
  function closeAndSendVote(uint256 proposalId) external;

  /**
   * @notice Function to register the vote of user as its representative
   * @param proposalId id of the proposal
   * @param support boolean, true = vote for, false = vote against
   * @param voter the voter address
   * @param proofOfRepresentation proof that can validate that msg.sender is the voter representative
   * @param votingBalanceProofs list of voting assets proofs
   */
  function submitVoteAsRepresentative(
    uint256 proposalId,
    bool support,
    address voter,
    bytes memory proofOfRepresentation,
    VotingBalanceProof[] calldata votingBalanceProofs
  ) external;

  /**
   * @notice Function to register the vote of user as its representative with a signed message
   * @param proposalId id of the proposal
   * @param voter the voter address
   * @param proofOfRepresentation proof that can validate that msg.sender is the voter representative
   * @param votingBalanceProofs list of voting assets proofs
   * @param signatureParams object containing the necessary signature parameters
   */
  function submitVoteAsRepresentativeBySignature(
    uint256 proposalId,
    address voter,
    address representative,
    bool support,
    bytes memory proofOfRepresentation,
    VotingBalanceProof[] calldata votingBalanceProofs,
    SignatureParams memory signatureParams
  ) external;
}
