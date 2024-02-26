import {uploadToQuicknode} from '@bgd-labs/js-utils';
import {readFileSync} from 'fs';
import {join} from 'path';

const args = process.argv.slice(2);

const path = join(process.cwd(), args[0]);

const fileContent = readFileSync(path, {
  encoding: 'utf8',
});

function main() {
  return uploadToQuicknode(fileContent);
}

main();
