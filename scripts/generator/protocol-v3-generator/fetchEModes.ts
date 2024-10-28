import {Address, Client, getContract} from 'viem';
import {IPool_ABI} from '../../../src/ts/abis/IPool';
import {Addresses, EMode, ReserveData} from '../../configs/types';
import {bitMapToIndexes, generateSolidityConstants, wrapIntoSolidityLibrary} from '../utils';

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
    if (eModeData.liquidationThreshold == 0) {
      emptyCount++;
    } else {
      const [label, collateralBitmap, borrowableBitmap] = await Promise.all([
        poolContract.read.getEModeCategoryLabel([i]),
        poolContract.read.getEModeCategoryCollateralBitmap([i]),
        poolContract.read.getEModeCategoryBorrowableBitmap([i]),
      ]);
      eModes.set(i, {
        label,
        collateralBitmap,
        collateralAssets: bitMapToIndexes(collateralBitmap).map(
          (id) => reserveData.find((r) => r.id === id)!.UNDERLYING,
        ),
        borrowableBitmap,
        borrowableAssets: bitMapToIndexes(borrowableBitmap).map(
          (id) => reserveData.find((r) => r.id === id)!.UNDERLYING,
        ),
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
    acc[eMode.label.toUpperCase().replace(/[^A-Z0-9]+/gi, '_')] = {
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
