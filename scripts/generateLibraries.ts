/**
 * This package is currently a bit of a mess as it has grown quite massively over time.
 * So things were monkey patched here and there, resulting in scripts that append to files multiple times.
 * This `generateLibraries` entrypoint is supposed to be refactored, to be the **only** entrypoint for generating libraries in the future (removig the current generateAddresses).
 * For now it just appends to existing libraries though.
 */

import {appendFileSync} from 'fs';
import {PoolConfig} from './configs/types';
import {getUmbrellaConfig} from './generator/umbrella';

/**
 * The idea here would be to generate all addresses for a
 * @param configs
 */
export async function generateLibraries(configs: {poolv3?: PoolConfig}) {
  let jsPoolLibrary = '';
  if (configs.poolv3?.additionalAddresses.UMBRELLA) {
    const umbrellaConfig = await getUmbrellaConfig(
      configs.poolv3.chainId,
      configs.poolv3?.additionalAddresses.UMBRELLA,
    );
    jsPoolLibrary += `export const UMBRELLA_CONFIGURATION = ${JSON.stringify(
      umbrellaConfig.coverage,
      (_, v) => (typeof v === 'bigint' ? v.toString() : v),
      2,
    )} as const;\n`;
  }

  if (configs.poolv3 && jsPoolLibrary) {
    const name = `AaveV3${configs.poolv3.name}`;
    appendFileSync(`./src/ts/${name}.ts`, jsPoolLibrary);
  }
}
