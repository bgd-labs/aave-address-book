import util from 'node:util';
import {exec} from 'node:child_process';
import {existsSync, mkdirSync, rmSync, writeFileSync} from 'node:fs';
import {prefixWithGeneratedWarning} from './utils';

const awaitableExec = util.promisify(exec);

const INTERFACES = [
  'IAaveGovernanceV2',
  'ICollector',
  'AggregatorInterface',
  'IPayloadsControllerCore',
  'IVotingMachineWithProofs',
  'IGovernanceCore',
  'IVotingStrategy',
  'IGovernancePowerStrategy',
];

export async function generateABIs() {
  if (existsSync('./src/ts/abis')) {
    rmSync('./src/ts/abis', {recursive: true});
  }
  mkdirSync('./src/ts/abis');
  const jsExports: string[] = [];
  for (const INTERFACE of INTERFACES) {
    const {stdout, stderr} = await awaitableExec(`forge inspect ${INTERFACE} abi`);
    if (stderr) {
      throw new Error(`Failed to generate abi for ${INTERFACE}`);
    }
    const varName = `${INTERFACE}_ABI`;
    writeFileSync(
      `./src/ts/abis/${INTERFACE}.ts`,
      prefixWithGeneratedWarning(
        `export const ${varName} = ${JSON.stringify(JSON.parse(stdout.trim()), null, 2)} as const;`,
      ),
    );
    jsExports.push(`export {${varName}} from './abis/${INTERFACE}';`);
  }
  return {
    solidity: [],
    js: jsExports,
  };
}
