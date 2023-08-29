import {Pool} from './config';
import fs from 'fs';
import {ADDRESS_PROVIDER_V3_ABI} from './abi/address_provider_v3_abi';
import {A_TOKEN_V3_ABI} from './abi/aToken_v3_abi';
import {STABLE_DEBT_TOKEN_ABI} from './abi/stableDebtToken_v3_abi';
import {VARIABLE_DEBT_TOKEN_ABI} from './abi/variableDebtToken_v3_abi';
import {REWARDS_CONTROLLER_ABI} from './abi/rewardsController_v3_abi';
import {UI_POOL_DATA_PROVIDER_ABI} from './abi/uipooldata_provider';
import {STATIC_A_TOKEN_FACTORY_ABI} from './abi/static_a_token_factory_abi';
import {
  addressOrZero,
  bytes32toAddress,
  generateAdditionalAddresses,
  generateAdditionalAddressesSol,
  generateExplorerLinkComment,
  getImplementationStorageSlot,
} from './helpers';
import {appendAssetsLibraryJs, appendAssetsLibrarySol, ReserveData} from './generateAssetsLibrary';
import {Hex, getContract, zeroAddress} from 'viem';

export interface PoolV3WithAddresses extends Pool {
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

export async function fetchPoolV3Addresses(pool: Pool): Promise<PoolV3WithAddresses> {
  console.time(pool.name);
  const addressProviderContract = getContract({
    address: pool.addressProvider,
    abi: ADDRESS_PROVIDER_V3_ABI,
    publicClient: pool.provider,
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
        publicClient: pool.provider,
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
        publicClient: pool.provider,
      });
      const staticATokenFactoryContract = pool.additionalAddresses.STATIC_A_TOKEN_FACTORY
        ? getContract({
            address: pool.additionalAddresses.STATIC_A_TOKEN_FACTORY,
            abi: STATIC_A_TOKEN_FACTORY_ABI,
            publicClient: pool.provider,
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
        publicClient: pool.provider,
      });
      const variableDebtTokenContract = getContract({
        address: reservesData[0].variableDebtTokenAddress,
        abi: VARIABLE_DEBT_TOKEN_ABI,
        publicClient: pool.provider,
      });
      const stableDebtTokenContract = getContract({
        address: reservesData[0].stableDebtTokenAddress,
        abi: STABLE_DEBT_TOKEN_ABI,
        publicClient: pool.provider,
      });

      const [collector, aTokenImplSlot, aTokenImplRevision, vTokenImplSlot, sTokenImplSlot] =
        await Promise.all([
          aTokenContract.read.RESERVE_TREASURY_ADDRESS(),
          await getImplementationStorageSlot(pool.provider, reservesData[0].aTokenAddress),
          await aTokenContract.read.ATOKEN_REVISION(),
          await getImplementationStorageSlot(
            pool.provider,
            reservesData[0].variableDebtTokenAddress,
          ),
          await getImplementationStorageSlot(pool.provider, reservesData[0].stableDebtTokenAddress),
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

      console.timeEnd(pool.name);

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
        ...pool,
      };
    } else {
      console.timeEnd(pool.name);
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
        ...pool,
      };
    }
  } catch (error: any) {
    throw new Error(JSON.stringify({message: error.message, pool, stack: error.stack}));
  }
}

