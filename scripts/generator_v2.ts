import {ethers} from 'ethers';
import {Pool} from './config';
import fs from 'fs';
import addressProviderV2ABI from './abi/address_provider_v2_abi.json';
import lendingPoolV2ABI from './abi/lending_pool_v2_abi.json';
import aTokenV2ABI from './abi/aToken_v2_abi.json';
import collectorV2ABI from './abi/collector_v2_abi.json';
import uipooldataProviderABI from './abi/uipooldata_provider.json';
import incentivesControllerABI from './abi/incentivesController_abi.json';
import {generateAdditionalAddresses, generateAdditionalAddressesSol} from './helpers';
import {appendAssetsLibrarySol, ReserveData} from './generateAssetsLibrary';

export interface PoolV2WithAddresses extends Pool {
  lendingPool: string;
  poolDataProvider: string;
  lendingPoolConfigurator: string;
  lendingRateOracle: string;
  oracle: string;
  admin: string;
  emergencyAdmin: string;
  collector: string;
  collectorController: string;
  defaultIncentivesController: string;
  emissionManager: string;
  reservesData: ReserveData[];
}

export async function fetchPoolV2Addresses(pool: Pool): Promise<PoolV2WithAddresses> {
  console.time(pool.name);
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider: string = pool.addressProvider;
  try {
    const addressProviderContract = new ethers.Contract(
      addressProvider,
      addressProviderV2ABI,
      pool.provider
    );
    const lendingPool: string = await addressProviderContract.getLendingPool();
    const lendingRateOracle: string = await addressProviderContract.getLendingRateOracle();
    const lendingPoolConfigurator: string =
      await addressProviderContract.getLendingPoolConfigurator();
    const oracle: string = await addressProviderContract.getPriceOracle();
    const admin: string = await addressProviderContract.getPoolAdmin();
    // const owner = await addressProviderContract.owner();
    const emergencyAdmin: string = await addressProviderContract.getEmergencyAdmin();
    const poolDataProvider: string = await addressProviderContract.getAddress(
      '0x0100000000000000000000000000000000000000000000000000000000000000'
    );

    let reservesData: PoolV2WithAddresses['reservesData'] = [];
    // workaround, fix before merge
    // didn't find all the ui pool data provider addresses, so currently there are gaps
    if (pool.additionalAddresses.UI_POOL_DATA_PROVIDER) {
      const uiPoolDataProvider = new ethers.Contract(
        pool.additionalAddresses.UI_POOL_DATA_PROVIDER,
        uipooldataProviderABI,
        pool.provider
      );
      reservesData = (await uiPoolDataProvider.getReservesData(pool.addressProvider))[0].map(
        (reserve: any) => {
          return {
            symbol: reserve.symbol,
            underlyingAsset: reserve.underlyingAsset,
            decimals: reserve.decimals,
            aTokenAddress: reserve.aTokenAddress,
            stableDebtTokenAddress: reserve.stableDebtTokenAddress,
            variableDebtTokenAddress: reserve.variableDebtTokenAddress,
            interestRateStrategyAddress: reserve.interestRateStrategyAddress,
            priceOracle: reserve.priceOracle,
          };
        }
      );
    }

    // TODO: needed as i didn't find an upto date uipooldataprovider for arc
    const lendingPoolContract = new ethers.Contract(lendingPool, lendingPoolV2ABI, pool.provider);
    const reserves: string[] = await lendingPoolContract.getReservesList();
    const data = await lendingPoolContract.getReserveData(reserves[0]);

    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = new ethers.Contract(data.aTokenAddress, aTokenV2ABI, pool.provider);

    const collector = await aTokenContract.RESERVE_TREASURY_ADDRESS();

    const collectorContract = new ethers.Contract(collector, collectorV2ABI, pool.provider);

    const defaultIncentivesController = await aTokenContract.getIncentivesController();

    let emissionManager = '0x0000000000000000000000000000000000000000';
    try {
      const incentivesControllerContract = await new ethers.Contract(
        defaultIncentivesController,
        incentivesControllerABI,
        pool.provider
      );
      emissionManager = await incentivesControllerContract.EMISSION_MANAGER();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    let collectorController;

    try {
      collectorController = await collectorContract.getFundsAdmin();
    } catch (e) {
      collectorController = 'address(0)';
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
      collectorController,
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
  name,
  addressProvider,
  oracle,
  poolDataProvider,
  collector,
  collectorController,
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

  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from "./AaveV2.sol";

  library ${name} {
      ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          ILendingPoolAddressesProvider(
              ${addressProvider}
          );

      ILendingPool internal constant POOL =
          ILendingPool(${lendingPool});

      ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
          ILendingPoolConfigurator(${lendingPoolConfigurator});

      IAaveOracle internal constant ORACLE =
          IAaveOracle(${oracle});

      ILendingRateOracle internal constant LENDING_RATE_ORACLE = ILendingRateOracle(${lendingRateOracle});

      IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider(${poolDataProvider});

      address internal constant POOL_ADMIN = ${admin};

      address internal constant EMERGENCY_ADMIN = ${emergencyAdmin};

      address internal constant COLLECTOR = ${collector};

      address internal constant COLLECTOR_CONTROLLER = ${collectorController};

      address internal constant DEFAULT_INCENTIVES_CONTROLLER = ${defaultIncentivesController};

      address internal constant EMISSION_MANAGER = ${emissionManager};

      ${generateAdditionalAddressesSol(additionalAddresses)}

  }\r\n`;
  fs.writeFileSync(`./src/${name}.sol`, templateV2Solidity);

  if (reservesData.length) {
    appendAssetsLibrarySol(name, reservesData);
  }

  const templateV2Js = `// AUTOGENERATED - DON'T MANUALLY CHANGE
export const POOL_ADDRESSES_PROVIDER = "${addressProvider}";
export const POOL = "${lendingPool}";
export const POOL_CONFIGURATOR = "${lendingPoolConfigurator}";
export const LENDING_RATE_ORACLE = "${lendingRateOracle}";
export const ORACLE = "${oracle}";
export const AAVE_PROTOCOL_DATA_PROVIDER = "${poolDataProvider}";
export const POOL_ADMIN = "${admin}";
export const EMERGENCY_ADMIN = "${emergencyAdmin}";
export const COLLECTOR = "${collector}";
export const COLLECTOR_CONTROLLER = "${collectorController}";
export const DEFAULT_INCENTIVES_CONTROLLER = "${defaultIncentivesController}";
export const EMISSION_MANAGER = "${emissionManager}";
export const CHAIN_ID = ${chainId};
${generateAdditionalAddresses(additionalAddresses)}`;
  fs.writeFileSync(`./src/ts/${name}.ts`, templateV2Js);
}
