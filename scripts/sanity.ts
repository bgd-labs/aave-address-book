/**
 * Runs sanity checks over the given set of addresses
 */
import * as addressBook from '../src/ts/AaveAddressBook';
import {check as stataCheck} from './checks/stataFactory';
import {check as wethCheck} from './checks/wethGateway';
import {check as configEngineCheck} from './checks/configEngine';
import {check as riskStewardsCheck} from './checks/riskStewards';

async function sanity() {
  const sanitySuites = [stataCheck, wethCheck, configEngineCheck, riskStewardsCheck];
  for (const key of Object.keys(addressBook)) {
    for (const suite of sanitySuites) {
      await suite(key, addressBook[key]);
    }
  }
}

sanity();
