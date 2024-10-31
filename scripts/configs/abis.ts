import { RISK_STEWARD } from './../../src/ts/AaveV3Avalanche';
import {governanceConfigMainnet} from './governance/ethereum';
import {mainnetProtoV3Pool} from './pools/ethereum';

/**
 * @dev These abis can be inferred directly from code as they exist as a dependency
 * For contracts that are not unique, the path needs to be prefixed
 */
export const ABI_INTERFACES = [
  'ICollector',
  'lib/aave-v3-origin/src/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol:IAaveV3ConfigEngine',
  'AggregatorInterface',
  'IPayloadsControllerCore',
  'IVotingMachineWithProofs',
  'IGovernanceCore',
  'IVotingStrategy',
  'IVotingPortal',
  'IGovernancePowerStrategy',
  'IDataWarehouse',
  'IExecutorWithTimelock',
  'lib/aave-v3-origin/src/contracts/dependencies/openzeppelin/contracts/IERC20.sol:IERC20',
  'IERC20Detailed',
  'IAToken',
  'IDefaultInterestRateStrategy',
  'lib/aave-v3-origin/src/contracts/interfaces/IAaveOracle.sol:IAaveOracle',
  'lib/aave-v3-origin/src/contracts/rewards/interfaces/IRewardsController.sol:IRewardsController',
  'IExecutor',
  'ICrossChainController',
  'IWithGuardian',
  'IRescuable',
  'IOwnable',
  'ILendingPool',
  'ILendingPoolAddressesProvider',
  'ILendingPoolConfigurator',
  'IPool',
  'IPoolAddressesProvider',
  'IPoolConfigurator',
  'IStakeToken',
  'IStataTokenFactory',
  'IStataTokenV2',
  'lib/aave-v3-origin/src/contracts/helpers/interfaces/IWrappedTokenGatewayV3.sol:IWrappedTokenGatewayV3',
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
];
