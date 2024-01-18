// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
export const IWithGuardian_ABI = [
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
        name: 'newGuardian',
        type: 'address',
      },
    ],
    name: 'updateGuardian',
    outputs: [],
    stateMutability: 'nonpayable',
    type: 'function',
  },
] as const;
