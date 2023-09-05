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
