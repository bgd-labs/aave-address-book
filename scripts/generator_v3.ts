import { ethers } from "ethers";
import { Market } from "./config";
import fs from "fs";
import addressProviderV3ABI from "./abi/address_provider_v3_abi.json";
import poolV3ABI from "./abi/pool_v3_abi.json";
import aTokenV3ABI from "./abi/aToken_v3_abi.json";
import collectorV3ABI from "./abi/collector_v3_abi.json";
import prettier from "prettier";

export interface MarketV3WithAddresses extends Market {
  pool: string;
  poolDataProvider: string;
  poolConfigurator: string;
  oracle: string;
  aclAdmin: string;
  aclManager: string;
  collector: string;
  collectorController: string;
}

export async function generateMarketV3(
  market: Market
): Promise<MarketV3WithAddresses> {
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = ethers.utils.getAddress(market.addressProvider);
  const contract = new ethers.Contract(
    addressProvider,
    addressProviderV3ABI,
    market.provider
  );
  try {
    const pool = await contract.getPool();
    const poolConfigurator = await contract.getPoolConfigurator();
    const oracle = await contract.getPriceOracle();
    const aclAdmin = await contract.getACLAdmin();
    const aclManager = await contract.getACLManager();
    const poolDataProvider = await contract.getPoolDataProvider();

    const lendingPoolContract = new ethers.Contract(
      pool,
      poolV3ABI,
      market.provider
    );

    const reserves: string[] = await lendingPoolContract.getReservesList();
    const data = await lendingPoolContract.getReserveData(reserves[0]);

    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = new ethers.Contract(
      data.aTokenAddress,
      aTokenV3ABI,
      market.provider
    );

    const collector = await aTokenContract.RESERVE_TREASURY_ADDRESS();

    const collectorContract = new ethers.Contract(
      collector,
      collectorV3ABI,
      market.provider
    );

    const collectorController = await collectorContract.getFundsAdmin();

    const templateV3 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;

  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
  import {Token} from './Common.sol';


  library ${market.name} {
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

      IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider(${poolDataProvider});

      IACLManager internal constant ACL_MANAGER = IACLManager(${aclManager});

      address internal constant ACL_ADMIN = ${aclAdmin};

      address internal constant COLLECTOR = ${collector};

      address internal constant COLLECTOR_CONTROLLER = ${collectorController};
  }\r\n`;
    fs.writeFileSync(
      `./src/${market.name}.sol`,
      prettier.format(templateV3, { filepath: `./src/${market.name}.sol` })
    );

    const templateV3Js = `export const POOL_ADDRESSES_PROVIDER = "${addressProvider}";
export const POOL = "${pool}";
export const POOL_CONFIGURATOR = "${poolConfigurator}";
export const ORACLE = "${oracle}";
export const AAVE_PROTOCOL_DATA_PROVIDER = "${poolDataProvider}";
export const ACL_MANAGER = "${aclManager}";
export const ACL_ADMIN = "${aclAdmin}";
export const COLLECTOR = "${collector}";
export const COLLECTOR_CONTROLLER = "${collectorController}";
export const CHAIN_ID = ${market.chainId};`;
    fs.writeFileSync(
      `./src/ts/${market.name}.ts`,
      prettier.format(templateV3Js, {
        filepath: `./src/ts/${market.name}.ts`,
      })
    );

    return {
      pool,
      poolConfigurator,
      oracle,
      aclAdmin,
      aclManager,
      poolDataProvider,
      collectorController,
      collector,
      ...market,
    };
  } catch (error: any) {
    throw new Error(
      JSON.stringify({ message: error.message, market, stack: error.stack })
    );
  }
}
