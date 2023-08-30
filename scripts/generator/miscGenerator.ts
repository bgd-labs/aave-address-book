import * as fs from 'fs';
import {AddressInfo} from '../configs/types';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {RPC_PROVIDERS} from './clients';

const miscAddresses: Record<Capitalize<string>, AddressInfo> = {
  ECOSYSTEM_RESERVE: '0x25F2226B597E8F9514B3F68F00f494cF4f286491',
  AAVE_ECOSYSTEM_RESERVE_CONTROLLER: {
    value: '0x3d569673dAa0575c936c7c67c4E6AedA69CC630C',
    type: 'IAaveEcosystemReserveController',
  },
  TRANSPARENT_PROXY_FACTORY_ETHEREUM: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
  PROXY_ADMIN_ETHEREUM: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
  PROXY_ADMIN_ETHEREUM_LONG: '0x86C3FfeE349A7cFf7cA88C449717B1b133bfb517',
  TRANSPARENT_PROXY_FACTORY_POLYGON: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
  PROXY_ADMIN_POLYGON: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
  TRANSPARENT_PROXY_FACTORY_AVALANCHE: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
  PROXY_ADMIN_AVALANCHE: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
  TRANSPARENT_PROXY_FACTORY_OPTIMISM: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
  PROXY_ADMIN_OPTIMISM: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
  TRANSPARENT_PROXY_FACTORY_ARBITRUM: '0xB4e496f70602fE2AC6Ae511D028BA4D194773B29',
  PROXY_ADMIN_ARBITRUM: '0xD3cF979e676265e4f6379749DECe4708B9A22476',
  TRANSPARENT_PROXY_FACTORY_METIS: '0x1dad86dC5990BCE5bFe3A150A4E0ece990d6EBcB',
  PROXY_ADMIN_METIS: '0x1CabD986cBAbDf12E00128DFf03C80ee62C4fd97',
  TRANSPARENT_PROXY_FACTORY_BASE: '0x05225Cd708bCa9253789C1374e4337a019e99D56',
  PROXY_ADMIN_BASE: '0xc85b1E333aecc99340b2320493Fe2d22b8734795',
};

export function generateMisc() {
  const name = 'AaveMisc';

  fs.writeFileSync(
    `./src/AaveMisc.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {IAaveEcosystemReserveController} from './common/IAaveEcosystemReserveController.sol';\n` +
          `import {IStreamable} from './common/IStreamable.sol';\n` +
          wrapIntoSolidityLibrary(generateSolidityConstants(RPC_PROVIDERS[1], miscAddresses), name),
      ),
    ),
  );
  fs.writeFileSync(
    `./src/ts/AaveMisc.ts`,
    prefixWithGeneratedWarning(generateJsConstants(RPC_PROVIDERS[1], miscAddresses).join('\n')),
  );
  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [
      `import {IAaveEcosystemReserveController, AaveMisc} from './AaveMisc.sol';`,
      `import {${name}} from './${name}.sol';`,
    ],
  };
}
