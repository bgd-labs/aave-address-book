import { ethers, utils } from "ethers";
import { Pool } from "./config";

export const bytes32toAddress = (bytes32: string) => {
  return utils.getAddress(`0x${bytes32.slice(26)}`);
};

export const getImplementationStorageSlot = async (
  provider: ethers.providers.StaticJsonRpcProvider,
  address: string
) => {
  return await provider.getStorageAt(
    address,
    "0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc"
  );
};

export const generateAdditionalAddresses = (pool: Pool): string => {
  if (pool.additionalAddresses) {
    return Object.keys(pool.additionalAddresses).reduce((acc, key) => {
      acc += `export const ${key} = "${
        pool.additionalAddresses![key as keyof typeof pool.additionalAddresses]
      }";\r\n`;
      return acc;
    }, "");
  }
  return "";
};

export async function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
