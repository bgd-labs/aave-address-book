import {governanceConfigMainnet} from 'scripts/configs/governance/ethereum';
import {mainnetProtoV3Pool} from 'scripts/configs/pools/ethereum';

/**
 * @dev An abi interface is either a forge identifier (the file name / path is used as the export name)
 * or an explicit `{path, name}` pair when the export name must differ from the interface name to avoid
 * collisions (e.g. the V4 `IAaveOracle` interface is exported as `IAaveOracleV4`).
 */
export type AbiInterface = string | {path: string; name: string};

/**
 * @dev Resolves an abi interface entry to the forge path passed to `forge inspect` and the name used
 * for the generated file and its `_ABI` export.
 */
export function resolveAbiInterface(entry: AbiInterface): {path: string; name: string} {
  if (typeof entry === 'string') {
    const match = entry.match(/\/([^/]+)\.sol$/);
    return {path: entry, name: match ? match[1] : entry};
  }
  return entry;
}

/**
 * @dev These abis can be inferred directly from code as they exist as a dependency
 * For contracts that are not unique, the path needs to be prefixed
 */
export const ABI_INTERFACES: AbiInterface[] = [
  'ICollector',
  'lib/aave-v3-origin/src/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol',
  'IVotingMachineWithProofs',
  'IVotingStrategy',
  'IVotingPortal',
  'IGovernancePowerStrategy',
  'IDataWarehouse',
  'IExecutorWithTimelock',
  'IAToken',
  'IExecutor',
  'ICrossChainController',
  'IWithGuardian',
  'lib/aave-v3-origin/lib/solidity-utils/src/contracts/utils/interfaces/IRescuable.sol',
  'lib/aave-v3-origin/src/contracts/interfaces/IACLManager.sol',
  'ILendingPool',
  'ILendingPoolAddressesProvider',
  'ILendingPoolConfigurator',
  'IStakeToken',
  {path: 'lib/aave-v4/src/hub/interfaces/IHub.sol', name: 'IHubV4'},
  {path: 'lib/aave-v4/src/spoke/interfaces/ISpoke.sol', name: 'ISpokeV4'},
  {path: 'lib/aave-v4/src/spoke/interfaces/ITokenizationSpoke.sol', name: 'ITokenizationSpokeV4'},
  {path: 'lib/aave-v4/src/spoke/interfaces/IAaveOracle.sol', name: 'IAaveOracleV4'},
  'lib/aave-v4/src/hub/interfaces/IHubConfigurator.sol',
  'lib/aave-v4/src/spoke/interfaces/ISpokeConfigurator.sol',
  'lib/aave-v4/src/config-engine/interfaces/IAaveV4ConfigEngine.sol',
  'lib/aave-v4/src/position-manager/interfaces/IGiverPositionManager.sol',
  'lib/aave-v4/src/position-manager/interfaces/ITakerPositionManager.sol',
  'lib/aave-v4/src/position-manager/interfaces/IConfigPositionManager.sol',
  'lib/aave-v4/src/position-manager/interfaces/INativeTokenGateway.sol',
  'lib/aave-v4/src/position-manager/interfaces/ISignatureGateway.sol',
  'lib/aave-v4/src/access/interfaces/IAccessManagerEnumerable.sol',
];

/**
 * @dev These abis cannot be inferred as they don't exist as a dependency on this repo.
 * Therefore we use forge download & forge inspect to fetch them from on-chain contracts
 */
export const DOWNLOAD_ABI_INTERFACES = [
  {
    address: governanceConfigMainnet.ADDRESSES.PC_DATA_HELPER,
    name: 'IPayloadsControllerDataHelper',
  },
  {
    address: governanceConfigMainnet.ADDRESSES.GOV_DATA_HELPER,
    name: 'IGovernanceDataHelper',
  },
  {
    address: governanceConfigMainnet.ADDRESSES.META_DELEGATE_HELPER,
    name: 'IMetaDelegateHelper',
  },
  {
    address: governanceConfigMainnet.ADDRESSES.VM_DATA_HELPER,
    name: 'IVotingMachineDataHelper',
  },
  {
    address: mainnetProtoV3Pool.additionalAddresses.UI_POOL_DATA_PROVIDER,
    name: 'IUiPoolDataProvider',
  },
  {
    address: mainnetProtoV3Pool.additionalAddresses.RISK_STEWARD,
    name: 'IRiskSteward',
  },
  {
    address: '0x5D4Aa78B08Bc7C530e21bf7447988b1Be7991322',
    name: 'IAaveToken',
  },
  {
    address: '0x0fE58FE1CaA69951dC924A8c222bE19013B89476',
    name: 'IStkAaveToken',
  },
  {
    address: '0x366AE337897223AEa70e3EBe1862219386f20593',
    name: 'IATokenWithDelegation',
  },
  {
    address: '0x85C3371044e49782DbE3dC23de1D77a078aFb5d0',
    name: 'IUmbrellaRewardsController',
  },
  {
    address: '0xDE00aC600900ae5833F0aDbf601A1DAEbD16B482',
    name: 'IUmbrella',
  },
  {
    address: '0x75e8aC0c063B6966E2A9954adEdf39BdE9370197',
    name: 'IUmbrellaStakeToken',
  },
];
