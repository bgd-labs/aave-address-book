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

const v1Addresses: Addresses = {
  ADDRESSES_PROVIDER: '0x24a42fD28C976A61Df5D00D0599C34c4f90748c8',
  CORE: '0x3dfd23A6c5E8BbcFc9581d2E864a68feb6a076d3',
  POOL: '0x398eC7346DcD622eDc5ae82352F02bE94C62d119',
};

export function generateAaveV1() {
  const name = 'AaveV1';

  fs.writeFileSync(
    `./src/AaveV1.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        wrapIntoSolidityLibrary(
          generateSolidityConstants({chainId: ChainId.mainnet, addresses: v1Addresses}),
          name,
        ),
      ),
    ),
  );

  fs.writeFileSync(
    `./src/ts/AaveV1.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId: ChainId.mainnet,
        addresses: {...v1Addresses, CHAIN_ID: {value: 1, type: 'uint256'}},
      }).join('\n'),
    ),
  );

  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
