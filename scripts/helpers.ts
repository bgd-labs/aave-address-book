import { ethers } from "ethers";

export const getImplementationStorageSlot = async (
  provider: ethers.providers.StaticJsonRpcProvider,
  address: string
) => {
  return await provider.getStorageAt(
    address,
    "0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103"
  );
};
