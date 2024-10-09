/**
 * Runs sanity checks over the given set of addresses
 */
import * as addressBook from '../src/ts/AaveAddressBook';
import {check as stataCheck} from './checks/stataFactory';
import {check as wethCheck} from './checks/wethGateway';

async function sanity() {
  const sanitySuites = [stataCheck, wethCheck];
  for (const key of Object.keys(addressBook)) {
    for (const suite of sanitySuites) {
      await suite(addressBook[key]);
    }
  }
}

sanity();
