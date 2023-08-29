import {Pool} from './config';
import fs from 'fs';
import {ADDRESS_PROVIDER_V2_ABI} from './abi/address_provider_v2_abi';
import {LENDING_POOL_V2_ABI} from './abi/lending_pool_v2_abi';
import {A_TOKEN_V2_ABI} from './abi/aToken_v2_abi';
import {UI_POOL_DATA_PROVIDER_ABI} from './abi/uipooldata_provider';
import {INCENTIVES_CONTROLLER_ABI} from './abi/incentivesController_abi';
import {
  generateAdditionalAddresses,
  generateAdditionalAddressesSol,
  generateExplorerLinkComment,
} from './helpers';
import {appendAssetsLibraryJs, appendAssetsLibrarySol, ReserveData} from './generateAssetsLibrary';
import {Hex, getContract} from 'viem';

export interface PoolV2WithAddresses extends Pool {
  lendingPool: Hex;
  poolDataProvider: Hex;
  lendingPoolConfigurator: Hex;
  lendingRateOracle: Hex;
  oracle: Hex;
  admin: Hex;
  emergencyAdmin: Hex;
  collector: Hex;
  defaultIncentivesController: Hex;
  emissionManager: Hex;
  reservesData: ReserveData[];
}

export async function fetchPoolV2Addresses(pool: Pool): Promise<PoolV2WithAddresses> {
  console.time(pool.name);
  // using getAddress to get correct checksum in case the one in config isn't correct
  try {
    const addressProviderContract = getContract({
      address: pool.addressProvider,
      abi: ADDRESS_PROVIDER_V2_ABI,
      publicClient: pool.provider,
    });

    const [
      lendingPool,
      lendingRateOracle,
      lendingPoolConfigurator,
      oracle,
      admin,
      emergencyAdmin,
      poolDataProvider,
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

    let reservesData: PoolV2WithAddresses['reservesData'] = [];
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
        },
      );
    }

    // Note: needed as i didn't find an upto date uipooldataprovider for arc
    const lendingPoolContract = getContract({
      address: lendingPool,
      abi: LENDING_POOL_V2_ABI,
      publicClient: pool.provider,
    });
    const reserves = await lendingPoolContract.read.getReservesList();
    const data = await lendingPoolContract.read.getReserveData([reserves[0]]);

    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = getContract({
      address: data.aTokenAddress,
      abi: A_TOKEN_V2_ABI,
      publicClient: pool.provider,
    });
    const collector = await aTokenContract.read.RESERVE_TREASURY_ADDRESS();

    const defaultIncentivesController = await aTokenContract.read.getIncentivesController();

    let emissionManager: Hex = '0x0000000000000000000000000000000000000000';
    try {
      const incentivesControllerContract = getContract({
        address: defaultIncentivesController,
        abi: INCENTIVES_CONTROLLER_ABI,
        publicClient: pool.provider,
      });
      emissionManager = await incentivesControllerContract.read.EMISSION_MANAGER();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    console.timeEnd(pool.name);

    return {
      lendingPool,
      poolDataProvider,
      lendingPoolConfigurator,
      lendingRateOracle,
      oracle,
      admin,
      emergencyAdmin,
      collector,
      reservesData,
      defaultIncentivesController,
      emissionManager,
      ...pool,
    };
  } catch (error: any) {
    throw new Error(JSON.stringify({message: error.message, pool, stack: error.stack}));
  }
}

export function writeV2Templates({
  provider,
  name,
  addressProvider,
  oracle,
  poolDataProvider,
  collector,
  additionalAddresses,
  chainId,
  lendingPool,
  lendingPoolConfigurator,
  lendingRateOracle,
  admin,
  emergencyAdmin,
  defaultIncentivesController,
  reservesData,
  emissionManager,
}: PoolV2WithAddresses) {
  const templateV2Solidity = `// SPDX-License-Identifier: MIT
  // AUTOGENERATED - DON'T MANUALLY CHANGE
  pragma solidity >=0.6.0;

  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from './AaveV2.sol';
  import {ICollector} from './common/ICollector.sol';

  library ${name} {
      ${generateExplorerLinkComment(provider, addressProvider)}
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              ${addressProvider}
          );

      ${generateExplorerLinkComment(provider, lendingPool)}
      ILendingPool internal constant POOL =
          ILendingPool(${lendingPool});

      ${generateExplorerLinkComment(provider, lendingPoolConfigurator)}
      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(${lendingPoolConfigurator});

      ${generateExplorerLinkComment(provider, oracle)}
      IAaveOracle internal constant ORACLE =
          IAaveOracle(${oracle});

      ${generateExplorerLinkComment(provider, lendingRateOracle)}
      ILendingRateOracle internal constant LENDING_RATE_ORACLE = ILendingRateOracle(${lendingRateOracle});

      ${generateExplorerLinkComment(provider, poolDataProvider)}
      IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider(${poolDataProvider});

      ${generateExplorerLinkComment(provider, admin)}
      address internal constant POOL_ADMIN = ${admin};

      ${generateExplorerLinkComment(provider, emergencyAdmin)}
      address internal constant EMERGENCY_ADMIN = ${emergencyAdmin};

      ${generateExplorerLinkComment(provider, collector)}
      ICollector internal constant COLLECTOR = ICollector(${collector});

      ${generateExplorerLinkComment(provider, defaultIncentivesController)}
      address internal constant DEFAULT_INCENTIVES_CONTROLLER = ${defaultIncentivesController};

      ${generateExplorerLinkComment(provider, emissionManager)}
      address internal constant EMISSION_MANAGER = ${emissionManager};

      ${generateAdditionalAddressesSol(provider, additionalAddresses)}

  }\r\n`;
  fs.writeFileSync(`./src/${name}.sol`, templateV2Solidity);

  if (reservesData.length) {
    appendAssetsLibrarySol(provider, name, reservesData);
  }

  const templateV2Js = `// AUTOGENERATED - DON'T MANUALLY CHANGE
export const POOL_ADDRESSES_PROVIDER = '${addressProvider}';
export const POOL = '${lendingPool}';
export const POOL_CONFIGURATOR = '${lendingPoolConfigurator}';
export const LENDING_RATE_ORACLE = '${lendingRateOracle}';
export const ORACLE = '${oracle}';
export const AAVE_PROTOCOL_DATA_PROVIDER = '${poolDataProvider}';
export const POOL_ADMIN = '${admin}';
export const EMERGENCY_ADMIN = '${emergencyAdmin}';
export const COLLECTOR = '${collector}';
export const DEFAULT_INCENTIVES_CONTROLLER = '${defaultIncentivesController}';
export const EMISSION_MANAGER = '${emissionManager}';
export const CHAIN_ID = ${chainId};
${generateAdditionalAddresses(additionalAddresses)}`;
  fs.writeFileSync(`./src/ts/${name}.ts`, templateV2Js);
  fs.appendFileSync(`./src/ts/AaveAddressBook.ts`, `export * as ${name} from './${name}';\r\n`);

  if (reservesData.length) {
    appendAssetsLibraryJs(name, reservesData);
  }
}
