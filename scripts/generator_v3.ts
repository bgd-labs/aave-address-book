import {ethers} from 'ethers';
import {Pool} from './config.js';
import fs from 'fs';
import {ADDRESS_PROVIDER_V3_ABI} from './abi/address_provider_v3_abi.js';
import {A_TOKEN_V3_ABI} from './abi/aToken_v3_abi.js';
import {STABLE_DEBT_TOKEN_ABI} from './abi/stableDebtToken_v3_abi.js';
import {VARIABLE_DEBT_TOKEN_ABI} from './abi/variableDebtToken_v3_abi.js';
import {REWARDS_CONTROLLER_ABI} from './abi/rewardsController_v3_abi.js';
import {UI_POOL_DATA_PROVIDER_ABI} from './abi/uipooldata_provider.js';
import {
  ZERO_ADDRESS,
  addressOrZero,
  bytes32toAddress,
  generateAdditionalAddresses,
  generateAdditionalAddressesSol,
  getImplementationStorageSlot,
  sleep,
} from './helpers.js';
import {
  appendAssetsLibraryJs,
  appendAssetsLibrarySol,
  ReserveData,
} from './generateAssetsLibrary.js';
import {Hex, getContract} from 'viem';

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
    const poolAddress = await addressProviderContract.read.getPool();
    const poolConfigurator = await addressProviderContract.read.getPoolConfigurator();
    const oracle = await addressProviderContract.read.getPriceOracle();
    const oracleSentinel = await addressProviderContract.read.getPriceOracleSentinel();
    const aclAdmin = await addressProviderContract.read.getACLAdmin();
    const aclManager = await addressProviderContract.read.getACLManager();
    const poolDataProvider = await addressProviderContract.read.getPoolDataProvider();

    const defaultIncentivesController = await addressProviderContract.read.getAddress([
      '0x703c2c8634bed68d98c029c18f310e7f7ec0e5d6342c590190b3cb8b3ba54532',
    ]);

    let emissionManager = ZERO_ADDRESS;
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

    await sleep(1000);
    let reservesData: PoolV3WithAddresses['reservesData'] = [];
    // workaround, fix before merge
    // didn't find all the ui pool data provider addresses, so currently there are gaps
    if (pool.additionalAddresses.UI_POOL_DATA_PROVIDER) {
      const uiPoolDataProvider = getContract({
        address: pool.additionalAddresses.UI_POOL_DATA_PROVIDER,
        abi: UI_POOL_DATA_PROVIDER_ABI,
        publicClient: pool.provider,
      });
      reservesData = (await uiPoolDataProvider.read.getReservesData([pool.addressProvider]))[0].map(
        (reserve) => {
          let symbol = reserve.symbol;
          // patch for
          if (
            reserve.symbol === 'USDC' &&
            reserve.underlyingAsset === '0xaf88d065e77c8cC2239327C5EDb3A432268e5831'
          ) {
            symbol = 'USDCn';
          }
          return {
            symbol,
            underlyingAsset: reserve.underlyingAsset,
            decimals: Number(reserve.decimals),
            aTokenAddress: reserve.aTokenAddress,
            stableDebtTokenAddress: reserve.stableDebtTokenAddress,
            variableDebtTokenAddress: reserve.variableDebtTokenAddress,
            interestRateStrategyAddress: reserve.interestRateStrategyAddress,
            priceOracle: reserve.priceOracle,
          };
        }
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

      const collector = await aTokenContract.read.RESERVE_TREASURY_ADDRESS();

      const defaultATokenImplementation = bytes32toAddress(
        await getImplementationStorageSlot(pool.provider, reservesData[0].aTokenAddress)
      );

      const aTokenRevision = Number(await aTokenContract.read.ATOKEN_REVISION());

      await sleep(1000);

      const defaultVariableDebtTokenImplementation = bytes32toAddress(
        await getImplementationStorageSlot(pool.provider, reservesData[0].variableDebtTokenAddress)
      );

      const variableDebtTokenContract = getContract({
        address: reservesData[0].variableDebtTokenAddress,
        abi: VARIABLE_DEBT_TOKEN_ABI,
        publicClient: pool.provider,
      });
      const variableDebtTokenRevision = Number(
        await variableDebtTokenContract.read.DEBT_TOKEN_REVISION()
      );

      const defaultStableDebtTokenImplementation = bytes32toAddress(
        await getImplementationStorageSlot(pool.provider, reservesData[0].stableDebtTokenAddress)
      );

      const stableDebtTokenContract = getContract({
        address: reservesData[0].stableDebtTokenAddress,
        abi: STABLE_DEBT_TOKEN_ABI,
        publicClient: pool.provider,
      });
      const stableDebtTokenRevision = Number(
        await stableDebtTokenContract.read.DEBT_TOKEN_REVISION()
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
          pool.initial?.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL
        ),
        variableDebtTokenRevision: 1,
        defaultStableDebtTokenImplementation: addressOrZero(
          pool.initial?.DEFAULT_STABLE_DEBT_TOKEN_IMPL
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

  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from "./AaveV3.sol";
  import {ICollector} from "./common/ICollector.sol";

  library ${name} {
      IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          IPoolAddressesProvider(
              ${addressProvider}
          );

      IPool internal constant POOL =
          IPool(${pool});

      IPoolConfigurator internal constant POOL_CONFIGURATOR =
          IPoolConfigurator(${poolConfigurator});

      IAaveOracle internal constant ORACLE =
          IAaveOracle(${oracle});

      address internal constant PRICE_ORACLE_SENTINEL = ${oracleSentinel};

      IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IPoolDataProvider(${poolDataProvider});

      IACLManager internal constant ACL_MANAGER = IACLManager(${aclManager});

      address internal constant ACL_ADMIN = ${aclAdmin};

      ICollector internal constant COLLECTOR = ICollector(${collector});

      address internal constant DEFAULT_INCENTIVES_CONTROLLER = ${defaultIncentivesController};

      address internal constant DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision} = ${defaultATokenImplementation};

      address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision} = ${defaultVariableDebtTokenImplementation};

      address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision} = ${defaultStableDebtTokenImplementation};

      address internal constant EMISSION_MANAGER = ${emissionManager};

      ${generateAdditionalAddressesSol(additionalAddresses)}

  }\r\n`;
  fs.writeFileSync(`./src/${name}.sol`, templateV3Sol);

  if (reservesData.length) {
    appendAssetsLibrarySol(name, reservesData);
  }

  const templateV3Js = `// AUTOGENERATED - DON'T MANUALLY CHANGE
