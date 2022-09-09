import { ethers } from "ethers";
import { Market, Token } from "./config";
import fs from "fs";
import addressProviderV2ABI from "./abi/address_provider_v2_abi.json";
import lendingPoolV2ABI from "./abi/lending_pool_v2_abi.json";
import aTokenV2ABI from "./abi/aToken_v2_abi.json";
import collectorV2ABI from "./abi/collector_v2_abi.json";
import prettier from "prettier";

export interface MarketV2WithAddresses extends Market {
  lendingPool: string;
  poolDataProvider: string;
  lendingPoolConfigurator: string;
  oracle: string;
  admin: string;
  emergencyAdmin: string;
  collector: string;
  collectorController: string;
}

export async function generateMarketV2(
  market: Market
): Promise<MarketV2WithAddresses> {
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider: string = ethers.utils.getAddress(
    market.addressProvider
  );
  try {
    const addressProviderContract = new ethers.Contract(
      addressProvider,
      addressProviderV2ABI,
      market.provider
    );
    const lendingPool: string = await addressProviderContract.getLendingPool();
    const lendingPoolConfigurator: string =
      await addressProviderContract.getLendingPoolConfigurator();
    const oracle: string = await addressProviderContract.getPriceOracle();
    const admin: string = await addressProviderContract.getPoolAdmin();
    // const owner = await addressProviderContract.owner();
    const emergencyAdmin: string =
      await addressProviderContract.getEmergencyAdmin();
    const poolDataProvider: string = await addressProviderContract.getAddress(
      "0x0100000000000000000000000000000000000000000000000000000000000000"
    );

    const lendingPoolContract = new ethers.Contract(
      lendingPool,
      lendingPoolV2ABI,
      market.provider
    );

    const reserves: string[] = await lendingPoolContract.getReservesList();
    const data = await lendingPoolContract.getReserveData(reserves[0]);

    /**
     * While the reserve treasury address is per token in most cases it will be the same address, so for the sake of the address-book we assume it always is.
     */
    const aTokenContract = new ethers.Contract(
      data.aTokenAddress,
      aTokenV2ABI,
      market.provider
    );

    const collector = await aTokenContract.RESERVE_TREASURY_ADDRESS();

    const collectorContract = new ethers.Contract(
      collector,
      collectorV2ABI,
      market.provider
    );

    let collectorController;

    try {
      collectorController = await collectorContract.getFundsAdmin();
    } catch (e) {
      collectorController = "address(0)";
    }

    const templateV2Solidity = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
  import {Token} from './Common.sol';

  library ${market.name} {
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

      IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER = IAaveProtocolDataProvider(${poolDataProvider});
  
      address internal constant POOL_ADMIN = ${admin};
  
      address internal constant EMERGENCY_ADMIN = ${emergencyAdmin};

      address internal constant COLLECTOR = ${collector};

      address internal constant COLLECTOR_CONTROLLER = ${collectorController};
  }\r\n`;
    fs.writeFileSync(
      `./src/${market.name}.sol`,
      prettier.format(templateV2Solidity, {
        filepath: `./src/${market.name}.sol`,
      })
    );

    const templateV2Js = `export const POOL_ADDRESSES_PROVIDER = "${addressProvider}";
export const POOL = "${lendingPool}";   
export const POOL_CONFIGURATOR = "${lendingPoolConfigurator}";
export const ORACLE = "${oracle}";
export const AAVE_PROTOCOL_DATA_PROVIDER = "${poolDataProvider}";
export const POOL_ADMIN = "${admin}";
export const EMERGENCY_ADMIN = "${emergencyAdmin}";
export const COLLECTOR = "${collector}";
export const COLLECTOR_CONTROLLER = "${collectorController}";
export const CHAIN_ID = ${market.chainId};`;
    fs.writeFileSync(
      `./src/ts/${market.name}.ts`,
      prettier.format(templateV2Js, {
        filepath: `./src/ts/${market.name}.ts`,
      })
    );

    return {
      lendingPool,
      poolDataProvider,
      lendingPoolConfigurator,
      oracle,
      admin,
      emergencyAdmin,
      collector,
      collectorController,
      ...market,
    };
  } catch (error: any) {
    throw new Error(
      JSON.stringify({ message: error.message, market, stack: error.stack })
    );
  }
}

interface MarketV2 extends Market {
  lendingPool: string;
  lendingPoolConfigurator: string;
  oracle: string;
  admin: string;
  emergencyAdmin: string;
  poolDataProvider: string;
  collector: string;
  collectorController: string;
  tokenList: Token[];
}

export async function generateIndexFileV2(
  markets: MarketV2[],
  testnet?: boolean
) {
  const templateV2 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
  import {Token} from './Common.sol';

  library AaveAddressBookV2${testnet ? "Testnet" : ""} {
  ${markets.reduce((acc, market) => {
    acc += `    string public constant ${market.name} = '${market.name}';\n`;
    return acc;
  }, "")}
    
      struct Market {
        ILendingPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        ILendingPool POOL;
        ILendingPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider AAVE_PROTOCOL_DATA_PROVIDER;
        address POOL_ADMIN;
        address EMERGENCY_ADMIN;
        address COLLECTOR;
        address COLLECTOR_CONTROLLER;
      }
  
      function getMarket(string calldata market) public pure returns(Market memory m) {
  ${markets.reduce((acc, market, ix) => {
    const isLast = ix === markets.length - 1;
    const start = ix === 0 ? "        if" : " else if";
    acc += `${start} (keccak256(abi.encodePacked(market)) == keccak256(abi.encodePacked(${
      market.name
    }))) {
              return Market(
                  ILendingPoolAddressesProvider(
                      ${market.addressProvider}
                  ),
                  ILendingPool(${market.lendingPool}),
                  ILendingPoolConfigurator(${market.lendingPoolConfigurator}),
                  IAaveOracle(${market.oracle}),
                  IAaveProtocolDataProvider(${market.poolDataProvider}),
                  ${market.admin},
                  ${market.emergencyAdmin},
                  ${market.collector},
                  ${market.collectorController}
              );
          }${isLast ? ` else revert('Market does not exist');` : ""}`;
    return acc;
  }, "")}
    }
}\r\n`;
  const fileName = testnet
    ? `./src/AaveAddressBookV2Testnet.sol`
    : `./src/AaveAddressBookV2.sol`;
  fs.writeFileSync(
    fileName,
    prettier.format(templateV2, { filepath: fileName })
  );
}
