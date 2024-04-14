import fs from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {ChainId} from './chains';

const SAFETY_MODULE = {
  STK_AAVE: '0x4da27a545c0c5B758a6BA100e3a049001de870f5',
  STK_ABPT: '0xa1116930326D21fB917d5A27F1E9943A9595fb47',
  STK_ABPT_ORACLE: '0x209Ad99bd808221293d03827B86cC544bcA0023b',
  STK_ABPT_V2_ORACLE: '0xADf86b537eF08591c2777E144322E8b0Ca7E82a7',
} as const;

export function generateSafetyModule() {
  const name = 'AaveSafetyModule';

  fs.writeFileSync(
    `./src/AaveSafetyModule.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        wrapIntoSolidityLibrary(
          generateSolidityConstants({chainId: ChainId.mainnet, addresses: SAFETY_MODULE}),
          name,
        ),
      ),
    ),
  );

  fs.writeFileSync(
    `./src/ts/AaveSafetyModule.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({chainId: ChainId.mainnet, addresses: SAFETY_MODULE}).join('\n'),
    ),
  );

  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [
      `import {AaveGovernanceV2, IGovernanceStrategy} from './AaveGovernanceV2.sol';`,
      `import {${name}} from './${name}.sol';`,
    ],
  };
}
