import {existsSync, mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join} from 'node:path';
import {afterEach, describe, expect, it} from 'vitest';
import {generateJsonApi, sha256, stableStringify} from 'scripts/generateJsonApi';
import * as addressBook from 'src/ts/AaveAddressBook';

const COMMIT = '0123456789abcdef0123456789abcdef01234567';
const temporaryDirectories: string[] = [];

function createTemporaryDirectory(): string {
  const directory = mkdtempSync(join(tmpdir(), 'aave-address-book-api-'));
  temporaryDirectories.push(directory);
  return directory;
}

afterEach(() => {
  for (const directory of temporaryDirectories.splice(0)) {
    rmSync(directory, {recursive: true, force: true});
  }
});

describe('stableStringify', () => {
  it('sorts object keys recursively while retaining array order', () => {
    expect(stableStringify({z: {b: 2, a: 1}, a: [2, 1]})).toBe('{"a":[2,1],"z":{"a":1,"b":2}}');
  });

  it('rejects values that JSON.stringify would silently discard', () => {
    expect(() => stableStringify({unsupported: undefined})).toThrow(
      'Unsupported JSON value at $.unsupported: undefined',
    );
    expect(() => stableStringify({unsupported: 1n})).toThrow(
      'Unsupported JSON value at $.unsupported: bigint',
    );
  });
});

describe('generateJsonApi', () => {
  it('generates an aggregate, manifest, and exact file for every module', () => {
    const outputDirectory = createTemporaryDirectory();
    const staleModuleDirectory = join(outputDirectory, 'modules');
    mkdirSync(staleModuleDirectory, {recursive: true});
    writeFileSync(join(staleModuleDirectory, 'Stale.json'), '{}', 'utf8');

    const manifest = generateJsonApi({
      outputDirectory,
      packageVersion: 'test-version',
      commit: COMMIT,
    });
    const aggregateContents = readFileSync(join(outputDirectory, manifest.aggregate.path), 'utf8');
    const aggregate = JSON.parse(aggregateContents) as Record<string, unknown>;
    const moduleNames = Object.keys(addressBook).sort();

    expect(manifest.schemaVersion).toBe(1);
    expect(manifest.packageVersion).toBe('test-version');
    expect(manifest.commit).toBe(COMMIT);
    expect(manifest.modules.map(({name}) => name)).toEqual(moduleNames);
    expect(Object.keys(aggregate)).toEqual(moduleNames);
    expect(manifest.aggregate.bytes).toBe(Buffer.byteLength(aggregateContents, 'utf8'));
    expect(manifest.aggregate.sha256).toBe(sha256(aggregateContents));
    expect(existsSync(join(staleModuleDirectory, 'Stale.json'))).toBe(false);

    for (const entry of manifest.modules) {
      const contents = readFileSync(join(outputDirectory, entry.path), 'utf8');
      const moduleValue = addressBook[entry.name as keyof typeof addressBook] as unknown;

      expect(contents).toBe(stableStringify(moduleValue));
      expect(JSON.parse(contents)).toEqual(aggregate[entry.name]);
      expect(entry.chainId).toBe((moduleValue as {CHAIN_ID: number}).CHAIN_ID);
      expect(entry.bytes).toBe(Buffer.byteLength(contents, 'utf8'));
      expect(entry.sha256).toBe(sha256(contents));
    }

    const manifestOnDisk = JSON.parse(readFileSync(join(outputDirectory, 'manifest.json'), 'utf8'));
    expect(manifestOnDisk).toEqual(manifest);
  });

  it('rejects modules without a valid CHAIN_ID before replacing output', () => {
    const outputDirectory = createTemporaryDirectory();
    const sentinel = join(outputDirectory, 'sentinel');
    writeFileSync(sentinel, 'keep', 'utf8');

    expect(() =>
      generateJsonApi({
        outputDirectory,
        packageVersion: 'test-version',
        commit: COMMIT,
        source: {Invalid: {CHAIN_ID: 1.5}},
      }),
    ).toThrow('Address-book module Invalid must have a positive integer CHAIN_ID');
    expect(readFileSync(sentinel, 'utf8')).toBe('keep');
  });
});
