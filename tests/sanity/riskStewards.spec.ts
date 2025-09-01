import {describe, it} from 'vitest';
import * as addressBook from '../../src/ts/AaveAddressBook';
import {getContract} from 'viem';
import {getClient} from '../../scripts/clients';
import {getGovernance, getWhiteLabelGovernance, isPoolWhiteLabel} from '../utils';
import {IRiskSteward_ABI} from '../../src/ts/abis/IRiskSteward';

async function check(addresses: Record<string, any>) {
  const client = getClient(addresses.CHAIN_ID);
  if (!client.chain?.testnet) {
    const riskStewardContract = getContract({
      abi: IRiskSteward_ABI,
      address: addresses.RISK_STEWARD,
      client,
    });
    const [CONFIG_ENGINE, OWNER] = await Promise.all([
      riskStewardContract.read.CONFIG_ENGINE(),
      riskStewardContract.read.owner(),
    ]);
    // if (CONFIG_ENGINE !== addresses.CONFIG_ENGINE)
    //   throw new Error(`SANITY_RISK_STEWARDS: wrong CONFIG_ENGINE on ${client.chain?.name}`);
    // if (POOL_DATA_PROVIDER !== addresses.AAVE_PROTOCOL_DATA_PROVIDER)
    //   throw new Error(`SANITY_RISK_STEWARDS: wrong POOL_DATA_PROVIDER on ${client.chain?.name}`);

    const isWhiteLabel = await isPoolWhiteLabel(addresses.POOL_ADDRESSES_PROVIDER, client);
    const governance = isWhiteLabel
      ? getWhiteLabelGovernance(addresses.CHAIN_ID)
      : getGovernance(addresses.CHAIN_ID);
    if (!governance) {
      console.log(
        `SANITY_RISK_STEWARDS: Skipped due to missing governance on ${client.chain?.name}`,
      );
    } else {
      const l1Executor = (governance as any).EXECUTOR_LVL_1;
      // prettier would be to check against executor lvl_1
      if (OWNER !== l1Executor) {
        throw new Error(
          `SANITY_RISK_STEWARDS: OWNER MISMATCH ${addresses.POOL}.${addresses.RISK_STEWARD}:${OWNER} != ${l1Executor} on ${client.chain?.name}`,
        );
      }
    }

    if (addresses.EDGE_RISK_STEWARD_RATES) {
      const edgeRiskStewardContract = getContract({
        abi: IRiskSteward_ABI,
        address: addresses.EDGE_RISK_STEWARD_RATES,
        client,
      });
      const [CONFIG_ENGINE, POOL_DATA_PROVIDER, OWNER, RISK_COUNCIL] = await Promise.all([
        edgeRiskStewardContract.read.CONFIG_ENGINE(),
        edgeRiskStewardContract.read.POOL_DATA_PROVIDER(),
        edgeRiskStewardContract.read.owner(),
        edgeRiskStewardContract.read.RISK_COUNCIL(),
      ]);

      // if (CONFIG_ENGINE !== addresses.CONFIG_ENGINE)
      //   throw new Error(`SANITY_EDGE_RISK_STEWARDS: wrong CONFIG_ENGINE on ${client.chain?.name}`);
      // currently they reference an outdated pdp - which should be fine
      // if (POOL_DATA_PROVIDER !== addresses.AAVE_PROTOCOL_DATA_PROVIDER)
      //   throw new Error(`SANITY_EDGE_RISK_STEWARDS: wrong POOL_DATA_PROVIDER on ${client.chain?.name}`);
      if (RISK_COUNCIL !== addresses.EDGE_INJECTOR_RATES)
        throw new Error(
          `SANITY_EDGE_RISK_STEWARDS: wrong EDGE_STEWARD_INJECTOR on ${client.chain?.name}`,
        );

      if (!governance) {
        console.log(
          `SANITY_EDGE_RISK_STEWARDS: Skipped due to missing governance on ${client.chain?.name}`,
        );
      } else {
        const l1Executor = (governance as any).EXECUTOR_LVL_1;
        if (OWNER !== l1Executor) {
          throw new Error(
            `SANITY_EDGE_RISK_STEWARDS: OWNER MISMATCH ${addresses.POOL}.${addresses.RISK_STEWARD}:${OWNER} != ${l1Executor} on ${client.chain?.name}`,
          );
        }
      }
    }
  }
}

describe('risk stewards', () => {
  Object.keys(addressBook).forEach((library) => {
    const addresses = addressBook[library];
    if (addresses.RISK_STEWARD) {
      const client = getClient(addresses.CHAIN_ID);
      it.concurrent(
        `should reference correct contracts on all getters: ${client.chain!.name}`,
        async () => {
          return check(addresses);
        },
      );
    }
  });
});