export function writeV3Templates({
  provider,
  name,
  addressProvider,
  pool,
  poolConfigurator,
  oracle,
  oracleSentinel,
  poolDataProvider,
  aclAdmin,
  aclManager,
  collector,
  additionalAddresses,
  chainId,
  defaultATokenImplementation,
  aTokenRevision,
  defaultStableDebtTokenImplementation,
  stableDebtTokenRevision,
  defaultVariableDebtTokenImplementation,
  variableDebtTokenRevision,
  emissionManager,
  defaultIncentivesController,
  reservesData,
}: PoolV3WithAddresses) {
  const templateV3Sol = `// SPDX-License-Identifier: MIT
  // AUTOGENERATED - DON'T MANUALLY CHANGE
  pragma solidity >=0.6.0;

  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
  import {ICollector} from './common/ICollector.sol';

  library ${name} {
      ${generateExplorerLinkComment(provider, addressProvider)}
      IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          IPoolAddressesProvider(
              ${addressProvider}
          );

      ${generateExplorerLinkComment(provider, pool)}
      IPool internal constant POOL =
          IPool(${pool});

      ${generateExplorerLinkComment(provider, poolConfigurator)}
      IPoolConfigurator internal constant POOL_CONFIGURATOR =
          IPoolConfigurator(${poolConfigurator});

      ${generateExplorerLinkComment(provider, oracle)}
      IAaveOracle internal constant ORACLE =
          IAaveOracle(${oracle});

      ${generateExplorerLinkComment(provider, oracleSentinel)}
      address internal constant PRICE_ORACLE_SENTINEL = ${oracleSentinel};

      ${generateExplorerLinkComment(provider, poolDataProvider)}
      IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IPoolDataProvider(${poolDataProvider});

      ${generateExplorerLinkComment(provider, aclManager)}
      IACLManager internal constant ACL_MANAGER = IACLManager(${aclManager});

      ${generateExplorerLinkComment(provider, aclAdmin)}
      address internal constant ACL_ADMIN = ${aclAdmin};

      ${generateExplorerLinkComment(provider, collector)}
      ICollector internal constant COLLECTOR = ICollector(${collector});

      ${generateExplorerLinkComment(provider, defaultIncentivesController)}
      address internal constant DEFAULT_INCENTIVES_CONTROLLER = ${defaultIncentivesController};

      ${generateExplorerLinkComment(provider, defaultATokenImplementation)}
      address internal constant DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision} = ${defaultATokenImplementation};

      ${generateExplorerLinkComment(provider, defaultVariableDebtTokenImplementation)}
      address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision} = ${defaultVariableDebtTokenImplementation};

      ${generateExplorerLinkComment(provider, defaultStableDebtTokenImplementation)}
      address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision} = ${defaultStableDebtTokenImplementation};

      ${generateExplorerLinkComment(provider, emissionManager)}
      address internal constant EMISSION_MANAGER = ${emissionManager};

      ${generateAdditionalAddressesSol(provider, additionalAddresses)}

  }\r\n`;
  fs.writeFileSync(`./src/${name}.sol`, templateV3Sol);

  if (reservesData.length) {
    appendAssetsLibrarySol(name, reservesData);
  }

  const templateV3Js = `// AUTOGENERATED - DON'T MANUALLY CHANGE
export const POOL_ADDRESSES_PROVIDER = '${addressProvider}';
export const POOL = '${pool}';
export const POOL_CONFIGURATOR = '${poolConfigurator}';
export const ORACLE = '${oracle}';
export const PRICE_ORACLE_SENTINEL = '${oracleSentinel}';
export const AAVE_PROTOCOL_DATA_PROVIDER = '${poolDataProvider}';
export const ACL_MANAGER = '${aclManager}';
export const ACL_ADMIN = '${aclAdmin}';
export const COLLECTOR = '${collector}';
export const DEFAULT_INCENTIVES_CONTROLLER = '${defaultIncentivesController}';
export const DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision} = '${defaultATokenImplementation}';
export const DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision} = '${defaultVariableDebtTokenImplementation}';
export const DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision} = '${defaultStableDebtTokenImplementation}';
export const CHAIN_ID = ${chainId};
export const EMISSION_MANAGER = '${emissionManager}';
${generateAdditionalAddresses(additionalAddresses)}`;
  fs.writeFileSync(`./src/ts/${name}.ts`, templateV3Js);
  fs.appendFileSync(`./src/ts/AaveAddressBook.ts`, `export * as ${name} from './${name}';\r\n`);

  if (reservesData.length) {
    appendAssetsLibraryJs(name, reservesData);
  }
}
