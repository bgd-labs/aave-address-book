import util from 'node:util';
import {exec} from 'node:child_process';
import {existsSync, mkdirSync, rmSync, writeFileSync} from 'node:fs';

const awaitableExec = util.promisify(exec);

const INTERFACES = ['IAaveGovernanceV2', 'ICollector', 'AggregatorInterface'];

export async function generateABIs() {
  if (existsSync('./src/ts/abis')) {
    rmSync('./src/ts/abis', {recursive: true});
  }
  mkdirSync('./src/ts/abis');
  const jsExports = await Promise.all(
    INTERFACES.map(async (INTERFACE) => {
      const {stdout, stderr} = await awaitableExec(`forge inspect ${INTERFACE} abi`);
      if (stderr) {
        throw new Error(`Failed to generate abi for ${INTERFACE}`);
      }
      const varName = `${INTERFACE}_ABI`;
      writeFileSync(
        `./src/ts/abis/${INTERFACE}.ts`,
        `export const ${varName} = ${JSON.stringify(JSON.parse(stdout.trim()), null, 2)} as const;`,
      );
      return `export {${varName}} from './abis/${INTERFACE}';`;
    }),
  );
  return {
    solidity: [],
    js: jsExports,
  };
}
