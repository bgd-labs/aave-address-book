import {Hex, getContract, zeroAddress} from 'viem';
import {AddressInfo, PoolConfig, ReserveData} from '../configs/types';
import {ADDRESS_PROVIDER_V3_ABI} from '../abi/address_provider_v3_abi';
import {REWARDS_CONTROLLER_ABI} from '../abi/rewardsController_v3_abi';
import {UI_POOL_DATA_PROVIDER_ABI} from '../abi/uipooldata_provider';
import {STATIC_A_TOKEN_FACTORY_ABI} from '../abi/static_a_token_factory_abi';
import {A_TOKEN_V3_ABI} from '../abi/aToken_v3_abi';
import {VARIABLE_DEBT_TOKEN_ABI} from '../abi/variableDebtToken_v3_abi';
import {STABLE_DEBT_TOKEN_ABI} from '../abi/stableDebtToken_v3_abi';
import {addressOrZero, bytes32toAddress, getImplementationStorageSlot} from '../helpers';
import {RPC_PROVIDERS} from './clients';
import {getChainName} from './chains';
import {writeFileSync} from 'fs';
import {generateJsLibrary, generateSolidityLibrary, prefixWithPragma} from './utils';

export interface PoolV3WithAddresses {
  pool: Hex;
  poolDataProvider: Hex;
  poolConfigurator: Hex;
  oracle: Hex;
  oracleSentinel: Hex;
  aclAdmin: Hex;
  aclManager: Hex;
  collector: Hex;
  defaultATokenImplementation: Hex;
  aTokenRevision: number;
  defaultVariableDebtTokenImplementation: Hex;
  variableDebtTokenRevision: number;
  defaultStableDebtTokenImplementation: Hex;
  stableDebtTokenRevision: number;
  emissionManager: Hex;
  defaultIncentivesController: Hex;
  reservesData: ReserveData[];
}

function enhanceProtocolAddressesTypes<T extends {[key: string]: Hex | number}>(addresses: T) {
  return Object.keys(addresses).reduce(
    (acc, key) => {
      console.log(typeof addresses[key], addresses[key]);
      if (typeof addresses[key] === 'number') {
        acc[key] = {value: addresses[key], type: 'uint256'};
      } else {
        acc[key] = {value: addresses[key], type: 'address'};
      }
      return acc;
    },
    {} as {[key: string]: AddressInfo},
  );
}

