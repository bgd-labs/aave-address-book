export const VOTING_MACHINE_ABI = [
  {
    inputs: [
      {
        internalType: 'address',
        name: 'crossChainController',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'gasLimit',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: 'l1VotingPortalChainId',
        type: 'uint256',
      },
      {
        internalType: 'contract IVotingStrategy',
        name: 'votingStrategy',
        type: 'address',
      },
      {
        internalType: 'address',
        name: 'l1VotingPortal',
        type: 'address',
      },
      {
        internalType: 'address',
        name: 'governance',
        type: 'address',
      },
    ],
    stateMutability: 'nonpayable',
    type: 'constructor',
  },
  {
    inputs: [],
    name: 'ECDSAInvalidSignature',
    type: 'error',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'length',
        type: 'uint256',
      },
    ],
    name: 'ECDSAInvalidSignatureLength',
    type: 'error',
  },
  {
    inputs: [
      {
        internalType: 'bytes32',
        name: 's',
        type: 'bytes32',
      },
    ],
    name: 'ECDSAInvalidSignatureS',
    type: 'error',
  },
  {
    inputs: [],
    name: 'InvalidShortString',
    type: 'error',
  },
  {
    inputs: [
      {
        internalType: 'string',
        name: 'str',
        type: 'string',
      },
    ],
    name: 'StringTooLong',
    type: 'error',
  },
  {
    anonymous: false,
    inputs: [],
    name: 'EIP712DomainChanged',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'uint256',
        name: 'gasLimit',
        type: 'uint256',
      },
    ],
    name: 'GasLimitUpdated',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'address',
        name: 'originSender',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'uint256',
        name: 'originChainId',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'bytes',
        name: 'message',
        type: 'bytes',
      },
      {
        indexed: false,
        internalType: 'bytes',
        name: 'reason',
        type: 'bytes',
      },
    ],
    name: 'IncorrectTypeMessageReceived',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'address',
        name: 'originSender',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'uint256',
        name: 'originChainId',
        type: 'uint256',
      },
      {
        indexed: true,
        internalType: 'bool',
        name: 'delivered',
        type: 'bool',
      },
      {
        indexed: false,
        internalType: 'enum IVotingPortal.MessageType',
        name: 'messageType',
        type: 'uint8',
      },
      {
        indexed: false,
        internalType: 'bytes',
        name: 'message',
        type: 'bytes',
      },
      {
        indexed: false,
        internalType: 'bytes',
        name: 'reason',
        type: 'bytes',
      },
    ],
    name: 'MessageReceived',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'address',
        name: 'previousOwner',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'address',
        name: 'newOwner',
        type: 'address',
      },
    ],
    name: 'OwnershipTransferred',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'forVotes',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'againstVotes',
        type: 'uint256',
      },
    ],
    name: 'ProposalResultsSent',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        indexed: true,
        internalType: 'bytes32',
        name: 'blockHash',
        type: 'bytes32',
      },
      {
        indexed: false,
        internalType: 'uint24',
        name: 'votingDuration',
        type: 'uint24',
      },
      {
        indexed: true,
        internalType: 'bool',
        name: 'voteCreated',
        type: 'bool',
      },
    ],
    name: 'ProposalVoteConfigurationBridged',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        indexed: true,
        internalType: 'bytes32',
        name: 'l1BlockHash',
        type: 'bytes32',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'startTime',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'endTime',
        type: 'uint256',
      },
    ],
    name: 'ProposalVoteStarted',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        indexed: true,
        internalType: 'address',
        name: 'voter',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'bool',
        name: 'support',
        type: 'bool',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'votingPower',
        type: 'uint256',
      },
    ],
    name: 'VoteEmitted',
    type: 'event',
  },
  {
    inputs: [],
    name: 'CROSS_CHAIN_CONTROLLER',
    outputs: [
      {
        internalType: 'address',
        name: '',
        type: 'address',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'DATA_WAREHOUSE',
    outputs: [
      {
        internalType: 'contract IDataWarehouse',
        name: '',
        type: 'address',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [
      {
        internalType: 'bytes32',
        name: '',
        type: 'bytes32',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'GOVERNANCE',
    outputs: [
      {
        internalType: 'address',
        name: '',
        type: 'address',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'L1_VOTING_PORTAL',
    outputs: [
      {
        internalType: 'address',
        name: '',
        type: 'address',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'L1_VOTING_PORTAL_CHAIN_ID',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'NAME',
    outputs: [
      {
        internalType: 'string',
        name: '',
        type: 'string',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'REPRESENTATIVES_SLOT',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'VOTE_SUBMITTED_BY_REPRESENTATIVE_TYPEHASH',
    outputs: [
      {
        internalType: 'bytes32',
        name: '',
        type: 'bytes32',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'VOTE_SUBMITTED_TYPEHASH',
    outputs: [
      {
        internalType: 'bytes32',
        name: '',
        type: 'bytes32',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'VOTING_ASSET_WITH_SLOT_RAW',
    outputs: [
      {
        internalType: 'string',
        name: '',
        type: 'string',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'VOTING_ASSET_WITH_SLOT_TYPEHASH',
    outputs: [
      {
        internalType: 'bytes32',
        name: '',
        type: 'bytes32',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'VOTING_STRATEGY',
    outputs: [
      {
        internalType: 'contract IVotingStrategy',
        name: '',
        type: 'address',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
    ],
    name: 'closeAndSendVote',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'bytes',
        name: 'message',
        type: 'bytes',
      },
    ],
    name: 'decodeMessage',
    outputs: [
      {
        internalType: 'enum IVotingPortal.MessageType',
        name: '',
        type: 'uint8',
      },
      {
        internalType: 'bytes',
        name: '',
        type: 'bytes',
      },
    ],
    stateMutability: 'pure',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'bytes',
        name: 'message',
        type: 'bytes',
      },
    ],
    name: 'decodeProposalMessage',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
      {
        internalType: 'bytes32',
        name: '',
        type: 'bytes32',
      },
      {
        internalType: 'uint24',
        name: '',
        type: 'uint24',
      },
    ],
    stateMutability: 'pure',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'bytes',
        name: 'message',
        type: 'bytes',
      },
    ],
    name: 'decodeVoteMessage',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
      {
        internalType: 'address',
        name: '',
        type: 'address',
      },
      {
        internalType: 'bool',
        name: '',
        type: 'bool',
      },
      {
        components: [
          {
            internalType: 'address',
            name: 'underlyingAsset',
            type: 'address',
          },
          {
            internalType: 'uint128',
            name: 'slot',
            type: 'uint128',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.VotingAssetWithSlot[]',
        name: '',
        type: 'tuple[]',
      },
    ],
    stateMutability: 'pure',
    type: 'function',
  },
  {
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      {
        internalType: 'bytes1',
        name: 'fields',
        type: 'bytes1',
      },
      {
        internalType: 'string',
        name: 'name',
        type: 'string',
      },
      {
        internalType: 'string',
        name: 'version',
        type: 'string',
      },
      {
        internalType: 'uint256',
        name: 'chainId',
        type: 'uint256',
      },
      {
        internalType: 'address',
        name: 'verifyingContract',
        type: 'address',
      },
      {
        internalType: 'bytes32',
        name: 'salt',
        type: 'bytes32',
      },
      {
        internalType: 'uint256[]',
        name: 'extensions',
        type: 'uint256[]',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'getGasLimit',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
    ],
    name: 'getProposalById',
    outputs: [
      {
        components: [
          {
            internalType: 'uint256',
            name: 'id',
            type: 'uint256',
          },
          {
            internalType: 'bool',
            name: 'sentToGovernance',
            type: 'bool',
          },
          {
            internalType: 'uint40',
            name: 'startTime',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'endTime',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'votingClosedAndSentTimestamp',
            type: 'uint40',
          },
          {
            internalType: 'uint128',
            name: 'forVotes',
            type: 'uint128',
          },
          {
            internalType: 'uint128',
            name: 'againstVotes',
            type: 'uint128',
          },
          {
            internalType: 'uint256',
            name: 'creationBlockNumber',
            type: 'uint256',
          },
          {
            internalType: 'uint256',
            name: 'votingClosedAndSentBlockNumber',
            type: 'uint256',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.ProposalWithoutVotes',
        name: '',
        type: 'tuple',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
    ],
    name: 'getProposalState',
    outputs: [
      {
        internalType: 'enum IVotingMachineWithProofs.ProposalState',
        name: '',
        type: 'uint8',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
    ],
    name: 'getProposalVoteConfiguration',
    outputs: [
      {
        components: [
          {
            internalType: 'uint24',
            name: 'votingDuration',
            type: 'uint24',
          },
          {
            internalType: 'bytes32',
            name: 'l1ProposalBlockHash',
            type: 'bytes32',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.ProposalVoteConfiguration',
        name: '',
        type: 'tuple',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'skip',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: 'size',
        type: 'uint256',
      },
    ],
    name: 'getProposalsVoteConfigurationIds',
    outputs: [
      {
        internalType: 'uint256[]',
        name: '',
        type: 'uint256[]',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address',
        name: 'user',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
    ],
    name: 'getUserProposalVote',
    outputs: [
      {
        components: [
          {
            internalType: 'bool',
            name: 'support',
            type: 'bool',
          },
          {
            internalType: 'uint248',
            name: 'votingPower',
            type: 'uint248',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.Vote',
        name: '',
        type: 'tuple',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'owner',
    outputs: [
      {
        internalType: 'address',
        name: '',
        type: 'address',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address',
        name: 'originSender',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'originChainId',
        type: 'uint256',
      },
      {
        internalType: 'bytes',
        name: 'messageWithType',
        type: 'bytes',
      },
    ],
    name: 'receiveCrossChainMessage',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
    ],
    name: 'startProposalVote',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        internalType: 'bool',
        name: 'support',
        type: 'bool',
      },
      {
        components: [
          {
            internalType: 'address',
            name: 'underlyingAsset',
            type: 'address',
          },
          {
            internalType: 'uint128',
            name: 'slot',
            type: 'uint128',
          },
          {
            internalType: 'bytes',
            name: 'proof',
            type: 'bytes',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.VotingBalanceProof[]',
        name: 'votingBalanceProofs',
        type: 'tuple[]',
      },
    ],
    name: 'submitVote',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        internalType: 'bool',
        name: 'support',
        type: 'bool',
      },
      {
        internalType: 'address',
        name: 'voter',
        type: 'address',
      },
      {
        internalType: 'bytes',
        name: 'proofOfRepresentation',
        type: 'bytes',
      },
      {
        components: [
          {
            internalType: 'address',
            name: 'underlyingAsset',
            type: 'address',
          },
          {
            internalType: 'uint128',
            name: 'slot',
            type: 'uint128',
          },
          {
            internalType: 'bytes',
            name: 'proof',
            type: 'bytes',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.VotingBalanceProof[]',
        name: 'votingBalanceProofs',
        type: 'tuple[]',
      },
    ],
    name: 'submitVoteAsRepresentative',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        internalType: 'address',
        name: 'voter',
        type: 'address',
      },
      {
        internalType: 'address',
        name: 'representative',
        type: 'address',
      },
      {
        internalType: 'bool',
        name: 'support',
        type: 'bool',
      },
      {
        internalType: 'bytes',
        name: 'proofOfRepresentation',
        type: 'bytes',
      },
      {
        components: [
          {
            internalType: 'address',
            name: 'underlyingAsset',
            type: 'address',
          },
          {
            internalType: 'uint128',
            name: 'slot',
            type: 'uint128',
          },
          {
            internalType: 'bytes',
            name: 'proof',
            type: 'bytes',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.VotingBalanceProof[]',
        name: 'votingBalanceProofs',
        type: 'tuple[]',
      },
      {
        components: [
          {
            internalType: 'uint8',
            name: 'v',
            type: 'uint8',
          },
          {
            internalType: 'bytes32',
            name: 'r',
            type: 'bytes32',
          },
          {
            internalType: 'bytes32',
            name: 's',
            type: 'bytes32',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.SignatureParams',
        name: 'signatureParams',
        type: 'tuple',
      },
    ],
    name: 'submitVoteAsRepresentativeBySignature',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
      },
      {
        internalType: 'address',
        name: 'voter',
        type: 'address',
      },
      {
        internalType: 'bool',
        name: 'support',
        type: 'bool',
      },
      {
        components: [
          {
            internalType: 'address',
            name: 'underlyingAsset',
            type: 'address',
          },
          {
            internalType: 'uint128',
            name: 'slot',
            type: 'uint128',
          },
          {
            internalType: 'bytes',
            name: 'proof',
            type: 'bytes',
          },
        ],
        internalType: 'struct IVotingMachineWithProofs.VotingBalanceProof[]',
        name: 'votingBalanceProofs',
        type: 'tuple[]',
      },
      {
        internalType: 'uint8',
        name: 'v',
        type: 'uint8',
      },
      {
        internalType: 'bytes32',
        name: 'r',
        type: 'bytes32',
      },
      {
        internalType: 'bytes32',
        name: 's',
        type: 'bytes32',
      },
    ],
    name: 'submitVoteBySignature',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address',
        name: 'newOwner',
        type: 'address',
      },
    ],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256',
        name: 'gasLimit',
        type: 'uint256',
      },
    ],
    name: 'updateGasLimit',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
];
