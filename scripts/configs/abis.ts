import {ChainId} from '../generator/chains';
import {governanceConfigMainnet} from './governance/ethereum';

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
];