export const POOL_ADDRESSES_PROVIDER = "${addressProvider}";
export const POOL = "${pool}";
export const POOL_CONFIGURATOR = "${poolConfigurator}";
export const ORACLE = "${oracle}";
export const PRICE_ORACLE_SENTINEL = "${oracleSentinel}";
export const AAVE_PROTOCOL_DATA_PROVIDER = "${poolDataProvider}";
export const ACL_MANAGER = "${aclManager}";
export const ACL_ADMIN = "${aclAdmin}";
export const COLLECTOR = "${collector}";
export const DEFAULT_INCENTIVES_CONTROLLER = "${defaultIncentivesController}";
export const DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision} = "${defaultATokenImplementation}";
export const DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision} = "${defaultVariableDebtTokenImplementation}";
export const DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision} = "${defaultStableDebtTokenImplementation}";
export const CHAIN_ID = ${chainId};
export const EMISSION_MANAGER = "${emissionManager}";
${generateAdditionalAddresses(additionalAddresses)}`;
  fs.writeFileSync(`./src/ts/${name}.ts`, templateV3Js);
  fs.appendFileSync(`./src/ts/AaveAddressBook.ts`, `export * as ${name} from "./${name}.js";\r\n`);

  if (reservesData.length) {
    appendAssetsLibraryJs(name, reservesData);
  }
}
