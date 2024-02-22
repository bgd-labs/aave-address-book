import {join} from 'path';
import {VARIANT_SUFFIX, assets} from './generator/svgUtils';
import {readFileSync, writeFileSync} from 'fs';

const basePath = join(process.cwd(), 'assets');

async function main() {
  for (const fileName of assets) {
    const underlying = readFileSync(join(basePath, 'underlying', fileName), {
      encoding: 'utf8',
    });
    generateStataToken(fileName, underlying);
  }
}

function generateStataToken(fileName: string, underlying: string) {
  writeFileSync(join(basePath, 'stataToken', fileName), underlying);
}

function generateAToken() {}

main();
