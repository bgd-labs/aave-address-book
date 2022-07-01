// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

interface IAaveGov {
  struct ProposalWithoutVotes {
    uint256 id;
    address creator;
    address executor;
    address[] targets;
    uint256[] values;
    string[] signatures;
    bytes[] calldatas;
    bool[] withDelegatecalls;
    uint256 startBlock;
    uint256 endBlock;
    uint256 executionTime;
    uint256 forVotes;
    uint256 againstVotes;
    bool executed;
    bool canceled;
    address strategy;
    bytes32 ipfsHash;
  }

  enum ProposalState {
    Pending,
    Canceled,
    Active,
    Failed,
    Succeeded,
    Queued,
    Expired,
    Executed
  }

  struct SPropCreateParams {
    address executor;
    address[] targets;
    uint256[] values;
    string[] signatures;
    bytes[] calldatas;
    bool[] withDelegatecalls;
    bytes32 ipfsHash;
  }

  function create(
    address executor,
    address[] memory targets,
    uint256[] memory values,
    string[] memory signatures,
    bytes[] memory calldatas,
    bool[] memory withDelegatecalls,
    bytes32 ipfsHash
  ) external returns (uint256);

  function queue(uint256 proposalId) external;

  function execute(uint256 proposalId) external payable;

  function submitVote(uint256 proposalId, bool support) external;

  function getProposalById(uint256 proposalId)
    external
    view
    returns (ProposalWithoutVotes memory);

  function getProposalState(uint256 proposalId)
    external
    view
    returns (ProposalState);
}

library AaveGovernanceV2 {
  IAaveGov internal constant GOV =
    IAaveGov(0xEC568fffba86c094cf06b22134B23074DFE2252c);

  address public constant SHORT_EXECUTOR =
    0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

  address public constant LONG_EXECUTOR =
    0x61910EcD7e8e942136CE7Fe7943f956cea1CC2f7;
}
