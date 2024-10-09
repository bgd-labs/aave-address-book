import {Address, Client, getContract, zeroAddress} from 'viem';
import {PoolConfig} from '../../configs/types';
import {bytes32toAddress, getImplementationStorageSlot} from '../utils';
import {ILendingPoolAddressesProvider_ABI} from '../../../src/ts/abis/ILendingPoolAddressesProvider';
import {mainnetAmmV2Pool} from '../../configs/pools/ethereum';

export async function fetchPoolAddresses(client: Client, poolConfig: PoolConfig) {
  const addressProviderContract = getContract({
    address: poolConfig.POOL_ADDRESSES_PROVIDER,
    abi: ILendingPoolAddressesProvider_ABI,
    client,
  });

  const [
    POOL,
    LENDING_RATE_ORACLE,
    POOL_CONFIGURATOR,
    ORACLE,
    POOL_ADMIN,
    EMERGENCY_ADMIN,
    AAVE_PROTOCOL_DATA_PROVIDER,
    LENDING_POOL_COLLATERAL_MANAGER,
  ] = await Promise.all([
    addressProviderContract.read.getLendingPool(),
    addressProviderContract.read.getLendingRateOracle(),
    addressProviderContract.read.getLendingPoolConfigurator(),
    addressProviderContract.read.getPriceOracle(),
    addressProviderContract.read.getPoolAdmin(),
    addressProviderContract.read.getEmergencyAdmin(),
    addressProviderContract.read.getAddress([
      poolConfig.name === mainnetAmmV2Pool.name
        ? '0x1000000000000000000000000000000000000000000000000000000000000000'
        : '0x0100000000000000000000000000000000000000000000000000000000000000',
    ]),
    addressProviderContract.read.getLendingPoolCollateralManager(),
  ]);

  const [POOL_IMPL, POOL_CONFIGURATOR_IMPL] = await Promise.all([
    getImplementationStorageSlot(client, POOL),
    getImplementationStorageSlot(client, POOL_CONFIGURATOR),
  ]);

  return {
    POOL_ADDRESSES_PROVIDER: {
      value: poolConfig.POOL_ADDRESSES_PROVIDER,
      type: 'ILendingPoolAddressesProvider',
    },
    POOL: {value: POOL, type: 'ILendingPool'},
    POOL_IMPL: bytes32toAddress(POOL_IMPL),
    POOL_CONFIGURATOR: {
      value: POOL_CONFIGURATOR,
      type: 'ILendingPoolConfigurator',
    },
    POOL_CONFIGURATOR_IMPL: bytes32toAddress(POOL_CONFIGURATOR_IMPL),
    ORACLE: {
      value: ORACLE,
      type: 'IAaveOracle',
    },
    LENDING_RATE_ORACLE: {value: LENDING_RATE_ORACLE, type: 'ILendingRateOracle'},
    AAVE_PROTOCOL_DATA_PROVIDER: {
      value: AAVE_PROTOCOL_DATA_PROVIDER,
      type: 'IAaveProtocolDataProvider',
    },
    LENDING_POOL_COLLATERAL_MANAGER,
    POOL_ADMIN,
    EMERGENCY_ADMIN,
  };
}
