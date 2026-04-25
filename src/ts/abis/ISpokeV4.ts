export const ISpokeV4_ABI = [
  {
    type: 'function',
    name: 'getReserveCount',
    inputs: [],
    outputs: [{name: '', type: 'uint256'}],
    stateMutability: 'view',
  },
  {
    type: 'function',
    name: 'getReserve',
    inputs: [{name: 'reserveId', type: 'uint256'}],
    outputs: [
      {
        name: '',
        type: 'tuple',
        components: [
          {name: 'underlying', type: 'address'},
          {name: 'hub', type: 'address'},
          {name: 'assetId', type: 'uint16'},
          {name: 'decimals', type: 'uint8'},
          {name: 'collateralRisk', type: 'uint24'},
          {name: 'flags', type: 'uint8'},
          {name: 'dynamicConfigKey', type: 'uint32'},
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    name: 'ORACLE',
    inputs: [],
    outputs: [{name: '', type: 'address'}],
    stateMutability: 'view',
  },
] as const;
