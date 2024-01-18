import * as fs from 'fs';
import {Addresses} from '../configs/types';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {ChainId} from '@bgd-labs/js-utils';

const govV2Addresses: Addresses = {
  GOV: {value: '0xEC568fffba86c094cf06b22134B23074DFE2252c', type: 'IAaveGovernanceV2'},
  SHORT_EXECUTOR: '0xEE56e2B3D491590B5b31738cC34d5232F378a8D5',
  LONG_EXECUTOR: '0x79426A1c24B2978D90d7A5070a46C65B07bC4299',
  ARC_TIMELOCK: '0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218',
};

export function generateGovV2() {
  const name = 'AaveGovernanceV2';

  fs.writeFileSync(
    `./src/AaveGovernanceV2.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {IGovernanceStrategy} from './common/IGovernanceStrategy.sol';\n` +
          `import {IAaveGovernanceV2, IExecutorWithTimelock} from './common/IAaveGovernanceV2.sol';\n` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({chainId: ChainId.mainnet, addresses: govV2Addresses}),
            name,
          ),
      ),
    ),
  );

  fs.writeFileSync(
    `./src/ts/AaveGovernanceV2.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({chainId: ChainId.mainnet, addresses: govV2Addresses}).join('\n'),
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