export async function getPoolV3Addresses(pool: PoolConfig): Promise<PoolV3WithAddresses> {
  const publicClient = RPC_PROVIDERS[pool.chainId];
  const addressProviderContract = getContract({
    address: pool.addressProvider,
    abi: ADDRESS_PROVIDER_V3_ABI,
    publicClient,
  });
  try {
    const [
      poolAddress,
      poolConfigurator,
      oracle,
      oracleSentinel,
      aclAdmin,
      aclManager,
      poolDataProvider,
    ] = await Promise.all([
      addressProviderContract.read.getPool(),
      addressProviderContract.read.getPoolConfigurator(),
      addressProviderContract.read.getPriceOracle(),
      addressProviderContract.read.getPriceOracleSentinel(),
      addressProviderContract.read.getACLAdmin(),
      addressProviderContract.read.getACLManager(),
      addressProviderContract.read.getPoolDataProvider(),
    ]);

    const defaultIncentivesController = await addressProviderContract.read.getAddress([
      '0x703c2c8634bed68d98c029c18f310e7f7ec0e5d6342c590190b3cb8b3ba54532',
    ]);

    let emissionManager: Hex = zeroAddress;
    try {
      const incentivesControllerContract = getContract({
        address: defaultIncentivesController,
        abi: REWARDS_CONTROLLER_ABI,
        publicClient,
      });
      emissionManager = await incentivesControllerContract.read.getEmissionManager();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    let reservesData: PoolV3WithAddresses['reservesData'] = [];
    // workaround, fix before merge
    // didn't find all the ui pool data provider addresses, so currently there are gaps
    if (pool.additionalAddresses.UI_POOL_DATA_PROVIDER) {
      const uiPoolDataProvider = getContract({
        address: pool.additionalAddresses.UI_POOL_DATA_PROVIDER,
        abi: UI_POOL_DATA_PROVIDER_ABI,
        publicClient,
      });
      const staticATokenFactoryContract = pool.additionalAddresses.STATIC_A_TOKEN_FACTORY
        ? getContract({
            address: pool.additionalAddresses.STATIC_A_TOKEN_FACTORY,
            abi: STATIC_A_TOKEN_FACTORY_ABI,
            publicClient,
          })
        : null;
      const data = (await uiPoolDataProvider.read.getReservesData([pool.addressProvider]))[0];
      reservesData = await Promise.all(
        data.map(async (reserve) => {
          let symbol = reserve.symbol;
          const result: ReserveData = {
            symbol,
            underlyingAsset: reserve.underlyingAsset,
            decimals: Number(reserve.decimals),
            aTokenAddress: reserve.aTokenAddress,
            stableDebtTokenAddress: reserve.stableDebtTokenAddress,
            variableDebtTokenAddress: reserve.variableDebtTokenAddress,
            interestRateStrategyAddress: reserve.interestRateStrategyAddress,
            priceOracle: reserve.priceOracle,
          };
          if (staticATokenFactoryContract)
            result.staticATokenAddress = (await staticATokenFactoryContract.read.getStaticAToken([
              reserve.underlyingAsset,
            ])) as Hex;
          return result;
        }),
      );
    }

    if (reservesData.length > 0) {
      /**
       * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
       */

      const aTokenContract = getContract({
        address: reservesData[0].aTokenAddress,
        abi: A_TOKEN_V3_ABI,
        publicClient,
      });
      const variableDebtTokenContract = getContract({
        address: reservesData[0].variableDebtTokenAddress,
        abi: VARIABLE_DEBT_TOKEN_ABI,
        publicClient,
      });
      const stableDebtTokenContract = getContract({
        address: reservesData[0].stableDebtTokenAddress,
        abi: STABLE_DEBT_TOKEN_ABI,
        publicClient,
      });

      const [collector, aTokenImplSlot, aTokenImplRevision, vTokenImplSlot, sTokenImplSlot] =
        await Promise.all([
          aTokenContract.read.RESERVE_TREASURY_ADDRESS(),
          getImplementationStorageSlot(publicClient, reservesData[0].aTokenAddress),
          aTokenContract.read.ATOKEN_REVISION(),
          getImplementationStorageSlot(publicClient, reservesData[0].variableDebtTokenAddress),
          getImplementationStorageSlot(publicClient, reservesData[0].stableDebtTokenAddress),
        ]);

      const defaultATokenImplementation = bytes32toAddress(aTokenImplSlot);

      const aTokenRevision = Number(aTokenImplRevision);

      const defaultVariableDebtTokenImplementation = bytes32toAddress(vTokenImplSlot);

      const variableDebtTokenRevision = Number(
        await variableDebtTokenContract.read.DEBT_TOKEN_REVISION(),
      );

      const defaultStableDebtTokenImplementation = bytes32toAddress(sTokenImplSlot);

      const stableDebtTokenRevision = Number(
        await stableDebtTokenContract.read.DEBT_TOKEN_REVISION(),
      );

      return {
        pool: poolAddress,
        poolConfigurator,
        oracle,
        oracleSentinel,
        aclAdmin,
        aclManager,
        poolDataProvider,
        collector,
        defaultATokenImplementation,
        aTokenRevision,
        defaultVariableDebtTokenImplementation,
        variableDebtTokenRevision,
        defaultStableDebtTokenImplementation,
        stableDebtTokenRevision,
        emissionManager,
        defaultIncentivesController,
        reservesData,
      };
    } else {
      return {
        pool: poolAddress,
        poolConfigurator,
        oracle,
        oracleSentinel,
        aclAdmin,
        aclManager,
        poolDataProvider,
        collector: addressOrZero(pool.initial?.COLLECTOR),
        defaultATokenImplementation: addressOrZero(pool.initial?.DEFAULT_A_TOKEN_IMPL),
        aTokenRevision: 1,
        defaultVariableDebtTokenImplementation: addressOrZero(
          pool.initial?.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL,
        ),
        variableDebtTokenRevision: 1,
        defaultStableDebtTokenImplementation: addressOrZero(
          pool.initial?.DEFAULT_STABLE_DEBT_TOKEN_IMPL,
        ),
        stableDebtTokenRevision: 1,
        emissionManager,
        defaultIncentivesController,
        reservesData,
      };
    }
  } catch (error: any) {
    throw new Error(JSON.stringify({message: error.message, pool, stack: error.stack}));
  }
}

export async function generateProtocolV3Library(config: PoolConfig) {
  const {reservesData, ..._addresses} = await getPoolV3Addresses(config);
  const addresses = enhanceProtocolAddressesTypes(_addresses);
  const name = `AaveV3${getChainName(config.chainId)}`;
  const provider = RPC_PROVIDERS[config.chainId];

  writeFileSync(
    `./src/${name}.sol`,
    prefixWithPragma(generateSolidityLibrary(provider, addresses, name)),
  );
  writeFileSync(`./src/ts/${name}.ts`, generateJsLibrary(provider, addresses));
  return name;
}
