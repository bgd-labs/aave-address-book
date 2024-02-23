import {join} from 'path';
import {assets} from './generator/svgUtils';
import {readFileSync, writeFileSync} from 'fs';
import {optimize} from 'svgo';

const basePath = join(process.cwd(), 'assets');

const stataTemplate = readFileSync(join(basePath, 'templates', 'stata.svg'), {
  encoding: 'utf8',
});

function generateStataToken(fileName: string, underlying: string) {
  const svg = stataTemplate.replace(
    '<template />',
    underlying
      .replace(/width="[^"]*"/g, 'width="48"')
      .replace(/height="[^"]*"/g, 'height="48"')
  );
  writeFileSync(
    join(basePath, 'stataToken', fileName),
    optimize(svg, {
      plugins: [
        {
          name: 'preset-default',
          params: {
            overrides: {
              removeViewBox: false,
            },
          },
        },
      ],
    }).data,
  );
}

const aTemplate = readFileSync(join(basePath, 'templates', 'a.svg'), {
  encoding: 'utf8',
});

function generateAToken(fileName: string, underlying: string) {
  const svg = aTemplate.replace(
    '<template />',
    underlying
      .replace(/width="[^"]*"/g, 'width="48"')
      .replace(/height="[^"]*"/g, 'height="48"')
  );
  writeFileSync(
    join(basePath, 'aToken', fileName),
    optimize(svg, {
      plugins: [
        {
          name: 'preset-default',
          params: {
            overrides: {
              removeViewBox: false,
            },
          },
        },
      ],
    }).data,
  );
}

async function main() {
  for (const fileName of assets) {
    const underlying = readFileSync(join(basePath, 'underlying', fileName), {
      encoding: 'utf8',
    });
    generateStataToken(fileName, underlying);
    generateAToken(fileName, underlying);
  }
}

main();
