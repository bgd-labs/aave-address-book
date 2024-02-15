import {SAFETY_MODULE} from '../generator/safetyModuleGenerator';
import {governanceConfigMainnet} from './governance/ethereum';
import {mainnetProtoV2Pool, mainnetProtoV3Pool} from './pools/ethereum';

export const ABI_INTERFACES = [
  'IAaveGovernanceV2',
  'ICollector',
  'AggregatorInterface',
  'IPayloadsControllerCore',
  'IVotingMachineWithProofs',
  'IGovernanceCore',
  'IVotingStrategy',
  'IVotingPortal',
  'IGovernancePowerStrategy',
  'IDataWarehouse',
  'IExecutorWithTimelock',
  'IERC20',
  'IERC20Detailed',
  'IAToken',
  'IDefaultInterestRateStrategy',
  'IAaveOracle',
  'IExecutor',
  'ICrossChainController',
  'IWithGuardian',
  'IRescuable',
  'IOwnable',
];

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
    address: '0x50f9d4e28309303f0cdcac8af0b569e8b75ab857',
    name: 'IStakeToken',
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
