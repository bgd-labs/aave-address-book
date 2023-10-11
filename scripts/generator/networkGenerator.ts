import * as fs from 'fs';
import {NetworkAddresses} from '../configs/types';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';

export function generateNetworkAddresses(config: NetworkAddresses<any>) {
  const name = `Misc${config.name}`;

  fs.writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        wrapIntoSolidityLibrary(
          generateSolidityConstants({chainId: config.chainId, addresses: config.addresses}),
          name,
        ),
      ),
    ),
  );
  fs.writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({chainId: config.chainId, addresses: config.addresses}).join('\n'),
    ),
  );
  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
