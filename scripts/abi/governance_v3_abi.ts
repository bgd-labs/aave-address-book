export const GOVERNANCE_V3_ABI = [
  {
    inputs: [
      {
        internalType: 'address',
        name: 'crossChainController',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'coolDownPeriod',
        type: 'uint256',
      },
      {
        internalType: 'address',
        name: 'cancellationFeeCollector',
        type: 'address',
      },
    ],
    stateMutability: 'nonpayable',
    type: 'constructor',
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
        name: 'to',
        type: 'address',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'cancellationFee',
        type: 'uint256',
      },
      {
        indexed: true,
        internalType: 'bool',
        name: 'success',
        type: 'bool',
      },
    ],
    name: 'CancellationFeeRedeemed',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: 'uint256',
        name: 'cancellationFee',
        type: 'uint256',
      },
    ],
    name: 'CancellationFeeUpdated',
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
        indexed: false,
        internalType: 'address',
        name: 'oldGuardian',
        type: 'address',
      },
      {
        indexed: false,
        internalType: 'address',
        name: 'newGuardian',
        type: 'address',
      },
    ],
    name: 'GuardianUpdated',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: 'uint8',
        name: 'version',
        type: 'uint8',
      },
    ],
    name: 'Initialized',
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
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
      {
        indexed: true,
        internalType: 'address',
        name: 'payloadsController',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'uint256',
        name: 'chainId',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'payloadNumberOnProposal',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'numberOfPayloadsOnProposal',
        type: 'uint256',
      },
    ],
    name: 'PayloadSent',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'address',
        name: 'newPowerStrategy',
        type: 'address',
      },
    ],
    name: 'PowerStrategyUpdated',
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
    ],
    name: 'ProposalCanceled',
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
        name: 'creator',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'enum PayloadsControllerUtils.AccessControl',
        name: 'accessLevel',
        type: 'uint8',
      },
      {
        indexed: false,
        internalType: 'bytes32',
        name: 'ipfsHash',
        type: 'bytes32',
      },
    ],
    name: 'ProposalCreated',
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
    ],
    name: 'ProposalExecuted',
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
        internalType: 'uint128',
        name: 'votesFor',
        type: 'uint128',
      },
      {
        indexed: false,
        internalType: 'uint128',
        name: 'votesAgainst',
        type: 'uint128',
      },
    ],
    name: 'ProposalFailed',
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
        internalType: 'uint128',
        name: 'votesFor',
        type: 'uint128',
      },
      {
        indexed: false,
        internalType: 'uint128',
        name: 'votesAgainst',
        type: 'uint128',
      },
    ],
    name: 'ProposalQueued',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'address',
        name: 'voter',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'address',
        name: 'representative',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'uint256',
        name: 'chainId',
        type: 'uint256',
      },
    ],
    name: 'RepresentativeUpdated',
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
        indexed: false,
        internalType: 'struct IVotingMachineWithProofs.VotingAssetWithSlot[]',
        name: 'votingAssetsWithSlot',
        type: 'tuple[]',
      },
    ],
    name: 'VoteForwarded',
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
        name: 'snapshotBlockHash',
        type: 'bytes32',
      },
      {
        indexed: false,
        internalType: 'uint24',
        name: 'votingDuration',
        type: 'uint24',
      },
    ],
    name: 'VotingActivated',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'enum PayloadsControllerUtils.AccessControl',
        name: 'accessLevel',
        type: 'uint8',
      },
      {
        indexed: false,
        internalType: 'uint24',
        name: 'votingDuration',
        type: 'uint24',
      },
      {
        indexed: false,
        internalType: 'uint24',
        name: 'coolDownBeforeVotingStart',
        type: 'uint24',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'yesThreshold',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'yesNoDifferential',
        type: 'uint256',
      },
      {
        indexed: false,
        internalType: 'uint256',
        name: 'minPropositionPower',
        type: 'uint256',
      },
    ],
    name: 'VotingConfigUpdated',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'address',
        name: 'votingPortal',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'bool',
        name: 'approved',
        type: 'bool',
      },
    ],
    name: 'VotingPortalUpdated',
    type: 'event',
  },
  {
    inputs: [],
    name: 'ACHIEVABLE_VOTING_PARTICIPATION',
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
    name: 'CANCELLATION_FEE_COLLECTOR',
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
    name: 'COOLDOWN_PERIOD',
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
    name: 'MIN_VOTING_DURATION',
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
    name: 'PRECISION_DIVIDER',
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
    name: 'PROPOSAL_EXPIRATION_TIME',
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
    name: 'VOTING_TOKENS_CAP',
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
    name: 'activateVoting',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address[]',
        name: 'votingPortals',
        type: 'address[]',
      },
    ],
    name: 'addVotingPortals',
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
    name: 'cancelProposal',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: 'uint256',
            name: 'chain',
            type: 'uint256',
          },
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            internalType: 'address',
            name: 'payloadsController',
            type: 'address',
          },
          {
            internalType: 'uint40',
            name: 'payloadId',
            type: 'uint40',
          },
        ],
        internalType: 'struct PayloadsControllerUtils.Payload[]',
        name: 'payloads',
        type: 'tuple[]',
      },
      {
        internalType: 'address',
        name: 'votingPortal',
        type: 'address',
      },
      {
        internalType: 'bytes32',
        name: 'ipfsHash',
        type: 'bytes32',
      },
    ],
    name: 'createProposal',
    outputs: [
      {
        internalType: 'uint256',
        name: '',
        type: 'uint256',
      },
    ],
    stateMutability: 'payable',
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
    name: 'executeProposal',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [],
    name: 'getCancellationFee',
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
    inputs: [],
    name: 'getPowerStrategy',
    outputs: [
      {
        internalType: 'contract IGovernancePowerStrategy',
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
    name: 'getProposal',
    outputs: [
      {
        components: [
          {
            internalType: 'enum IGovernanceCore.State',
            name: 'state',
            type: 'uint8',
          },
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            internalType: 'uint40',
            name: 'creationTime',
            type: 'uint40',
          },
          {
            internalType: 'uint24',
            name: 'votingDuration',
            type: 'uint24',
          },
          {
            internalType: 'uint40',
            name: 'votingActivationTime',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'queuingTime',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'cancelTimestamp',
            type: 'uint40',
          },
          {
            internalType: 'address',
            name: 'creator',
            type: 'address',
          },
          {
            internalType: 'address',
            name: 'votingPortal',
            type: 'address',
          },
          {
            internalType: 'bytes32',
            name: 'snapshotBlockHash',
            type: 'bytes32',
          },
          {
            internalType: 'bytes32',
            name: 'ipfsHash',
            type: 'bytes32',
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
            name: 'cancellationFee',
            type: 'uint256',
          },
          {
            components: [
              {
                internalType: 'uint256',
                name: 'chain',
                type: 'uint256',
              },
              {
                internalType: 'enum PayloadsControllerUtils.AccessControl',
                name: 'accessLevel',
                type: 'uint8',
              },
              {
                internalType: 'address',
                name: 'payloadsController',
                type: 'address',
              },
              {
                internalType: 'uint40',
                name: 'payloadId',
                type: 'uint40',
              },
            ],
            internalType: 'struct PayloadsControllerUtils.Payload[]',
            name: 'payloads',
            type: 'tuple[]',
          },
        ],
        internalType: 'struct IGovernanceCore.Proposal',
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
        internalType: 'enum IGovernanceCore.State',
        name: '',
        type: 'uint8',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'getProposalsCount',
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
        internalType: 'address',
        name: 'voter',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'chainId',
        type: 'uint256',
      },
    ],
    name: 'getRepresentativeByChain',
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
        name: 'representative',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'chainId',
        type: 'uint256',
      },
    ],
    name: 'getRepresentedVotersByChain',
    outputs: [
      {
        internalType: 'address[]',
        name: '',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'enum PayloadsControllerUtils.AccessControl',
        name: 'accessLevel',
        type: 'uint8',
      },
    ],
    name: 'getVotingConfig',
    outputs: [
      {
        components: [
          {
            internalType: 'uint24',
            name: 'coolDownBeforeVotingStart',
            type: 'uint24',
          },
          {
            internalType: 'uint24',
            name: 'votingDuration',
            type: 'uint24',
          },
          {
            internalType: 'uint56',
            name: 'yesThreshold',
            type: 'uint56',
          },
          {
            internalType: 'uint56',
            name: 'yesNoDifferential',
            type: 'uint56',
          },
          {
            internalType: 'uint56',
            name: 'minPropositionPower',
            type: 'uint56',
          },
        ],
        internalType: 'struct IGovernanceCore.VotingConfig',
        name: '',
        type: 'tuple',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'getVotingPortalsCount',
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
    name: 'guardian',
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
        name: 'owner',
        type: 'address',
      },
      {
        internalType: 'address',
        name: 'guardian',
        type: 'address',
      },
      {
        internalType: 'contract IGovernancePowerStrategy',
        name: 'powerStrategy',
        type: 'address',
      },
      {
        components: [
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            internalType: 'uint24',
            name: 'coolDownBeforeVotingStart',
            type: 'uint24',
          },
          {
            internalType: 'uint24',
            name: 'votingDuration',
            type: 'uint24',
          },
          {
            internalType: 'uint256',
            name: 'yesThreshold',
            type: 'uint256',
          },
          {
            internalType: 'uint256',
            name: 'yesNoDifferential',
            type: 'uint256',
          },
          {
            internalType: 'uint256',
            name: 'minPropositionPower',
            type: 'uint256',
          },
        ],
        internalType: 'struct IGovernanceCore.SetVotingConfigInput[]',
        name: 'votingConfigs',
        type: 'tuple[]',
      },
      {
        internalType: 'address[]',
        name: 'votingPortals',
        type: 'address[]',
      },
      {
        internalType: 'uint256',
        name: 'gasLimit',
        type: 'uint256',
      },
      {
        internalType: 'uint256',
        name: 'cancellationFee',
        type: 'uint256',
      },
    ],
    name: 'initialize',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address',
        name: 'votingPortal',
        type: 'address',
      },
    ],
    name: 'isVotingPortalApproved',
    outputs: [
      {
        internalType: 'bool',
        name: '',
        type: 'bool',
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
        internalType: 'uint256',
        name: 'proposalId',
        type: 'uint256',
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
    ],
    name: 'queueProposal',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint256[]',
        name: 'proposalIds',
        type: 'uint256[]',
      },
    ],
    name: 'redeemCancellationFee',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address[]',
        name: 'votingPortals',
        type: 'address[]',
      },
    ],
    name: 'removeVotingPortals',
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
        internalType: 'address',
        name: 'votingPortal',
        type: 'address',
      },
    ],
    name: 'rescueVotingPortal',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'contract IGovernancePowerStrategy',
        name: 'powerStrategy',
        type: 'address',
      },
    ],
    name: 'setPowerStrategy',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            internalType: 'uint24',
            name: 'coolDownBeforeVotingStart',
            type: 'uint24',
          },
          {
            internalType: 'uint24',
            name: 'votingDuration',
            type: 'uint24',
          },
          {
            internalType: 'uint256',
            name: 'yesThreshold',
            type: 'uint256',
          },
          {
            internalType: 'uint256',
            name: 'yesNoDifferential',
            type: 'uint256',
          },
          {
            internalType: 'uint256',
            name: 'minPropositionPower',
            type: 'uint256',
          },
        ],
        internalType: 'struct IGovernanceCore.SetVotingConfigInput[]',
        name: 'votingConfigs',
        type: 'tuple[]',
      },
    ],
    name: 'setVotingConfigs',
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
        name: 'cancellationFee',
        type: 'uint256',
      },
    ],
    name: 'updateCancellationFee',
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
  {
    inputs: [
      {
        internalType: 'address',
        name: 'newGuardian',
        type: 'address',
      },
    ],
    name: 'updateGuardian',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        components: [
          {
            internalType: 'address',
            name: 'representative',
            type: 'address',
          },
          {
            internalType: 'uint256',
            name: 'chainId',
            type: 'uint256',
          },
        ],
        internalType: 'struct IGovernanceCore.RepresentativeInput[]',
        name: 'representatives',
        type: 'tuple[]',
      },
    ],
    name: 'updateRepresentativesForChain',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
];
