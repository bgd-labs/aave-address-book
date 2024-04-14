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
  SHORT_EXECUTOR: '0xEE56e2B3D491590B5b31738cC34d5232F378a8D5',
  LONG_EXECUTOR: '0x79426A1c24B2978D90d7A5070a46C65B07bC4299',
  ARC_TIMELOCK: '0xAce1d11d836cb3F51Ef658FD4D353fFb3c301218',
  POLYGON_BRIDGE_EXECUTOR: {
    value: '0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772',
    type: 'address',
    chainId: ChainId.polygon,
  },
  OPTIMISM_BRIDGE_EXECUTOR: {
    value: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
    type: 'address',
    chainId: ChainId.optimism,
  },
  ARBITRUM_BRIDGE_EXECUTOR: {
    value: '0x7d9103572bE58FfE99dc390E8246f02dcAe6f611',
    type: 'address',
    chainId: ChainId.arbitrum_one,
  },
  METIS_BRIDGE_EXECUTOR: {
    value: '0x8EC77963068474a45016938Deb95E603Ca82a029',
    type: 'address',
    chainId: ChainId.metis,
  },
  BASE_BRIDGE_EXECUTOR: {
    value: '0xA9F30e6ED4098e9439B2ac8aEA2d3fc26BcEbb45',
    type: 'address',
    chainId: ChainId.base,
  },
  CROSSCHAIN_FORWARDER_POLYGON: '0x158a6bC04F0828318821baE797f50B0A1299d45b',
  CROSSCHAIN_FORWARDER_OPTIMISM: '0x5f5C02875a8e9B5A26fbd09040ABCfDeb2AA6711',
  CROSSCHAIN_FORWARDER_ARBITRUM: '0xd1B3E25fD7C8AE7CADDC6F71b461b79CD4ddcFa3',
  CROSSCHAIN_FORWARDER_METIS: '0x2fE52eF191F0BE1D98459BdaD2F1d3160336C08f',
  CROSSCHAIN_FORWARDER_BASE: '0x3215225538da1546FE0DA88ee13019f402078942',
};

export function generateGovV2() {
  const name = 'AaveGovernanceV2';

  fs.writeFileSync(
    `./src/AaveGovernanceV2.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
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
      generateJsConstants({
        chainId: ChainId.mainnet,
        addresses: {...govV2Addresses, CHAIN_ID: {value: 1, type: 'uint256'}},
      }).join('\n'),
    ),
  );

  return {
    js: [`export * as ${name} from './${name}';`],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
