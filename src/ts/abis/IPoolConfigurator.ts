// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
export const IPoolConfigurator_ABI = [
  {
    type: 'function',
    name: 'configureReserveAsCollateral',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'ltv',
        type: 'uint256',
        internalType: 'uint256',
      },
      {
        name: 'liquidationThreshold',
        type: 'uint256',
        internalType: 'uint256',
      },
      {
        name: 'liquidationBonus',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'dropReserve',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'initReserves',
    inputs: [
      {
        name: 'input',
        type: 'tuple[]',
        internalType: 'struct ConfiguratorInputTypes.InitReserveInput[]',
        components: [
          {
            name: 'aTokenImpl',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'stableDebtTokenImpl',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'variableDebtTokenImpl',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'underlyingAssetDecimals',
            type: 'uint8',
            internalType: 'uint8',
          },
          {
            name: 'interestRateStrategyAddress',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'underlyingAsset',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'treasury',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'incentivesController',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'aTokenName',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'aTokenSymbol',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'variableDebtTokenName',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'variableDebtTokenSymbol',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'stableDebtTokenName',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'stableDebtTokenSymbol',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'params',
            type: 'bytes',
            internalType: 'bytes',
          },
        ],
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setAssetEModeCategory',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newCategoryId',
        type: 'uint8',
        internalType: 'uint8',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setBorrowCap',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newBorrowCap',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setBorrowableInIsolation',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'borrowable',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setDebtCeiling',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newDebtCeiling',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setEModeCategory',
    inputs: [
      {
        name: 'categoryId',
        type: 'uint8',
        internalType: 'uint8',
      },
      {
        name: 'ltv',
        type: 'uint16',
        internalType: 'uint16',
      },
      {
        name: 'liquidationThreshold',
        type: 'uint16',
        internalType: 'uint16',
      },
      {
        name: 'liquidationBonus',
        type: 'uint16',
        internalType: 'uint16',
      },
      {
        name: 'oracle',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'label',
        type: 'string',
        internalType: 'string',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setLiquidationProtocolFee',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newFee',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setPoolPause',
    inputs: [
      {
        name: 'paused',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveActive',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'active',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveBorrowing',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'enabled',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveFactor',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newReserveFactor',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveFlashLoaning',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'enabled',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveFreeze',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'freeze',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveInterestRateStrategyAddress',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newRateStrategyAddress',
        type: 'address',
        internalType: 'address',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReservePause',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'paused',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setReserveStableRateBorrowing',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'enabled',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setSiloedBorrowing',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'siloed',
        type: 'bool',
        internalType: 'bool',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setSupplyCap',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newSupplyCap',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'setUnbackedMintCap',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        internalType: 'address',
      },
      {
        name: 'newUnbackedMintCap',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'updateAToken',
    inputs: [
      {
        name: 'input',
        type: 'tuple',
        internalType: 'struct ConfiguratorInputTypes.UpdateATokenInput',
        components: [
          {
            name: 'asset',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'treasury',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'incentivesController',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'name',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'symbol',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'implementation',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'params',
            type: 'bytes',
            internalType: 'bytes',
          },
        ],
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'updateBridgeProtocolFee',
    inputs: [
      {
        name: 'newBridgeProtocolFee',
        type: 'uint256',
        internalType: 'uint256',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'updateFlashloanPremiumToProtocol',
    inputs: [
      {
        name: 'newFlashloanPremiumToProtocol',
        type: 'uint128',
        internalType: 'uint128',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'updateFlashloanPremiumTotal',
    inputs: [
      {
        name: 'newFlashloanPremiumTotal',
        type: 'uint128',
        internalType: 'uint128',
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'updateStableDebtToken',
    inputs: [
      {
        name: 'input',
        type: 'tuple',
        internalType: 'struct ConfiguratorInputTypes.UpdateDebtTokenInput',
        components: [
          {
            name: 'asset',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'incentivesController',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'name',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'symbol',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'implementation',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'params',
            type: 'bytes',
            internalType: 'bytes',
          },
        ],
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    name: 'updateVariableDebtToken',
    inputs: [
      {
        name: 'input',
        type: 'tuple',
        internalType: 'struct ConfiguratorInputTypes.UpdateDebtTokenInput',
        components: [
          {
            name: 'asset',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'incentivesController',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'name',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'symbol',
            type: 'string',
            internalType: 'string',
          },
          {
            name: 'implementation',
            type: 'address',
            internalType: 'address',
          },
          {
            name: 'params',
            type: 'bytes',
            internalType: 'bytes',
          },
        ],
      },
    ],
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    name: 'ATokenUpgraded',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'proxy',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'implementation',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'BorrowCapChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldBorrowCap',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newBorrowCap',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'BorrowableInIsolationChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
      {
        name: 'borrowable',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'BridgeProtocolFeeUpdated',
    inputs: [
      {
        name: 'oldBridgeProtocolFee',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newBridgeProtocolFee',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'CollateralConfigurationChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'ltv',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'liquidationThreshold',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'liquidationBonus',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'DebtCeilingChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldDebtCeiling',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newDebtCeiling',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'EModeAssetCategoryChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldCategoryId',
        type: 'uint8',
        indexed: false,
        internalType: 'uint8',
      },
      {
        name: 'newCategoryId',
        type: 'uint8',
        indexed: false,
        internalType: 'uint8',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'EModeCategoryAdded',
    inputs: [
      {
        name: 'categoryId',
        type: 'uint8',
        indexed: true,
        internalType: 'uint8',
      },
      {
        name: 'ltv',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'liquidationThreshold',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'liquidationBonus',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'oracle',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
      {
        name: 'label',
        type: 'string',
        indexed: false,
        internalType: 'string',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'FlashloanPremiumToProtocolUpdated',
    inputs: [
      {
        name: 'oldFlashloanPremiumToProtocol',
        type: 'uint128',
        indexed: false,
        internalType: 'uint128',
      },
      {
        name: 'newFlashloanPremiumToProtocol',
        type: 'uint128',
        indexed: false,
        internalType: 'uint128',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'FlashloanPremiumTotalUpdated',
    inputs: [
      {
        name: 'oldFlashloanPremiumTotal',
        type: 'uint128',
        indexed: false,
        internalType: 'uint128',
      },
      {
        name: 'newFlashloanPremiumTotal',
        type: 'uint128',
        indexed: false,
        internalType: 'uint128',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'LiquidationProtocolFeeChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldFee',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newFee',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveActive',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'active',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveBorrowing',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'enabled',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveDropped',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveFactorChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldReserveFactor',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newReserveFactor',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveFlashLoaning',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'enabled',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveFrozen',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'frozen',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveInitialized',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'aToken',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'stableDebtToken',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
      {
        name: 'variableDebtToken',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
      {
        name: 'interestRateStrategyAddress',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveInterestRateStrategyChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldStrategy',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
      {
        name: 'newStrategy',
        type: 'address',
        indexed: false,
        internalType: 'address',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReservePaused',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'paused',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'ReserveStableRateBorrowing',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'enabled',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'SiloedBorrowingChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldState',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
      {
        name: 'newState',
        type: 'bool',
        indexed: false,
        internalType: 'bool',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'StableDebtTokenUpgraded',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'proxy',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'implementation',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'SupplyCapChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldSupplyCap',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newSupplyCap',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'UnbackedMintCapChanged',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'oldUnbackedMintCap',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
      {
        name: 'newUnbackedMintCap',
        type: 'uint256',
        indexed: false,
        internalType: 'uint256',
      },
    ],
    anonymous: false,
  },
  {
    type: 'event',
    name: 'VariableDebtTokenUpgraded',
    inputs: [
      {
        name: 'asset',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'proxy',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
      {
        name: 'implementation',
        type: 'address',
        indexed: true,
        internalType: 'address',
      },
    ],
    anonymous: false,
  },
] as const;
