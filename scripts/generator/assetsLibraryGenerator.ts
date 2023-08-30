import {Hex, PublicClient, zeroAddress} from 'viem';
import {ReserveData} from '../configs/types';
import {fixSymbol, generateSolidityConstants, wrapIntoSolidityLibrary} from './utils';

export function generateAssetsLibrary(
  publicClient: PublicClient,
  reservesData: ReserveData[],
  libraryName: string,
) {
  const formattedReservesData = reservesData.map(({symbol: _symbol, ...rest}) => {
    const symbol = fixSymbol(_symbol, rest.UNDERLYING);
    return {
      [`${symbol}_UNDERLYING`]: rest.UNDERLYING,
      [`${symbol}_DECIMALS`]: {value: rest.decimals, type: 'uint256'},
      [`${symbol}_A_TOKEN`]: rest.A_TOKEN,
      [`${symbol}_V_TOKEN`]: rest.V_TOKEN,
      [`${symbol}_S_TOKEN`]: rest.S_TOKEN,
    };
  });

  const innerObject = reservesData.reduce(
    (acc, {symbol: _symbol, ...rest}) => {
      const symbol = fixSymbol(_symbol, rest.UNDERLYING);
      acc[symbol] = rest;
      if (rest.STATA_TOKEN && rest.STATA_TOKEN != zeroAddress) {
        acc[symbol].STATA_TOKEN = rest.STATA_TOKEN;
      }
      return acc;
    },
    {} as {[address: string]: {[key: string]: Hex | number}},
  );
  let templateV3Assets = `export const ${libraryName} = ${JSON.stringify(innerObject, null, 2)}`;
  return {
    solidity: wrapIntoSolidityLibrary(
      formattedReservesData.map((r) => generateSolidityConstants(publicClient, r)).flat(),
      libraryName,
    ),
    js: templateV3Assets,
  };
}
