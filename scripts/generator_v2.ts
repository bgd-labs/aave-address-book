import { ethers } from "ethers";
import { Market, Token } from "./config";
import fs from "fs";
import addressProviderV2ABI from "../address_provider_v2_abi.json";
import lendingPoolV2ABI from "../lending_pool_v2_abi.json";
import erc20ABI from "../erc20_abi.json";
import prettier from "prettier";

export async function generateMarketV2(market: Market) {
  const provider = new ethers.providers.StaticJsonRpcProvider(market.rpc);
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = ethers.utils.getAddress(market.addressProvider);
  try {
    const addressProviderContract = new ethers.Contract(
      addressProvider,
      addressProviderV2ABI,
      provider
    );
    const lendingPool = await addressProviderContract.getLendingPool();
    const lendingPoolConfigurator =
      await addressProviderContract.getLendingPoolConfigurator();
    const oracle = await addressProviderContract.getPriceOracle();
    const admin = await addressProviderContract.owner();
    const emergencyAdmin = await addressProviderContract.getEmergencyAdmin();
    const poolDataProvider = await addressProviderContract.getAddress(
      "0x0100000000000000000000000000000000000000000000000000000000000000"
    );

    const lendingPoolContract = new ethers.Contract(
      lendingPool,
      lendingPoolV2ABI,
      provider
    );

    const reserves: string[] = await lendingPoolContract.getReservesList();
    const tokenList = await Promise.all(
      reserves.map(async (reserve) => {
        const data = await lendingPoolContract.getReserveData(reserve);
        const erc20Contract = new ethers.Contract(reserve, erc20ABI, provider);
        const symbol =
          reserve === "0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2" // doesn't follow erc20 symbol
            ? "MKR"
            : await erc20Contract.symbol();
        return {
          symbol,
          underlyingAsset: reserve,
          aTokenAddress: data.aTokenAddress,
          stableDebtTokenAddress: data.stableDebtTokenAddress,
          variableDebtTokenAddress: data.variableDebtTokenAddress,
        };
      })
    );

    const templateV2 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Token} from "./AaveV2.sol";
  
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
      
      function getToken(string calldata symbol) public pure returns(Token memory m) {
  ${tokenList.reduce((acc, token, ix) => {
    const isLast = ix === tokenList.length - 1;
    const start = ix === 0 ? "        if" : " else if";
    acc += `${start} (keccak256(abi.encodePacked((symbol))) == keccak256(abi.encodePacked(("${
      token.symbol
    }")))) {
              return Token(
                ${token.underlyingAsset},
                ${token.aTokenAddress},
                ${token.stableDebtTokenAddress},
                ${token.variableDebtTokenAddress}
              );
          }${isLast ? ` else revert('Token does not exist');` : ""}`;
    return acc;
  }, "")}
      }
  }\r\n`;
    fs.writeFileSync(
      `./src/${market.name}.sol`,
      prettier.format(templateV2, { filepath: `./src/${market.name}.sol` })
    );

    // Append the market to the addressBook
    fs.appendFileSync(
      `./src/AaveAddressBook.sol`,
      `import {${market.name}} from "./${market.name}.sol";\r\n`
    );

    // Create the test for the specified market
    const testTemplateV2 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import "forge-std/Test.sol";
  import {${market.name}} from "../${market.name}.sol";
  
  contract AaveAddressBookTest is Test {
      function setUp() public {}
  
      function testFailPoolAddressProviderIs0Address() public {
          assertEq(address(${market.name}.POOL_ADDRESSES_PROVIDER), address(0));
      }
  
      function testFailPoolAddressIs0Address() public {
          assertEq(address(${market.name}.POOL), address(0));
      }
  
      function testFailPoolConfiguratorIs0Address() public {
          assertEq(address(${market.name}.POOL_CONFIGURATOR), address(0));
      }
  
      function testFailOracleIs0Address() public {
          assertEq(address(${market.name}.ORACLE), address(0));
      }
  
      function testFailPoolAdminIs0Address() public {
          assertEq(${market.name}.POOL_ADMIN, address(0));
      }
  
      function testFailEmergencyAdminIs0Address() public {
          assertEq(${market.name}.EMERGENCY_ADMIN, address(0));
      }
  }\r\n`;
    fs.writeFileSync(`./src/test/${market.name}.t.sol`, testTemplateV2);
    return {
      lendingPool,
      poolDataProvider,
      lendingPoolConfigurator,
      oracle,
      admin,
      emergencyAdmin,
      tokenList,
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
  tokenList: Token[];
}

export async function generateIndexFileV2(
  markets: MarketV2[],
  testnet?: boolean
) {
  const templateV2 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Market, Token} from "./AaveV2.sol";
  
  library AaveAddressBookV2${testnet ? "Testnet" : ""} {
  ${markets.reduce((acc, market) => {
    acc += `    string public constant ${market.name} = '${market.name}';\n`;
    return acc;
  }, "")}
  
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
                  ${market.emergencyAdmin}
              );
          }${isLast ? ` else revert('Market does not exist');` : ""}`;
    return acc;
  }, "")}
      }
  
      function getToken(string calldata market, string calldata symbol) public pure returns(Token memory m) {
  ${markets.reduce((acc, market, ix) => {
    const isLast = ix === markets.length - 1;
    const start = ix === 0 ? "        if" : " else if";
    acc += `${start} (keccak256(abi.encodePacked(market)) == keccak256(abi.encodePacked(${
      market.name
    }))) {
      ${market.tokenList.reduce((acc, token, ix) => {
        const isLast = ix === market.tokenList.length - 1;
        const start = ix === 0 ? "        if" : " else if";
        acc += `${start} (keccak256(abi.encodePacked(symbol)) == keccak256(abi.encodePacked("${
          token.symbol
        }"))) {
                  return Token(
                    ${token.underlyingAsset},
                    ${token.aTokenAddress},
                    ${token.stableDebtTokenAddress},
                    ${token.variableDebtTokenAddress}
                  );
              }${isLast ? ` else revert('Token does not exist');` : ""}`;
        return acc;
      }, "")}
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
