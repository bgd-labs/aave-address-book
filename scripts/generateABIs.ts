import util from 'node:util';
import {exec} from 'node:child_process';
import {existsSync, mkdirSync, rmSync, writeFileSync} from 'node:fs';
import {prefixWithGeneratedWarning} from 'scripts/generator/utils';
import {ABI_INTERFACES, DOWNLOAD_ABI_INTERFACES, resolveAbiInterface} from 'scripts/configs/abis';

const awaitableExec = util.promisify(exec);

export async function generateABIs(removeExisting: boolean) {
  if (existsSync('./src/ts/abis')) {
    if (removeExisting) {
      rmSync('./src/ts/abis', {recursive: true});
      mkdirSync('./src/ts/abis');
    }
  } else {
    mkdirSync('./src/ts/abis');
  }
  for (const ENTRY of ABI_INTERFACES) {
    const {path, name} = resolveAbiInterface(ENTRY);
    const {stdout, stderr} = await awaitableExec(`forge inspect --json ${path} abi`);
    if (stderr) {
      throw new Error(`Failed to generate abi for ${name}`);
    }
    const varName = `${name}_ABI`;
    writeFileSync(
      `./src/ts/abis/${name}.ts`,
      prefixWithGeneratedWarning(
        `export const ${varName} = ${JSON.stringify(JSON.parse(stdout.trim()), null, 2)} as const;`,
      ),
    );
  }
  for (const INTERFACE of DOWNLOAD_ABI_INTERFACES) {
    const fileName = `./src/ts/abis/${INTERFACE.name}.ts`;
    if (existsSync(fileName)) {
      console.log(`skipping download of abi ${INTERFACE.name} as it already exists`);
      continue;
    }
    const {stdout, stderr} = await awaitableExec(`cast interface -j ${INTERFACE.address}`);
    if (stderr) {
      throw new Error(`Failed to generate abi for ${INTERFACE.name} from ${INTERFACE.address}`);
    }
    const varName = `${INTERFACE.name}_ABI`;
    writeFileSync(
      fileName,
      prefixWithGeneratedWarning(
        `export const ${varName} = ${JSON.stringify(JSON.parse(stdout.trim()), null, 2)} as const;`,
      ),
    );
  }
}

generateABIs(false);
