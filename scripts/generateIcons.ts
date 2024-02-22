import {join} from 'path';
import {VARIANT_SUFFIX, assets} from './generator/svgUtils';
import {readFileSync, writeFileSync} from 'fs';
import {XMLParser} from 'fast-xml-parser';

const basePath = join(process.cwd(), 'assets');

async function main() {
  for (const fileName of assets) {
    const underlying = readFileSync(join(basePath, 'underlying', fileName), {
      encoding: 'utf8',
    });
    generateStataToken(fileName, underlying);
  }
}

const stataTemplate = readFileSync(join(basePath, 'templates', 'stata.svg'), {
  encoding: 'utf8',
});

function generateStataToken(fileName: string, underlying: string) {
  const svg = stataTemplate.replace(
    '<template />',
    underlying
      .replace('height="48"', 'x="9" y="9" width="30" height="30"')
      .replace('width="48"', ''),
  );
  writeFileSync(join(basePath, 'stataToken', fileName), svg);
}

// TODO: fine the template somewhere
function generateAToken() {}

main();
