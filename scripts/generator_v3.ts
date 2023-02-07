import {ethers} from 'ethers';
import {Pool} from './config';
import fs from 'fs';
import addressProviderV3ABI from './abi/address_provider_v3_abi.json';
import poolV3ABI from './abi/pool_v3_abi.json';
import aTokenV3ABI from './abi/aToken_v3_abi.json';
import stableDebtTokenV3ABI from './abi/stableDebtToken_v3_abi.json';
import variableDebtTokenV3ABI from './abi/variableDebtToken_v3_abi.json';
import collectorV3ABI from './abi/collector_v3_abi.json';
import rewardsControllerABI from './abi/rewardsController_v3_abi.json';
import uipooldataProviderABI from './abi/uipooldata_provider.json';
import {
  bytes32toAddress,
  generateAdditionalAddresses,
  generateAdditionalAddressesSol,
  getImplementationStorageSlot,
  sleep,
} from './helpers';
import {appendAssetsLibrarySol, ReserveData} from './generateAssetsLibrary';

export interface PoolV3WithAddresses extends Pool {
  pool: string;
  poolDataProvider: string;
  poolConfigurator: string;
  oracle: string;
  aclAdmin: string;
  aclManager: string;
  collector: string;
  collectorController: string;
  defaultATokenImplementation: string;
  aTokenRevision: string;
  defaultVariableDebtTokenImplementation: string;
  variableDebtTokenRevision: string;
  defaultStableDebtTokenImplementation: string;
  stableDebtTokenRevision: string;
  emissionManager: string;
  defaultIncentivesController: string;
  reservesData: ReserveData[];
}

export async function fetchPoolV3Addresses(pool: Pool): Promise<PoolV3WithAddresses> {
  console.time(pool.name);
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = pool.addressProvider;
  const contract = new ethers.Contract(addressProvider, addressProviderV3ABI, pool.provider);
  try {
    const poolAddress = await contract.getPool();
    const poolConfigurator = await contract.getPoolConfigurator();
    const oracle = await contract.getPriceOracle();
    const aclAdmin = await contract.getACLAdmin();
    const aclManager = await contract.getACLManager();
    const poolDataProvider = await contract.getPoolDataProvider();

    await sleep(1000);
    let reservesData: PoolV3WithAddresses['reservesData'] = [];
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
    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = new ethers.Contract(
      reservesData[0].aTokenAddress,
      aTokenV3ABI,
      pool.provider
    );

    const collector = await aTokenContract.RESERVE_TREASURY_ADDRESS();

    const defaultIncentivesController = await aTokenContract.getIncentivesController();

    const defaultATokenImplementation = bytes32toAddress(
      await getImplementationStorageSlot(pool.provider, reservesData[0].aTokenAddress)
    );

    const aTokenRevision = await aTokenContract.ATOKEN_REVISION();

    await sleep(1000);

    const defaultVariableDebtTokenImplementation = bytes32toAddress(
      await getImplementationStorageSlot(pool.provider, reservesData[0].variableDebtTokenAddress)
    );

    const variableDebtTokenRevision = await new ethers.Contract(
      reservesData[0].variableDebtTokenAddress,
      variableDebtTokenV3ABI,
      pool.provider
    ).DEBT_TOKEN_REVISION();

    const defaultStableDebtTokenImplementation = bytes32toAddress(
      await getImplementationStorageSlot(pool.provider, reservesData[0].stableDebtTokenAddress)
    );

    const stableDebtTokenRevision = await new ethers.Contract(
      reservesData[0].stableDebtTokenAddress,
      stableDebtTokenV3ABI,
      pool.provider
    ).DEBT_TOKEN_REVISION();

    const collectorContract = new ethers.Contract(collector, collectorV3ABI, pool.provider);

    let emissionManager = '0x0000000000000000000000000000000000000000';
    try {
      const incentivesControllerContract = await new ethers.Contract(
        defaultIncentivesController,
        rewardsControllerABI,
        pool.provider
      );
      emissionManager = await incentivesControllerContract.getEmissionManager();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    const collectorController = await collectorContract.getFundsAdmin();

    console.timeEnd(pool.name);

    return {
      pool: poolAddress,
      poolConfigurator,
      oracle,
      aclAdmin,
      aclManager,
      poolDataProvider,
      collectorController,
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
  poolDataProvider,
  aclAdmin,
  aclManager,
  collector,
  collectorController,
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

  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

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

      IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IPoolDataProvider(${poolDataProvider});

      IACLManager internal constant ACL_MANAGER = IACLManager(${aclManager});

      address internal constant ACL_ADMIN = ${aclAdmin};

      address internal constant COLLECTOR = ${collector};

      ICollector internal constant COLLECTOR_CONTROLLER = ICollector(${collectorController});

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
export const AAVE_PROTOCOL_DATA_PROVIDER = "${poolDataProvider}";
export const ACL_MANAGER = "${aclManager}";
export const ACL_ADMIN = "${aclAdmin}";
export const COLLECTOR = "${collector}";
export const COLLECTOR_CONTROLLER = "${collectorController}";
export const DEFAULT_INCENTIVES_CONTROLLER = "${defaultIncentivesController}";
export const DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision} = "${defaultATokenImplementation}";
export const DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision} = "${defaultVariableDebtTokenImplementation}";
export const DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision} = "${defaultStableDebtTokenImplementation}";
export const CHAIN_ID = ${chainId};
export const EMISSION_MANAGER = "${emissionManager}";
${generateAdditionalAddresses(additionalAddresses)}`;
  fs.writeFileSync(`./src/ts/${name}.ts`, templateV3Js);
}
