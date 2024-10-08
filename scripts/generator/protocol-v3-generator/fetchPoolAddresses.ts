import {Address, Client, getContract, zeroAddress} from 'viem';
import {PoolConfig} from '../../configs/types';
import {IPoolAddressesProvider_ABI} from '../../../src/ts/abis/IPoolAddressesProvider';
import {IRewardsController_ABI} from '../../../src/ts/abis/IRewardsController';
import {bytes32toAddress, getImplementationStorageSlot} from '../utils';

export async function fetchPoolAddresses(client: Client, poolConfig: PoolConfig) {
  const addressProviderContract = getContract({
    address: poolConfig.POOL_ADDRESSES_PROVIDER,
    abi: IPoolAddressesProvider_ABI,
    client,
  });

  const [
    POOL,
    POOL_CONFIGURATOR,
    ORACLE,
    PRICE_ORACLE_SENTINEL,
    ACL_ADMIN,
    ACL_MANAGER,
    AAVE_PROTOCOL_DATA_PROVIDER,
  ] = await Promise.all([
    addressProviderContract.read.getPool(),
    addressProviderContract.read.getPoolConfigurator(),
    addressProviderContract.read.getPriceOracle(),
    addressProviderContract.read.getPriceOracleSentinel(),
    addressProviderContract.read.getACLAdmin(),
    addressProviderContract.read.getACLManager(),
    addressProviderContract.read.getPoolDataProvider(),
  ]);

  const [POOL_IMPL, POOL_CONFIGURATOR_IMPL, DEFAULT_INCENTIVES_CONTROLLER] = await Promise.all([
    getImplementationStorageSlot(client, POOL),
    getImplementationStorageSlot(client, POOL_CONFIGURATOR),
    addressProviderContract.read.getAddress([
      '0x703c2c8634bed68d98c029c18f310e7f7ec0e5d6342c590190b3cb8b3ba54532',
    ]),
  ]);

  let EMISSION_MANAGER: Address = zeroAddress;
  try {
    const incentivesControllerContract = getContract({
      address: DEFAULT_INCENTIVES_CONTROLLER,
      abi: IRewardsController_ABI,
      client,
    });
    EMISSION_MANAGER = await incentivesControllerContract.read.getEmissionManager();
  } catch (e) {
    console.log(`old version of incentives controller deployed on ${poolConfig.name}`);
  }

  return {
    POOL_ADDRESSES_PROVIDER: {
      value: poolConfig.POOL_ADDRESSES_PROVIDER,
      type: 'IPoolAddressesProvider',
    },
    POOL: {value: POOL, type: 'IPool'},
    POOL_CONFIGURATOR: {
      value: POOL_CONFIGURATOR,
      type: 'IPoolConfigurator',
    },
    ORACLE: {
      value: ORACLE,
      type: 'IAaveOracle',
    },
    PRICE_ORACLE_SENTINEL,
    ACL_ADMIN,
    ACL_MANAGER: {value: ACL_MANAGER, type: 'IACLManager'},
    AAVE_PROTOCOL_DATA_PROVIDER: {value: AAVE_PROTOCOL_DATA_PROVIDER, type: 'IPoolDataProvider'},
    POOL_IMPL: bytes32toAddress(POOL_IMPL),
    POOL_CONFIGURATOR_IMPL: bytes32toAddress(POOL_CONFIGURATOR_IMPL),
    DEFAULT_INCENTIVES_CONTROLLER,
    EMISSION_MANAGER,
  };
}
