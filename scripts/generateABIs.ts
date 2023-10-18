import util from 'node:util';
import {exec} from 'node:child_process';
import {existsSync, mkdirSync, rmSync, writeFileSync} from 'node:fs';
import {prefixWithGeneratedWarning} from './generator/utils';
import {ABI_INTERFACES, DOWNLOAD_ABI_INTERFACES} from './configs/abis';

const awaitableExec = util.promisify(exec);

export async function generateABIs() {
  if (existsSync('./src/ts/abis')) {
    rmSync('./src/ts/abis', {recursive: true});
  }
  mkdirSync('./src/ts/abis');
  for (const INTERFACE of ABI_INTERFACES) {
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
  }
  for (const INTERFACE of DOWNLOAD_ABI_INTERFACES) {
    const {stdout, stderr} = await awaitableExec(`cast interface -j ${INTERFACE.address}`);
    if (stderr) {
      throw new Error(`Failed to generate abi for ${INTERFACE.name} from ${INTERFACE.address}`);
    }
    const varName = `${INTERFACE.name}_ABI`;
    writeFileSync(
      `./src/ts/abis/${INTERFACE.name}.ts`,
      prefixWithGeneratedWarning(
        `export const ${varName} = ${JSON.stringify(JSON.parse(stdout.trim()), null, 2)} as const;`,
      ),
    );
  }
}

generateABIs();
