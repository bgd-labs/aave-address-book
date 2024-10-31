import {getContract} from 'viem';
import {getClient} from '../clients';
import {getGovernance} from './utils';
import {IRiskSteward_ABI} from '../../src/ts/abis/IRiskSteward';

export async function check(lib: string, addresses: Record<string, any>) {
  if (addresses.RISK_STEWARD) {
    const client = getClient(addresses.CHAIN_ID);
    if (!client.chain?.testnet) {
      const riskStewardContract = getContract({
        abi: IRiskSteward_ABI,
        address: addresses.RISK_STEWARD,
        client,
      });
      const [
        CONFIG_ENGINE,
        POOL_DATA_PROVIDER,
        OWNER
      ] = await Promise.all([
        riskStewardContract.read.CONFIG_ENGINE(),
        riskStewardContract.read.POOL_DATA_PROVIDER(),
        riskStewardContract.read.owner()
      ]);
      if (CONFIG_ENGINE !== addresses.CONFIG_ENGINE) throw new Error(`SANITY_RISK_STEWARDS: wrong CONFIG_ENGINE on ${client.chain?.name}`);
      if (POOL_DATA_PROVIDER !== addresses.AAVE_PROTOCOL_DATA_PROVIDER)
        throw new Error(`SANITY_RISK_STEWARDS: wrong POOL_DATA_PROVIDER on ${client.chain?.name}`);

      const governance = getGovernance(addresses.CHAIN_ID);
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
      console.log('SANITY_RISK_STEWARDS: PASSED');
    }
  }
}
