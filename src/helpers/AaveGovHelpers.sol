// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.7.5 <0.9.0;
pragma abicoder v2;

import "forge-std/Vm.sol";

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

library AaveGovHelpers {
  IAaveGov internal constant GOV =
    IAaveGov(0xEC568fffba86c094cf06b22134B23074DFE2252c);

  address public constant SHORT_EXECUTOR =
    0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

  address public constant LONG_EXECUTOR =
    0x61910EcD7e8e942136CE7Fe7943f956cea1CC2f7;

  address public constant AAVE = 0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9;

  address internal constant AAVE_WHALE =
    address(0x25F2226B597E8F9514B3F68F00f494cF4f286491);

  function _createProposal(Vm vm, IAaveGov.SPropCreateParams memory params)
    internal
    returns (uint256)
  {
    vm.deal(AAVE_WHALE, 1 ether);
    vm.startPrank(AAVE_WHALE);
    uint256 proposalId = GOV.create(
      params.executor,
      params.targets,
      params.values,
      params.signatures,
      params.calldatas,
      params.withDelegatecalls,
      params.ipfsHash
    );
    vm.stopPrank();
    return proposalId;
  }

  function _getSlot(uint256 proposalId) internal returns (bytes32 slot) {
    uint256 proposalsMapSlot = 0x4;
    return
      bytes32(
        uint256(keccak256(abi.encode(proposalId, proposalsMapSlot))) + 11
      );
  }

  function _passVote(Vm vm, uint256 proposalId) internal {
    uint256 power = 5000000 ether; // 5M, might make sense to calculate needed via quorum? idk
    vm.roll(block.number + 1);
    vm.store(address(GOV), _getSlot(proposalId), bytes32(power));
    uint256 endBlock = GOV.getProposalById(proposalId).endBlock;
    vm.roll(endBlock + 1);
    GOV.queue(proposalId);
    uint256 executionTime = GOV.getProposalById(proposalId).executionTime;
    vm.warp(executionTime + 1);
    GOV.execute(proposalId);
  }

  function _getProposalById(uint256 proposalId)
    internal
    view
    returns (IAaveGov.ProposalWithoutVotes memory)
  {
    return GOV.getProposalById(proposalId);
  }
}
