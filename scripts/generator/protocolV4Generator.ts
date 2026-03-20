import {PoolV4Config} from '../configs/types';
import {writeFileSync} from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {fetchV4Addresses} from './protocol-v4-generator/fetchV4Addresses';

export function generateProtocolV4Library(poolConfig: PoolV4Config) {
  const addresses = fetchV4Addresses(poolConfig);
  const name = `AaveV4${poolConfig.name}`;

  const allAddresses = {
    ...addresses,
    ...poolConfig.additionalAddresses,
  };

  // generate main library
  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        wrapIntoSolidityLibrary(
          generateSolidityConstants({
            chainId: poolConfig.chainId,
            addresses: allAddresses,
          }),
          name,
        ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId: poolConfig.chainId,
        addresses: {
          ...allAddresses,
          CHAIN_ID: {value: poolConfig.chainId, type: 'uint256'},
        },
      }).join('\n'),
    ),
  );

  return {
    name,
    js: [`export * as ${name} from './${name}';`],
  };
}
