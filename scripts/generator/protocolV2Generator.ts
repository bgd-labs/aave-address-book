import {Hex, PublicClient, getContract} from 'viem';
import {AddressInfo, PoolConfig, ReserveData} from '../configs/types';
import {RPC_PROVIDERS} from './clients';
import {appendFileSync, writeFileSync} from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {ADDRESS_PROVIDER_V2_ABI} from '../abi/address_provider_v2_abi';
import {LENDING_POOL_V2_ABI} from '../abi/lending_pool_v2_abi';
import {A_TOKEN_V2_ABI} from '../abi/aToken_v2_abi';
import {INCENTIVES_CONTROLLER_ABI} from '../abi/incentivesController_abi';
import {generateAssetsLibrary} from './assetsLibraryGenerator';
import {IUiPoolDataProvider_ABI} from '../../src/ts/abis/IUiPoolDataProvider';
import {mainnetAmmV2Pool} from '../configs/pools/ethereum';

export interface PoolV2Addresses {
  POOL_ADDRESSES_PROVIDER: AddressInfo;
  POOL: AddressInfo;
  AAVE_PROTOCOL_DATA_PROVIDER: AddressInfo;
  POOL_CONFIGURATOR: AddressInfo;
  ORACLE: AddressInfo;
  LENDING_RATE_ORACLE: AddressInfo;
  POOL_ADMIN: AddressInfo;
  EMERGENCY_ADMIN: AddressInfo;
  COLLECTOR: AddressInfo;
  EMISSION_MANAGER: AddressInfo;
  DEFAULT_INCENTIVES_CONTROLLER: AddressInfo;
  LENDING_POOL_COLLATERAL_MANAGER: AddressInfo;
  reservesData: ReserveData[];
}

async function getAdditionalTokenInfo(
  publicClient: PublicClient,
  pool: Hex,
  reservesData: PoolV2Addresses['reservesData'],
): Promise<{
  COLLECTOR: AddressInfo;
  [key: `DEFAULT_A_TOKEN_IMPL_REV_${number}`]: Hex;
  [key: `DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${number}`]: Hex;
  [key: `DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${number}`]: Hex;
}> {
  if (reservesData.length > 0) {
    const aTokenContract = getContract({
      address: reservesData[0].A_TOKEN,
      abi: A_TOKEN_V2_ABI,
      publicClient,
    });
    const COLLECTOR = await aTokenContract.read.RESERVE_TREASURY_ADDRESS();

    return {
      COLLECTOR: {value: COLLECTOR, type: 'ICollector'},
    };
  } else {
    const lendingPoolContract = getContract({
      address: pool,
      abi: LENDING_POOL_V2_ABI,
      publicClient,
    });
    const reserves = await lendingPoolContract.read.getReservesList();
    const data = await lendingPoolContract.read.getReserveData([reserves[0]]);
    const aTokenContract = getContract({
      address: data.aTokenAddress,
      abi: A_TOKEN_V2_ABI,
      publicClient,
    });
    const collector = await aTokenContract.read.RESERVE_TREASURY_ADDRESS();
    return {
      COLLECTOR: {value: collector, type: 'ICollector'},
    };
  }
}

export async function getPoolV2Addresses(pool: PoolConfig): Promise<PoolV2Addresses> {
  const publicClient = RPC_PROVIDERS[pool.chainId] as PublicClient;
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
        pool.name === mainnetAmmV2Pool.name
          ? '0x1000000000000000000000000000000000000000000000000000000000000000'
          : '0x0100000000000000000000000000000000000000000000000000000000000000',
      ]),
      addressProviderContract.read.getLendingPoolCollateralManager(),
    ]);

    let reservesData: PoolV2Addresses['reservesData'] = [];
    // workaround, fix before merge
    // didn't find all the ui pool data provider addresses, so currently there are gaps
    if (pool.additionalAddresses.UI_POOL_DATA_PROVIDER) {
      const uiPoolDataProvider = getContract({
        address: pool.additionalAddresses.UI_POOL_DATA_PROVIDER,
        abi: IUiPoolDataProvider_ABI,
        publicClient,
      });
      reservesData = (
        await uiPoolDataProvider.read.getReservesData([pool.POOL_ADDRESSES_PROVIDER])
      )[0].map((reserve) => {
        return {
          symbol: reserve.symbol,
          UNDERLYING: reserve.underlyingAsset,
          decimals: Number(reserve.decimals),
          A_TOKEN: reserve.aTokenAddress,
          S_TOKEN: reserve.stableDebtTokenAddress,
          V_TOKEN: reserve.variableDebtTokenAddress,
          INTEREST_RATE_STRATEGY: reserve.interestRateStrategyAddress,
          ORACLE: reserve.priceOracle,
        };
      });
    }

    const {COLLECTOR, ...rest} = await getAdditionalTokenInfo(publicClient, POOL, reservesData);

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
      AAVE_PROTOCOL_DATA_PROVIDER: {
        value: AAVE_PROTOCOL_DATA_PROVIDER,
        type: 'IAaveProtocolDataProvider',
      },
      POOL_ADMIN,
      EMERGENCY_ADMIN,
      COLLECTOR,
      DEFAULT_INCENTIVES_CONTROLLER,
      ...rest,
      EMISSION_MANAGER,
      LENDING_POOL_COLLATERAL_MANAGER,
      reservesData,
    };
  } catch (error: any) {
    throw new Error(JSON.stringify({message: error.message, pool, stack: error.stack}));
  }
}

export async function generateProtocolV2Library(config: PoolConfig) {
  const {reservesData, ...addresses} = await getPoolV2Addresses(config);
  const name = `AaveV2${config.name}`;

  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from './AaveV2.sol';\n` +
          `import {ICollector} from './common/ICollector.sol';` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({
              chainId: config.chainId,
              addresses: {...addresses, ...config.additionalAddresses},
            }),
            name,
          ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId: config.chainId,
        addresses: {
          ...addresses,
          ...config.additionalAddresses,
          CHAIN_ID: {value: config.chainId, type: 'uint256'},
        },
      }).join('\n'),
    ),
  );

  // generate assets library
  const assetsLibraryName = name + 'Assets';
  const assetsLibrary = generateAssetsLibrary(config.chainId, reservesData, assetsLibraryName);
  appendFileSync(`./src/${name}.sol`, assetsLibrary.solidity);
  appendFileSync(`./src/ts/${name}.ts`, assetsLibrary.js);
  // appendFileSync(`./src/ts/AaveAddressBook.ts`, `export {${name}} from './${name}';\r\n`);
  // appendFileSync(
  //   `./src/ts/AaveAddressBook.ts`,
  //   `export {${assetsLibraryName}} from './${assetsLibraryName}';\r\n`,
  // );
  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
