import { ethers } from "ethers";
import { Pool } from "./config";
import fs from "fs";
import addressProviderV3ABI from "./abi/address_provider_v3_abi.json";
import poolV3ABI from "./abi/pool_v3_abi.json";
import aTokenV3ABI from "./abi/aToken_v3_abi.json";
import stableDebtTokenV3ABI from "./abi/stableDebtToken_v3_abi.json";
import variableDebtTokenV3ABI from "./abi/variableDebtToken_v3_abi.json";
import collectorV3ABI from "./abi/collector_v3_abi.json";
import rewardsControllerABI from "./abi/rewardsController_v3_abi.json";
import prettier from "prettier";
import {
  bytes32toAddress,
  generateAdditionalAddresses,
  getImplementationStorageSlot,
} from "./helpers";

export interface PoolV3WithAddresses extends Pool {
  pool: string;
  poolDataProvider: string;
  poolConfigurator: string;
  oracle: string;
  aclAdmin: string;
  aclManager: string;
  collector: string;
  collectorController: string;
}

export async function generatePoolV3(pool: Pool): Promise<PoolV3WithAddresses> {
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = ethers.utils.getAddress(pool.addressProvider);
  const contract = new ethers.Contract(
    addressProvider,
    addressProviderV3ABI,
    pool.provider
  );
  try {
    const poolAddress = await contract.getPool();
    const poolConfigurator = await contract.getPoolConfigurator();
    const oracle = await contract.getPriceOracle();
    const aclAdmin = await contract.getACLAdmin();
    const aclManager = await contract.getACLManager();
    const poolDataProvider = await contract.getPoolDataProvider();
    const lendingPoolContract = new ethers.Contract(
      poolAddress,
      poolV3ABI,
      pool.provider
    );

    const reserves: string[] = await lendingPoolContract.getReservesList();
    const data = await lendingPoolContract.getReserveData(reserves[0]);

    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = new ethers.Contract(
      data.aTokenAddress,
      aTokenV3ABI,
      pool.provider
    );

    const collector = await aTokenContract.RESERVE_TREASURY_ADDRESS();

    const defaultIncentivesController =
      await aTokenContract.getIncentivesController();

    const defaultATokenImplementation = bytes32toAddress(
      await getImplementationStorageSlot(pool.provider, data.aTokenAddress)
    );

    const aTokenRevision = await aTokenContract.ATOKEN_REVISION();

    const defaultVariableDebtTokenImplementation = bytes32toAddress(
      await getImplementationStorageSlot(
        pool.provider,
        data.variableDebtTokenAddress
      )
    );

    const variableDebtTokenRevision = await new ethers.Contract(
      data.variableDebtTokenAddress,
      variableDebtTokenV3ABI,
      pool.provider
    ).DEBT_TOKEN_REVISION();

    const defaultStableDebtTokenImplementation = bytes32toAddress(
      await getImplementationStorageSlot(
        pool.provider,
        data.stableDebtTokenAddress
      )
    );

    const stableDebtTokenRevision = await new ethers.Contract(
      data.stableDebtTokenAddress,
      stableDebtTokenV3ABI,
      pool.provider
    ).DEBT_TOKEN_REVISION();

    const collectorContract = new ethers.Contract(
      collector,
      collectorV3ABI,
      pool.provider
    );

    const incentivesControllerContract = await new ethers.Contract(
      defaultIncentivesController,
      rewardsControllerABI,
    pool.provider);
    const emissionManager = await incentivesControllerContract.getEmissionManager();

    const collectorController = await collectorContract.getFundsAdmin();

    const templateV3 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;

  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

  library ${pool.name} {
      IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
          IPoolAddressesProvider(
              ${addressProvider}
          );

      IPool internal constant POOL =
          IPool(${poolAddress});

      IPoolConfigurator internal constant POOL_CONFIGURATOR =
          IPoolConfigurator(${poolConfigurator});

      IAaveOracle internal constant ORACLE =
          IAaveOracle(${oracle});

      IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider(${poolDataProvider});

      IACLManager internal constant ACL_MANAGER = IACLManager(${aclManager});

      address internal constant ACL_ADMIN = ${aclAdmin};

      address internal constant COLLECTOR = ${collector};

      ICollector internal constant COLLECTOR_CONTROLLER = ICollector(${collectorController});

      address internal constant DEFAULT_INCENTIVES_CONTROLLER = ${defaultIncentivesController};

      address internal constant DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision} = ${defaultATokenImplementation};

      address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision} = ${defaultVariableDebtTokenImplementation};

      address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${stableDebtTokenRevision} = ${defaultStableDebtTokenImplementation};

      address internal constant EMISSION_MANAGER = ${emissionManager}
  }\r\n`;
    fs.writeFileSync(
      `./src/${pool.name}.sol`,
      prettier.format(templateV3, { filepath: `./src/${pool.name}.sol` })
    );

    const templateV3Js = `export const POOL_ADDRESSES_PROVIDER = "${addressProvider}";
export const POOL = "${poolAddress}";
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
export const CHAIN_ID = ${pool.chainId};
export const EMISSION_MANAGER = ${emissionManager}
${generateAdditionalAddresses(pool)}`;
    fs.writeFileSync(
      `./src/ts/${pool.name}.ts`,
      prettier.format(templateV3Js, {
        filepath: `./src/ts/${pool.name}.ts`,
      })
    );

    return {
      pool: poolAddress,
      poolConfigurator,
      oracle,
      aclAdmin,
      aclManager,
      poolDataProvider,
      collectorController,
      collector,
      ...pool,
    };
  } catch (error: any) {
    throw new Error(
      JSON.stringify({ message: error.message, pool, stack: error.stack })
    );
  }
}
