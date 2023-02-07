import fs from 'fs';

export type ReserveData = {
  symbol: string;
  underlyingAsset: string;
  decimals: number;
  aTokenAddress: string;
  stableDebtTokenAddress: string;
  variableDebtTokenAddress: string;
  interestRateStrategyAddress: string;
  priceOracle: string;
};

/**
 * As symbols are used as variable name in Solidity and Javascript there are certain characters that are not allowed and should be replaced.
 * `-` are replaced with `_`
 * `.` are removed
 * ` `(spaces) are replaced with `_`
 * `1` are replaced with `ONE_`
 * There are certain assets with no proper symbol, so we fix it manually, based on underlying
 */
function fixSymbol(symbol: string, _underlying: string) {
  const underlying = _underlying.toLowerCase();
  switch (underlying) {
    case '0x50379f632ca68d36e50cfbc8f78fe16bd1499d1e':
      return 'GUNI_DAI_USDC';
    case '0xd2eec91055f07fe24c9ccb25828ecfefd4be0c41':
      return 'GUNI_USDC_USDT';
    case '0xae461ca67b15dc8dc81ce7615e0320da1a9ab8d5':
      return 'UNI_DAI_USDC';
    case '0x004375dff511095cc5a197a54140a24efef3a416':
      return 'UNI_WBTC_USDC';
    case '0xa478c2975ab1ea89e8196811f51a7b7ade33eb11':
      return 'UNI_DAI_WETH';
    case '0xb4e16d0168e52d35cacd2c6185b44281ec28c9dc':
      return 'UNI_USDC_WETH';
    case '0xdfc14d2af169b0d36c4eff567ada9b2e0cae044f':
      return 'UNI_AAVE_WETH';
    case '0xb6909b960dbbe7392d405429eb2b3649752b4838':
      return 'UNI_BAT_WETH';
    case '0x3da1313ae46132a397d90d95b1424a9a7e3e0fce':
      return 'UNI_CRV_WETH';
    case '0xa2107fa5b38d9bbd2c461d6edf11b11a50f6b974':
      return 'UNI_LINK_WETH';
    case '0xc2adda861f89bbb333c90c492cb837741916a225':
      return 'UNI_MKR_WETH';
    case '0x8bd1661da98ebdd3bd080f0be4e6d9be8ce9858c':
      return 'UNI_REN_WETH';
    case '0x43ae24960e5534731fc831386c07755a2dc33d47':
      return 'UNI_SNX_WETH';
    case '0xd3d2e2692501a5c9ca623199d38826e513033a17':
      return 'UNI_UNI_WETH';
    case '0xbb2b8038a1640196fbe3e38816f3e67cba72d940':
      return 'UNI_WBTC_WETH';
    case '0x2fdbadf3c4d5a8666bc06645b8358ab803996e28':
      return 'UNI_YFI_WETH';
    case '0x1eff8af5d577060ba4ac8a29a13525bb0ee2a3d5':
      return 'BPT_WBTC_WETH';
    case '0x59a19d8c652fa0284f44113d0ff9aba70bd46fb4':
      return 'BPT_BAL_WETH';
  }
  return symbol.replace('-', '_').replace('.', '').replace(' ', '_').replace('1', 'ONE_');
}

export function appendAssetsLibrarySol(name: string, reserves: ReserveData[]) {
  const templateV3Assets = `\n\nlibrary ${name}Assets {
    ${reserves
      .map((reserve) => {
        const symbol = fixSymbol(reserve.symbol, reserve.underlyingAsset);
        return `address internal constant ${symbol}_UNDERLYING = ${reserve.underlyingAsset};\n
          address internal constant ${symbol}_A_TOKEN = ${reserve.aTokenAddress};\n
          address internal constant ${symbol}_V_TOKEN = ${reserve.variableDebtTokenAddress};\n
          address internal constant ${symbol}_S_TOKEN = ${reserve.stableDebtTokenAddress};\n
          address internal constant ${symbol}_ORACLE = ${reserve.priceOracle};\n
          address internal constant ${symbol}_INTEREST_RATE_STRATEGY = ${reserve.interestRateStrategyAddress};\n\n`;
      })
      .join('')}
    }
  `;
  fs.appendFileSync(`./src/${name}.sol`, templateV3Assets);
}
