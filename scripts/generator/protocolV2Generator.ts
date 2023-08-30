import {Hex, PublicClient, getContract} from 'viem';
import {AddressInfo, PoolConfig, ReserveData} from '../configs/types';
import {UI_POOL_DATA_PROVIDER_ABI} from '../abi/uipooldata_provider';
import {VARIABLE_DEBT_TOKEN_ABI} from '../abi/variableDebtToken_v3_abi';
import {STABLE_DEBT_TOKEN_ABI} from '../abi/stableDebtToken_v3_abi';
import {addressOrZero, bytes32toAddress, getImplementationStorageSlot} from '../helpers';
import {RPC_PROVIDERS} from './clients';
import {getChainName} from './chains';
import {writeFileSync} from 'fs';
import {generateJsLibrary, generateSolidityLibrary, prefixWithPragma} from './utils';
import {ADDRESS_PROVIDER_V2_ABI} from '../abi/address_provider_v2_abi';
import {LENDING_POOL_V2_ABI} from '../abi/lending_pool_v2_abi';
import {A_TOKEN_V2_ABI} from '../abi/aToken_v2_abi';
import {INCENTIVES_CONTROLLER_ABI} from '../abi/incentivesController_abi';

export interface PoolV2Addresses {
  POOL_ADDRESSES_PROVIDER: AddressInfo;
  POOL: AddressInfo;
  AAVE_PROTOCOL_DATA_PROVIDER: AddressInfo;
  POOL_CONFIGURATOR: AddressInfo;
  ORACLE: AddressInfo;
  LENDING_RATE_ORACLE: AddressInfo;
  ADMIN: AddressInfo;
  EMERGENCY_ADMIN: AddressInfo;
  COLLECTOR: AddressInfo;
  EMISSION_MANAGER: AddressInfo;
  DEFAULT_INCENTIVES_CONTROLLER: AddressInfo;
  [key: `DEFAULT_A_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  [key: `DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  [key: `DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  reservesData: ReserveData[];
}

async function getAdditionalTokenInfo(
  publicClient: PublicClient,
  pool: PoolConfig,
  reservesData: PoolV2Addresses['reservesData'],
): Promise<{
  COLLECTOR: AddressInfo;
  [key: `DEFAULT_A_TOKEN_IMPL_REV_${number}`]: Hex;
  [key: `DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${number}`]: Hex;
  [key: `DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${number}`]: Hex;
}> {
  if (reservesData.length > 0) {
    const aTokenContract = getContract({
      address: reservesData[0].aTokenAddress,
      abi: A_TOKEN_V2_ABI,
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

    const [COLLECTOR, aTokenImplSlot, aTokenImplRevision, vTokenImplSlot, sTokenImplSlot] =
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
      COLLECTOR: {value: COLLECTOR, type: 'ICollector'},
      [`DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision}`]: defaultATokenImplementation,
      [`DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision}`]:
        defaultVariableDebtTokenImplementation,
      [`DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision}`]:
        defaultStableDebtTokenImplementation,
    };
  }
  return {
    COLLECTOR: {value: addressOrZero(pool.initial?.COLLECTOR), type: 'ICollector'},
    DEFAULT_A_TOKEN_IMPL_REV_1: addressOrZero(pool.initial?.DEFAULT_A_TOKEN_IMPL),
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1: addressOrZero(
      pool.initial?.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL,
    ),
    DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1: addressOrZero(
      pool.initial?.DEFAULT_STABLE_DEBT_TOKEN_IMPL,
    ),
  };
}

export async function getPoolV2Addresses(pool: PoolConfig): Promise<PoolV2Addresses> {
  const publicClient = RPC_PROVIDERS[pool.chainId];
  const addressProviderContract = getContract({
    address: pool.POOL_ADDRESSES_PROVIDER,
    abi: ADDRESS_PROVIDER_V2_ABI,
    publicClient,
  });
  try {
    const [
      POOL,
      LENDING_RATE_ORACLE,
      POOL_CONFIGURATOR,
      ORACLE,
      ADMIN,
      EMERGENCY_ADMIN,
      AAVE_PROTOCOL_DATA_PROVIDER,
    ] = await Promise.all([
      addressProviderContract.read.getLendingPool(),
      addressProviderContract.read.getLendingRateOracle(),
      addressProviderContract.read.getLendingPoolConfigurator(),
      addressProviderContract.read.getPriceOracle(),
      addressProviderContract.read.getPoolAdmin(),
      addressProviderContract.read.getEmergencyAdmin(),
      addressProviderContract.read.getAddress([
        '0x0100000000000000000000000000000000000000000000000000000000000000',
      ]),
    ]);

    let reservesData: PoolV2Addresses['reservesData'] = [];
    // workaround, fix before merge
    // didn't find all the ui pool data provider addresses, so currently there are gaps
    if (pool.additionalAddresses.UI_POOL_DATA_PROVIDER) {
      const uiPoolDataProvider = getContract({
        address: pool.additionalAddresses.UI_POOL_DATA_PROVIDER,
        abi: UI_POOL_DATA_PROVIDER_ABI,
        publicClient,
      });
      reservesData = (
        await uiPoolDataProvider.read.getReservesData([pool.POOL_ADDRESSES_PROVIDER])
      )[0].map((reserve) => {
        return {
          symbol: reserve.symbol,
          underlyingAsset: reserve.underlyingAsset,
          decimals: Number(reserve.decimals),
          aTokenAddress: reserve.aTokenAddress,
          stableDebtTokenAddress: reserve.stableDebtTokenAddress,
          variableDebtTokenAddress: reserve.variableDebtTokenAddress,
          interestRateStrategyAddress: reserve.interestRateStrategyAddress,
          priceOracle: reserve.priceOracle,
        };
      });
    }

    const {COLLECTOR, ...rest} = await getAdditionalTokenInfo(publicClient, pool, reservesData);

    // Note: needed as i didn't find an upto date uipooldataprovider for arc
    const lendingPoolContract = getContract({
      address: POOL,
      abi: LENDING_POOL_V2_ABI,
      publicClient,
    });
    const reserves = await lendingPoolContract.read.getReservesList();
    const data = await lendingPoolContract.read.getReserveData([reserves[0]]);

    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = getContract({
      address: data.aTokenAddress,
      abi: A_TOKEN_V2_ABI,
      publicClient,
    });

    const DEFAULT_INCENTIVES_CONTROLLER = await aTokenContract.read.getIncentivesController();

    let EMISSION_MANAGER: Hex = '0x0000000000000000000000000000000000000000';
    try {
      const incentivesControllerContract = getContract({
        address: DEFAULT_INCENTIVES_CONTROLLER,
        abi: INCENTIVES_CONTROLLER_ABI,
        publicClient,
      });
      EMISSION_MANAGER = await incentivesControllerContract.read.EMISSION_MANAGER();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    return {
      POOL_ADDRESSES_PROVIDER: {
        value: pool.POOL_ADDRESSES_PROVIDER,
        type: 'ILendingPoolAddressesProvider',
      },
      POOL: {value: POOL, type: 'ILendingPool'},
      POOL_CONFIGURATOR: {
        value: POOL_CONFIGURATOR,
        type: 'ILendingPoolConfigurator',
      },
      ORACLE: {
        value: ORACLE,
        type: 'IAaveOracle',
      },
      LENDING_RATE_ORACLE: {value: LENDING_RATE_ORACLE, type: 'ILendingRateOracle'},
      AAVE_PROTOCOL_DATA_PROVIDER: {value: AAVE_PROTOCOL_DATA_PROVIDER, type: 'IPoolDataProvider'},
      ADMIN,
      EMERGENCY_ADMIN,
      COLLECTOR,
      DEFAULT_INCENTIVES_CONTROLLER,
      ...rest,
      EMISSION_MANAGER,
      reservesData,
    };
  } catch (error: any) {
    throw new Error(JSON.stringify({message: error.message, pool, stack: error.stack}));
  }
}

export async function generateProtocolV2Library(config: PoolConfig) {
  const {reservesData, ...addresses} = await getPoolV2Addresses(config);
  const name = `AaveV2${getChainName(config.chainId)}`;
  const provider = RPC_PROVIDERS[config.chainId];

  writeFileSync(
    `./src/${name}.sol`,
    prefixWithPragma(generateSolidityLibrary(provider, addresses, name)),
  );
  writeFileSync(`./src/ts/${name}.ts`, generateJsLibrary(provider, addresses));
  return name;
}
