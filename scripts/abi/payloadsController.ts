export const PAYLOADS_CONTROLLER_ABI = [
  {
    inputs: [
      {
        internalType: 'address',
        name: 'crossChainController',
        type: 'address',
      },
      {
        internalType: 'address',
        name: 'messageOriginator',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'originChainId',
        type: 'uint256',
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
        internalType: 'address',
        name: 'caller',
        type: 'address',
      },
      {
        indexed: true,
        internalType: 'address',
        name: 'token',
        type: 'address',
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
        name: 'amount',
        type: 'uint256',
      },
    ],
    name: 'ERC20Rescued',
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
        indexed: true,
        internalType: 'address',
        name: 'executor',
        type: 'address',
      },
      {
        indexed: false,
        internalType: 'uint40',
        name: 'delay',
        type: 'uint40',
      },
    ],
    name: 'ExecutorSet',
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
        name: 'caller',
        type: 'address',
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
        name: 'amount',
        type: 'uint256',
      },
    ],
    name: 'NativeTokensRescued',
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
        indexed: false,
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'PayloadCancelled',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
      {
        indexed: true,
        internalType: 'address',
        name: 'creator',
        type: 'address',
      },
      {
        components: [
          {
            internalType: 'address',
            name: 'target',
            type: 'address',
          },
          {
            internalType: 'bool',
            name: 'withDelegateCall',
            type: 'bool',
          },
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            internalType: 'uint256',
            name: 'value',
            type: 'uint256',
          },
          {
            internalType: 'string',
            name: 'signature',
            type: 'string',
          },
          {
            internalType: 'bytes',
            name: 'callData',
            type: 'bytes',
          },
        ],
        indexed: false,
        internalType: 'struct IPayloadsControllerCore.ExecutionAction[]',
        name: 'actions',
        type: 'tuple[]',
      },
      {
        indexed: true,
        internalType: 'enum PayloadsControllerUtils.AccessControl',
        name: 'maximumAccessLevelRequired',
        type: 'uint8',
      },
    ],
    name: 'PayloadCreated',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'PayloadExecuted',
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
    name: 'PayloadExecutionMessageReceived',
    type: 'event',
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'PayloadQueued',
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
    name: 'EXPIRATION_DELAY',
    outputs: [
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'GRACE_PERIOD',
    outputs: [
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'MAX_EXECUTION_DELAY',
    outputs: [
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'MESSAGE_ORIGINATOR',
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
    name: 'MIN_EXECUTION_DELAY',
    outputs: [
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'ORIGIN_CHAIN_ID',
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
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'cancelPayload',
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
            name: 'target',
            type: 'address',
          },
          {
            internalType: 'bool',
            name: 'withDelegateCall',
            type: 'bool',
          },
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            internalType: 'uint256',
            name: 'value',
            type: 'uint256',
          },
          {
            internalType: 'string',
            name: 'signature',
            type: 'string',
          },
          {
            internalType: 'bytes',
            name: 'callData',
            type: 'bytes',
          },
        ],
        internalType: 'struct IPayloadsControllerCore.ExecutionAction[]',
        name: 'actions',
        type: 'tuple[]',
      },
    ],
    name: 'createPayload',
    outputs: [
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
    ],
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
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
      {
        internalType: 'enum PayloadsControllerUtils.AccessControl',
        name: '',
        type: 'uint8',
      },
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
      },
    ],
    stateMutability: 'pure',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address',
        name: 'to',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'amount',
        type: 'uint256',
      },
    ],
    name: 'emergencyEtherTransfer',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'address',
        name: 'erc20Token',
        type: 'address',
      },
      {
        internalType: 'address',
        name: 'to',
        type: 'address',
      },
      {
        internalType: 'uint256',
        name: 'amount',
        type: 'uint256',
      },
    ],
    name: 'emergencyTokenTransfer',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'executePayload',
    outputs: [],
    stateMutability: 'payable',
    type: 'function',
  },
  {
    inputs: [
      {
        internalType: 'enum PayloadsControllerUtils.AccessControl',
        name: 'accessControl',
        type: 'uint8',
      },
    ],
    name: 'getExecutorSettingsByAccessControl',
    outputs: [
      {
        components: [
          {
            internalType: 'address',
            name: 'executor',
            type: 'address',
          },
          {
            internalType: 'uint40',
            name: 'delay',
            type: 'uint40',
          },
        ],
        internalType: 'struct IPayloadsControllerCore.ExecutorConfig',
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
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'getPayloadById',
    outputs: [
      {
        components: [
          {
            internalType: 'address',
            name: 'creator',
            type: 'address',
          },
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'maximumAccessLevelRequired',
            type: 'uint8',
          },
          {
            internalType: 'enum IPayloadsControllerCore.PayloadState',
            name: 'state',
            type: 'uint8',
          },
          {
            internalType: 'uint40',
            name: 'createdAt',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'queuedAt',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'executedAt',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'cancelledAt',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'expirationTime',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'delay',
            type: 'uint40',
          },
          {
            internalType: 'uint40',
            name: 'gracePeriod',
            type: 'uint40',
          },
          {
            components: [
              {
                internalType: 'address',
                name: 'target',
                type: 'address',
              },
              {
                internalType: 'bool',
                name: 'withDelegateCall',
                type: 'bool',
              },
              {
                internalType: 'enum PayloadsControllerUtils.AccessControl',
                name: 'accessLevel',
                type: 'uint8',
              },
              {
                internalType: 'uint256',
                name: 'value',
                type: 'uint256',
              },
              {
                internalType: 'string',
                name: 'signature',
                type: 'string',
              },
              {
                internalType: 'bytes',
                name: 'callData',
                type: 'bytes',
              },
            ],
            internalType: 'struct IPayloadsControllerCore.ExecutionAction[]',
            name: 'actions',
            type: 'tuple[]',
          },
        ],
        internalType: 'struct IPayloadsControllerCore.Payload',
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
        internalType: 'uint40',
        name: 'payloadId',
        type: 'uint40',
      },
    ],
    name: 'getPayloadState',
    outputs: [
      {
        internalType: 'enum IPayloadsControllerCore.PayloadState',
        name: '',
        type: 'uint8',
      },
    ],
    stateMutability: 'view',
    type: 'function',
  },
  {
    inputs: [],
    name: 'getPayloadsCount',
    outputs: [
      {
        internalType: 'uint40',
        name: '',
        type: 'uint40',
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
        components: [
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            components: [
              {
                internalType: 'address',
                name: 'executor',
                type: 'address',
              },
              {
                internalType: 'uint40',
                name: 'delay',
                type: 'uint40',
              },
            ],
            internalType: 'struct IPayloadsControllerCore.ExecutorConfig',
            name: 'executorConfig',
            type: 'tuple',
          },
        ],
        internalType: 'struct IPayloadsControllerCore.UpdateExecutorInput[]',
        name: 'executors',
        type: 'tuple[]',
      },
    ],
    name: 'initialize',
    outputs: [],
    stateMutability: 'nonpayable',
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
        name: 'message',
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
        components: [
          {
            internalType: 'enum PayloadsControllerUtils.AccessControl',
            name: 'accessLevel',
            type: 'uint8',
          },
          {
            components: [
              {
                internalType: 'address',
                name: 'executor',
                type: 'address',
              },
              {
                internalType: 'uint40',
                name: 'delay',
                type: 'uint40',
              },
            ],
            internalType: 'struct IPayloadsControllerCore.ExecutorConfig',
            name: 'executorConfig',
            type: 'tuple',
          },
        ],
        internalType: 'struct IPayloadsControllerCore.UpdateExecutorInput[]',
        name: 'executors',
        type: 'tuple[]',
      },
    ],
    name: 'updateExecutors',
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
    inputs: [],
    name: 'whoCanRescue',
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
    stateMutability: 'payable',
    type: 'receive',
  },
] as const;
