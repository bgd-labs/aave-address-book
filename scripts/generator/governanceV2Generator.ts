import * as fs from 'fs';
import {Addresses} from '../configs/types';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {ChainId} from './chains';

const govV2Addresses: Addresses = {
  GOV: '0xEC568fffba86c094cf06b22134B23074DFE2252c',
  GOV_STRATEGY: '0xb7e383ef9B1E9189Fc0F71fb30af8aa14377429e',
  SHORT_EXECUTOR: '0xEE56e2B3D491590B5b31738cC34d5232F378a8D5',
  LONG_EXECUTOR: '0x79426A1c24B2978D90d7A5070a46C65B07bC4299',
  ARC_TIMELOCK: '0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218',
  POLYGON_BRIDGE_EXECUTOR: '0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772',
  OPTIMISM_BRIDGE_EXECUTOR: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
  ARBITRUM_BRIDGE_EXECUTOR: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
  METIS_BRIDGE_EXECUTOR: '0x8EC77963068474a45016938Deb95E603Ca82a029',
  BASE_BRIDGE_EXECUTOR: '0xA9F30e6ED4098e9439B2ac8aEA2d3fc26BcEbb45',
  CROSSCHAIN_FORWARDER_POLYGON: {
    value: '0x158a6bC04F0828318821baE797f50B0A1299d45b',
    type: 'address',
    chainId: ChainId.polygon,
  },
  CROSSCHAIN_FORWARDER_OPTIMISM: {
    value: '0x5f5C02875a8e9B5A26fbd09040ABCfDeb2AA6711',
    type: 'address',
    chainId: ChainId.optimism,
  },
  CROSSCHAIN_FORWARDER_ARBITRUM: {
    value: '0xd1B3E25fD7C8AE7CADDC6F71b461b79CD4ddcFa3',
    type: 'address',
    chainId: ChainId.arbitrum_one,
  },
  CROSSCHAIN_FORWARDER_METIS: {
    value: '0x2fE52eF191F0BE1D98459BdaD2F1d3160336C08f',
    type: 'address',
    chainId: ChainId.metis,
  },
  CROSSCHAIN_FORWARDER_BASE: {
    value: '0x3215225538da1546FE0DA88ee13019f402078942',
    type: 'address',
    chainId: ChainId.base,
  },
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
