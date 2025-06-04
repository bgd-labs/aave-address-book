import {Address, Client, getContract} from 'viem';
import {IPool_ABI} from '../../../src/ts/abis/IPool';

export async function fetchExternalPoolLibraries(client: Client, poolAddress: Address) {
  const poolContract = getContract({address: poolAddress, abi: IPool_ABI, client});
  const [FLASHLOAN_LOGIC, BORROW_LOGIC, E_MODE_LOGIC, LIQUIDATION_LOGIC, POOL_LOGIC, SUPPLY_LOGIC] =
    await Promise.all([
      poolContract.read.getFlashLoanLogic(),
      poolContract.read.getBorrowLogic(),
      poolContract.read.getEModeLogic(),
      poolContract.read.getLiquidationLogic(),
      poolContract.read.getPoolLogic(),
      poolContract.read.getSupplyLogic(),
    ]);
  return {
    FLASHLOAN_LOGIC,
    BORROW_LOGIC,
    E_MODE_LOGIC,
    LIQUIDATION_LOGIC,
    POOL_LOGIC,
    SUPPLY_LOGIC,
  };
}
