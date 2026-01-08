import {Address, Client, getContract} from 'viem';
import {IPool_ABI} from '../../../src/ts/abis/IPool';
import {Addresses, EMode, ReserveData} from '../../configs/types';
import {generateSolidityConstants, wrapIntoSolidityLibrary} from '../utils';
import {bitmapToIndexes} from '@bgd-labs/toolbox';
import {fixSymbol} from '../assetsLibraryGenerator';

/**
 * As eModes are stores in a mapping there is no easy way to fetch "all eModes"
 * Therefore we fetch one after another and simply assume there is no gap > n
 */
export async function fetchEModes(
  client: Client,
  poolAddress: Address,
  reserveData: ReserveData[],
) {
  const poolContract = getContract({address: poolAddress, abi: IPool_ABI, client});

  const eModes = new Map<
    number,
    EMode & {collateralAssets: Address[]; borrowableAssets: Address[]}
  >();
  let i = 1;
  let emptyCount = 0;
  while (true) {
    const eModeData = await poolContract.read.getEModeCategoryCollateralConfig([i]);
    if (eModeData.liquidationThreshold === 0) {
      emptyCount++;
    } else {
      const [collateralBitmap, borrowableBitmap] = await Promise.all([
        poolContract.read.getEModeCategoryCollateralBitmap([i]),
        poolContract.read.getEModeCategoryBorrowableBitmap([i]),
      ]);
      let ltvzeroBitmap = 0n;
      try {
        ltvzeroBitmap = await poolContract.read.getEModeCategoryLtvzeroBitmap([i]);
      } catch (e) {
        console.log(`Error fetching ltvzeroBitmap for eMode ${i}, pool ${poolAddress}`);
      }
      const collaterals = bitmapToIndexes(collateralBitmap).map(
        (id) => reserveData.find((r) => r.id === id)!,
      );
      const borrowables = bitmapToIndexes(borrowableBitmap).map(
        (id) => reserveData.find((r) => r.id === id)!,
      );
      const ltvzeros = bitmapToIndexes(ltvzeroBitmap).map(
        (id) => reserveData.find((r) => r.id === id)!,
      );
      eModes.set(i, {
        label: `${collaterals.map((a) => fixSymbol(a.symbol, a.UNDERLYING))} / ${borrowables.map((a) => fixSymbol(a.symbol, a.UNDERLYING))}`,
        collateralBitmap,
        collateralAssets: collaterals.map((a) => a.UNDERLYING),
        borrowableBitmap,
        borrowableAssets: borrowables.map((a) => a.UNDERLYING),
        ltvzeroBitmap,
        ltvzeroAssets: ltvzeros.map((a) => a.UNDERLYING),
        ...eModeData,
      });
    }
    if (emptyCount > 2) break;
    i++;
  }
  return eModes;
}

export function generateEmodeLibrary(
  chainId: number,
  eModes: Map<number, EMode>,
  libraryName: string,
) {
  const sorted = Array.from(eModes).sort(([keyA], [keyB]) => keyA - keyB);
  const formatted = sorted.reduce((acc, [value, eMode]) => {
    acc[eMode.label] = {
      value,
      type: 'uint8',
    };
    return acc;
  }, {} as Addresses);
  return {
    solidity: wrapIntoSolidityLibrary(
      generateSolidityConstants({
        chainId,
        addresses: {NONE: {value: 0, type: 'uint8'}, ...formatted},
      }),
      libraryName,
    ),
    js: `export const E_MODES = ${JSON.stringify(
      Object.fromEntries(eModes),
      (key, value) => (typeof value === 'bigint' ? value.toString() : value), // return everything else unchanged
      2,
    )} as const;\n`,
  };
}
