import fs from "fs";
import prettier from "prettier";

import { Market, markets } from "./config";
import { generateMarketV2 } from "./generator_v2";
import { generateMarketV3 } from "./generator_v3";

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

  return generatedMarkets.map((m: any) => m.value);
}

async function generateMarkets() {
  // Create the test for the specified market
  const AaveAddressBookSolidityTemplate = `// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

${markets.reduce((acc, market) => {
  acc += `import {${market.name}} from "./${market.name}.sol";\r\n`;
  return acc;
}, "")}

import {AaveGovernanceV2, IGovernanceStrategy} from './AaveGovernanceV2.sol';
import {IAaveEcosystemReserveController, AaveMisc} from './AaveMisc.sol';
\r\n`;
  fs.writeFileSync(
    `./src/AaveAddressBook.sol`,
    prettier.format(AaveAddressBookSolidityTemplate, {
      filepath: `./src/AaveAddressBook.sol`,
    })
  );

  const AaveAddressBookJsTemplate = `${markets.reduce((acc, market) => {
    acc += `export * as ${market.name} from "./${market.name}";\r\n`;
    return acc;
  }, "")}`;
  fs.writeFileSync(
    `./src/ts/AaveAddressBook.ts`,
    prettier.format(AaveAddressBookJsTemplate, {
      filepath: `./src/ts/AaveAddressBook.ts`,
    })
  );
  await generateV2Markets(markets.filter((market) => market.version === 2));
  await generateV3Markets(markets.filter((market) => market.version === 3));
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
