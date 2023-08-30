import {Hex, PublicClient, getContract, zeroAddress} from 'viem';
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
import {appendFileSync, writeFileSync} from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {generateAssetsLibrary} from './assetsLibraryGenerator';

export interface PoolV3Addresses {
  POOL_ADDRESSES_PROVIDER: AddressInfo;
  POOL: AddressInfo;
  AAVE_PROTOCOL_DATA_PROVIDER: AddressInfo;
  POOL_CONFIGURATOR: AddressInfo;
  ORACLE: AddressInfo;
  PRICE_ORACLE_SENTINEL: AddressInfo;
  ACL_ADMIN: AddressInfo;
  ACL_MANAGER: AddressInfo;
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
  reservesData: PoolV3Addresses['reservesData'],
): Promise<{
  COLLECTOR: AddressInfo;
  [key: `DEFAULT_A_TOKEN_IMPL_REV_${number}`]: Hex;
  [key: `DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${number}`]: Hex;
  [key: `DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${number}`]: Hex;
}> {
  if (reservesData.length > 0) {
    const aTokenContract = getContract({
      address: reservesData[0].A_TOKEN,
      abi: A_TOKEN_V3_ABI,
      publicClient,
    });
    const variableDebtTokenContract = getContract({
      address: reservesData[0].V_TOKEN,
      abi: VARIABLE_DEBT_TOKEN_ABI,
      publicClient,
    });
    const stableDebtTokenContract = getContract({
      address: reservesData[0].S_TOKEN,
      abi: STABLE_DEBT_TOKEN_ABI,
      publicClient,
    });

    const [COLLECTOR, aTokenImplSlot, aTokenImplRevision, vTokenImplSlot, sTokenImplSlot] =
      await Promise.all([
        aTokenContract.read.RESERVE_TREASURY_ADDRESS(),
        getImplementationStorageSlot(publicClient, reservesData[0].A_TOKEN),
        aTokenContract.read.ATOKEN_REVISION(),
        getImplementationStorageSlot(publicClient, reservesData[0].V_TOKEN),
        getImplementationStorageSlot(publicClient, reservesData[0].S_TOKEN),
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

export async function getPoolV3Addresses(pool: PoolConfig): Promise<PoolV3Addresses> {
  const publicClient = RPC_PROVIDERS[pool.chainId];
  const addressProviderContract = getContract({
    address: pool.POOL_ADDRESSES_PROVIDER,
    abi: ADDRESS_PROVIDER_V3_ABI,
    publicClient,
  });
  try {
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

    const DEFAULT_INCENTIVES_CONTROLLER = await addressProviderContract.read.getAddress([
      '0x703c2c8634bed68d98c029c18f310e7f7ec0e5d6342c590190b3cb8b3ba54532',
    ]);

    let EMISSION_MANAGER: Hex = zeroAddress;
    try {
      const incentivesControllerContract = getContract({
        address: DEFAULT_INCENTIVES_CONTROLLER,
        abi: REWARDS_CONTROLLER_ABI,
        publicClient,
      });
      EMISSION_MANAGER = await incentivesControllerContract.read.getEmissionManager();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    let reservesData: PoolV3Addresses['reservesData'] = [];
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
      const data = (
        await uiPoolDataProvider.read.getReservesData([pool.POOL_ADDRESSES_PROVIDER])
      )[0];
      reservesData = await Promise.all(
        data.map(async (reserve) => {
          const result: ReserveData = {
            symbol: reserve.symbol,
            decimals: Number(reserve.decimals),
            UNDERLYING: reserve.underlyingAsset,
            A_TOKEN: reserve.aTokenAddress,
            S_TOKEN: reserve.stableDebtTokenAddress,
            V_TOKEN: reserve.variableDebtTokenAddress,
            INTEREST_RATE_STRATEGY: reserve.interestRateStrategyAddress,
            ORACLE: reserve.priceOracle,
          };
          if (staticATokenFactoryContract)
            result.STATA_TOKEN = (await staticATokenFactoryContract.read.getStaticAToken([
              reserve.underlyingAsset,
            ])) as Hex;
          return result;
        }),
      );
    }

    const {COLLECTOR, ...rest} = await getAdditionalTokenInfo(publicClient, pool, reservesData);

    return {
      POOL_ADDRESSES_PROVIDER: {
        value: pool.POOL_ADDRESSES_PROVIDER,
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
      AAVE_PROTOCOL_DATA_PROVIDER: {value: AAVE_PROTOCOL_DATA_PROVIDER, type: 'IPoolDataProvider'},
      ACL_MANAGER: {value: ACL_MANAGER, type: 'IACLManager'},
      ACL_ADMIN,
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

export async function generateProtocolV3Library(config: PoolConfig) {
  const {reservesData, ...addresses} = await getPoolV3Addresses(config);
  const name = `AaveV3${config.name}`;
  const provider = RPC_PROVIDERS[config.chainId];

  // generate main library
  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';\n` +
          `import {ICollector} from './common/ICollector.sol';` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants(provider, {...addresses, ...config.additionalAddresses}),
            name,
          ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants(provider, {...addresses, ...config.additionalAddresses}).join('\n'),
    ),
  );

  // generate assets library
  const assetsLibraryName = name + 'Assets';
  const assetsLibrary = generateAssetsLibrary(provider, reservesData, assetsLibraryName);
  appendFileSync(`./src/${name}.sol`, assetsLibrary.solidity);
  writeFileSync(`./src/ts/${assetsLibraryName}.ts`, assetsLibrary.js);
  return {
    js: [
      `export * as ${name} from './${name}';`,
      `export {${assetsLibraryName}} from './${assetsLibraryName}';`,
    ],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
