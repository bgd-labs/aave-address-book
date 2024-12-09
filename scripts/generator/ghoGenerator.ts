import * as fs from 'fs';
import {GhoAddresses, NetworkAddresses} from '../configs/types';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';

export function generateGho(config: GhoAddresses) {
  const name = `Gho${config.name}`;

  let solidityLibrary = wrapIntoSolidityLibrary(
    generateSolidityConstants({chainId: config.chainId, addresses: config.addresses}),
    name,
  );

  fs.writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(prefixWithPragma(solidityLibrary)),
  );
  fs.writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId: config.chainId,
        addresses: {...config.addresses, CHAIN_ID: {value: config.chainId, type: 'uint256'}},
      }).join('\n'),
    ),
  );
  return {
    js: [`export * as ${name} from './${name}';`],
  };
}
