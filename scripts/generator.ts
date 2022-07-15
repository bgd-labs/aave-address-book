import fs from "fs";
import prettier from "prettier";
import { schema } from "@uniswap/token-lists";
import Ajv from "ajv";
import addFormats from "ajv-formats";
import { Market, markets } from "./config";
import {
  generateIndexFileV2,
  generateMarketV2,
  MarketV2WithAddresses,
} from "./generator_v2";
import {
  generateIndexFileV3,
  generateMarketV3,
  MarketV3WithAddresses,
} from "./generator_v3";

async function generateV2Markets(markets: Market[]) {
  const generatedMarkets = await Promise.allSettled(
    markets.map((market) => generateMarketV2(market))
  );

  const failedMarkets = generatedMarkets.filter(
    (promise) => promise.status === "rejected"
  );

  if (failedMarkets.length > 0) {
    failedMarkets.forEach((failedMarket: any) => {
      const error = JSON.parse(failedMarket.reason.message);
      console.log(`
        Could not generate market for:
        - market: ${error.market.name}
        - market version: ${error.market.version}
        - network rpc: ${error.market.rpc}
        - trace: ${error.stack}
      `);
    });

    throw new Error("Some markets where not properly generated");
  }

  await generateIndexFileV2(
    generatedMarkets.map((m: any) => m.value).filter((m) => !m.testnet)
  );
  await generateIndexFileV2(
    generatedMarkets.map((m: any) => m.value).filter((m) => m.testnet),
    true
  );

  return generatedMarkets.map((m: any) => m.value);
}

async function generateV3Markets(markets: Market[]) {
  const generatedMarkets = await Promise.allSettled(
    markets.map((market) => generateMarketV3(market))
  );

  const failedMarkets = generatedMarkets.filter(
    (promise) => promise.status === "rejected"
  );

  if (failedMarkets.length > 0) {
    failedMarkets.forEach((failedMarket: any) => {
      const error = JSON.parse(failedMarket.reason.message);
      console.log(`
        Could not generate market for:
        - market: ${error.market.name}
        - market version: ${error.market.version}
        - network rpc: ${error.market.rpc}
        - trace: ${error.stack}
      `);
    });

    throw new Error("Some markets where not properly generated");
  }

  await generateIndexFileV3(
    generatedMarkets.map((m: any) => m.value).filter((m) => !m.testnet)
  );
  await generateIndexFileV3(
    generatedMarkets.map((m: any) => m.value).filter((m) => m.testnet),
    true
  );

  return generatedMarkets.map((m: any) => m.value);
}

function generateTokenList(
  markets: (MarketV2WithAddresses | MarketV3WithAddresses)[]
) {
  const tokens = markets.reduce((acc, market) => {
    market.tokenList.map((token) => {
      acc.push({
        symbol: token.symbol,
        address: token.underlyingAsset,
        tags: ["underlying"],
        decimals: token.decimals,
        name: token.name,
        chainId: market.chainId,
      });
      acc.push({
        symbol: token.symbol, // wrong
        address: token.aTokenAddress,
        tags: [market.version === 2 ? "atokenv2" : "atokenv3"],
        decimals: token.decimals,
        name: `Aave interest bearing ${token.symbol}`,
        chainId: market.chainId,
      });
    });
    return acc;
  }, [] as { symbol: string; address: string; decimals: number; name: string; chainId: number; tags: string[] }[]);
  const tokenList = {
    name: "Aave Token and aToken List",
    logoURI: "ipfs://QmWzL3TSmkMhbqGBEwyeFyWVvLmEo3F44HBMFnmTUiTfp1",
    tags: {
      underlying: {
        name: "underlyingAsset",
        description:
          "Tokens that are used as underlying assets in the aave protocol",
      },
      atokenv2: {
        name: "aToken V2",
        description: "Tokens that earn interest on the Aave Protocol V2",
      },
      atokenv3: {
        name: "aToken V3",
        description: "Tokens that earn interest on the Aave Protocol V3",
      },
    },
    timestamp: "2020-12-11T17:08:18.941Z",
    version: { major: 1, minor: 0, patch: 0 },
    tokens,
  };
  const ajv = new Ajv({ allErrors: true, verbose: true });
  addFormats(ajv);
  const validator = ajv.compile(schema);
  const valid = validator(tokenList);
  if (valid) {
    fs.writeFileSync(
      "./tokenlist.json",
      prettier.format(JSON.stringify(tokenList), {
        filepath: "./tokenlist.json",
      })
    );
  }
  if (validator.errors) {
    throw validator.errors.map((error) => {
      delete error.data;
      return error;
    });
  }
}

async function generateMarkets() {
  // Create the test for the specified market
  const AaveAddressBookTemplate = `// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

${markets.reduce((acc, market) => {
  acc += `import {${market.name}} from "./${market.name}.sol";\r\n`;
  return acc;
}, "")}
import {AaveAddressBookV2Testnet} from "./AaveAddressBookV2Testnet.sol";
import {AaveAddressBookV2} from "./AaveAddressBookV2.sol";
import {AaveAddressBookV3Testnet} from "./AaveAddressBookV3Testnet.sol";
import {AaveAddressBookV3} from "./AaveAddressBookV3.sol";

import {Token} from './Common.sol';
import {AaveGovernanceV2, IGovernanceStrategy} from './AaveGovernanceV2.sol';
\r\n`;
  fs.writeFileSync(
    `./src/AaveAddressBook.sol`,
    prettier.format(AaveAddressBookTemplate, {
      filepath: `./src/AaveAddressBook.sol`,
    })
  );
  const marketsV2 = await generateV2Markets(
    markets.filter((market) => market.version === 2)
  );
  const marketsV3 = await generateV3Markets(
    markets.filter((market) => market.version === 3)
  );

  generateTokenList([...marketsV2, ...marketsV3]);
}

generateMarkets()
  .then(() => {
    console.log("markets successfully generated");
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
