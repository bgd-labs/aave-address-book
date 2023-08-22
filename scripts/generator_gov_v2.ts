import * as fs from 'fs';
import {
  generateGovV2Addresses,
  generateGovV2AddressesSol,
} from './helpers';
import {GovernanceV2} from './config';

export function writeGovV2Templates(govV2Addresses: GovernanceV2): void {
  const templateGovV2Solidity = `// SPDX-License-Identifier: MIT
  // AUTOGENERATED - DON'T MANUALLY CHANGE
  pragma solidity >=0.6.0;
  pragma experimental ABIEncoderV2;

  import {IGovernanceStrategy} from './common/IGovernanceStrategy.sol';
  import {IAaveGovernanceV2} from './common/IAaveGovernanceV2.sol';

  library AaveGovernanceV2 {
    ${generateGovV2AddressesSol(govV2Addresses)}
  }
  `;

  fs.writeFileSync(`./src/AaveGovernanceV2.sol`, templateGovV2Solidity);

  const templateGovV2Js = `// AUTOGENERATED - DON'T MANUALLY CHANGE
    ${generateGovV2Addresses(govV2Addresses)}`;

  fs.writeFileSync(`./src/ts/AaveGovernanceV2.ts`, templateGovV2Js);
  fs.appendFileSync(`./src/ts/AaveAddressBook.ts`, `export * as AaveGovernanceV2 from './AaveGovernanceV2';\r\n`);
}
