import { ethers } from "ethers";
import { Market, Token } from "./config";
import fs from "fs";
import addressProviderV3ABI from "./abi/address_provider_v3_abi.json";
import poolV3ABI from "./abi/pool_v3_abi.json";
import erc20ABI from "./abi/erc20_abi.json";
import aTokenV3ABI from "./abi/aToken_v3_abi.json";
import prettier from "prettier";

export async function generateMarketV3(market: Market) {
  const provider = new ethers.providers.StaticJsonRpcProvider(market.rpc);
  // using getAddress to get correct checksum in case the one in config isn't correct
  const addressProvider = ethers.utils.getAddress(market.addressProvider);
  const contract = new ethers.Contract(
    addressProvider,
    addressProviderV3ABI,
    provider
  );
  try {
    const pool = await contract.getPool();
    const poolConfigurator = await contract.getPoolConfigurator();
    const oracle = await contract.getPriceOracle();
    const admin = await contract.owner();
    const aclAdmin = await contract.getACLAdmin();
    const aclManager = await contract.getACLManager();
    const poolDataProvider = await contract.getPoolDataProvider();

    const lendingPoolContract = new ethers.Contract(pool, poolV3ABI, provider);

    const reserves: string[] = await lendingPoolContract.getReservesList();
    const tokenList = await Promise.all(
      reserves.map(async (reserve) => {
        const data = await lendingPoolContract.getReserveData(reserve);
        const erc20Contract = new ethers.Contract(reserve, erc20ABI, provider);
        const symbol =
          reserve === "0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2" // doesn't follow erc20 symbol
            ? "MKR"
            : await erc20Contract.symbol();
        // const aTokenContract = new ethers.Contract(
        //   data.aTokenAddress,
        //   aTokenV3ABI,
        //   provider
        // );
        return {
          symbol,
          underlyingAsset: reserve,
          aTokenAddress: data.aTokenAddress,
          stableDebtTokenAddress: data.stableDebtTokenAddress,
          variableDebtTokenAddress: data.variableDebtTokenAddress,
          // reserveTreasuryAddress:
          //   await aTokenContract.RESERVE_TREASURY_ADDRESS(),
        };
      })
    );

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

      address internal constant POOL_ADMIN = ${admin};
  
      address internal constant ACL_ADMIN = ${aclAdmin};
  
      function getToken(string calldata symbol) public pure returns(Token memory m) {
        ${tokenList.reduce((acc, token, ix) => {
          const isLast = ix === tokenList.length - 1;
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
      }
  }\r\n`;
    fs.writeFileSync(
      `./src/${market.name}.sol`,
      prettier.format(templateV3, { filepath: `./src/${market.name}.sol` })
    );

    // Create the test for the specified market
    const testTemplateV3 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import "forge-std/Test.sol";
  import {${market.name}} from "../AaveAddressBook.sol";
  
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
  
      function testFailACLAdminIs0Address() public {
          assertEq(${market.name}.ACL_ADMIN, address(0));
      }
  }\r\n`;
    const testPath = `./src/test/${market.name}.t.sol`;
    fs.writeFileSync(
      testPath,
      prettier.format(testTemplateV3, { filepath: testPath })
    );

    return {
      pool,
      poolConfigurator,
      oracle,
      admin,
      aclAdmin,
      aclManager,
      tokenList,
      poolDataProvider,
      ...market,
    };
  } catch (error: any) {
    throw new Error(
      JSON.stringify({ message: error.message, market, stack: error.stack })
    );
  }
}

interface MarketV3 extends Market {
  pool: string;
  poolConfigurator: string;
  oracle: string;
  admin: string;
  poolDataProvider: string;
  aclAdmin: string;
  aclManager: string;
  tokenList: Token[];
}

export async function generateIndexFileV3(
  markets: MarketV3[],
  testnet?: boolean
) {
  const templateV3 = `// SPDX-License-Identifier: MIT
  pragma solidity >=0.6.0;
  
  import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager} from "./AaveV3.sol";
  import {Token} from './Common.sol';

  library AaveAddressBookV3${testnet ? "Testnet" : ""} {
  ${markets.reduce((acc, market) => {
    acc += `    string public constant ${market.name} = '${market.name}';\n`;
    return acc;
  }, "")}

      struct Market {
        IPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        IPool POOL;
        IPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        IAaveProtocolDataProvider POOL_DATA_PROVIDER;
        IACLManager ACL_MANAGER;
        address POOL_ADMIN;
        address ACL_ADMIN;
      }
  
      function getMarket(string calldata market) public pure returns(Market memory m) {
  ${markets.reduce((acc, market, ix) => {
    const isLast = ix === markets.length - 1;
    const start = ix === 0 ? "        if" : " else if";
    acc += `${start} (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((${
      market.name
    })))) {
              return Market(
                  IPoolAddressesProvider(
                      ${market.addressProvider}
                  ),
                  IPool(${market.pool}),
                  IPoolConfigurator(${market.poolConfigurator}),
                  IAaveOracle(${market.oracle}),
                  IAaveProtocolDataProvider(${market.poolDataProvider}),
                  IACLManager(${market.aclManager}),
                  ${market.admin},
                  ${market.aclAdmin}
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
    ? `./src/AaveAddressBookV3Testnet.sol`
    : `./src/AaveAddressBookV3.sol`;
  fs.writeFileSync(
    fileName,
    prettier.format(templateV3, { filepath: fileName })
  );
}
