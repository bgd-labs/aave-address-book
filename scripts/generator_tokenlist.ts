import fs from "fs";
import prettier from "prettier";
import { schema } from "@uniswap/token-lists";
import Ajv from "ajv";
import addFormats from "ajv-formats";
import { MarketV2WithAddresses } from "./generator_v2";
import { MarketV3WithAddresses } from "./generator_v3";

//check if value is primitive
function isPrimitive(obj: any) {
  return obj !== Object(obj);
}

function deepEqual(obj1: any, obj2: any) {
  if (obj1 === obj2)
    // it's just the same object. No need to compare.
    return true;

  if (isPrimitive(obj1) && isPrimitive(obj2))
    // compare primitives
    return obj1 === obj2;

  if (Object.keys(obj1).length !== Object.keys(obj2).length) return false;

  // compare objects with same number of keys
  for (let key in obj1) {
    if (!(key in obj2)) return false; //other object doesn't have this prop
    if (!deepEqual(obj1[key], obj2[key])) return false;
  }

  return true;
}

export function generateTokenList(
  markets: (MarketV2WithAddresses | MarketV3WithAddresses)[]
) {
  const cache = require("../tokenlist.json");
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
        symbol: token.aTokenSymbol,
        address: token.aTokenAddress,
        tags: [market.version === 2 ? "atokenv2" : "atokenv3"],
        decimals: token.decimals,
        name: `Aave interest bearing ${token.symbol}`,
        chainId: market.chainId,
      });
    });
    return acc;
  }, [] as { symbol: string; address: string; decimals: number; name: string; chainId: number; tags: string[] }[]);
  if (deepEqual(cache.tokens, tokens)) {
    console.log("tokenlist already up to date");
    return;
  }
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
    timestamp: new Date().toISOString(),
    version: { ...cache.version, patch: cache.version.patch + 1 },
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
