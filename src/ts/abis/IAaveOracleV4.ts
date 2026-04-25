export const IAaveOracleV4_ABI = [
  {
    type: 'function',
    name: 'getReserveSource',
    inputs: [{name: 'reserveId', type: 'uint256'}],
    outputs: [{name: '', type: 'address'}],
    stateMutability: 'view',
  },
] as const;
