import {createHash} from 'node:crypto';
import {execFileSync} from 'node:child_process';
import {mkdirSync, readFileSync, rmSync, writeFileSync} from 'node:fs';
import {join, resolve} from 'node:path';
import * as addressBook from '../src/ts/AaveAddressBook';

export type JsonValue = null | boolean | number | string | JsonValue[] | {[key: string]: JsonValue};

export type JsonApiFile = {
  path: string;
  bytes: number;
  sha256: string;
};

export type JsonApiModule = JsonApiFile & {
  name: string;
  chainId: number;
};

export type JsonApiManifest = {
  schemaVersion: 1;
  packageVersion: string;
  commit: string;
  aggregate: JsonApiFile;
  modules: JsonApiModule[];
};

type GenerateJsonApiOptions = {
  outputDirectory?: string;
  packageVersion?: string;
  commit?: string;
  source?: Record<string, unknown>;
};

const REPOSITORY_ROOT = resolve(__dirname, '..');
const DEFAULT_OUTPUT_DIRECTORY = join(REPOSITORY_ROOT, 'ui', 'out', 'api', 'v1');
const MODULE_NAME_PATTERN = /^[A-Za-z_$][A-Za-z0-9_$]*$/;
const COMMIT_PATTERN = /^[0-9a-f]{40}$/i;

function normalizeJsonValue(value: unknown, path: string, ancestors: Set<object>): JsonValue {
  if (value === null) return null;

  if (typeof value === 'string' || typeof value === 'boolean') return value;

  if (typeof value === 'number') {
    if (!Number.isFinite(value)) {
      throw new TypeError(`Non-finite number at ${path}`);
    }
    return value;
  }

  if (typeof value !== 'object') {
    throw new TypeError(`Unsupported JSON value at ${path}: ${typeof value}`);
  }

  if (ancestors.has(value)) {
    throw new TypeError(`Circular JSON value at ${path}`);
  }
  ancestors.add(value);

  if (Array.isArray(value)) {
    const normalized = value.map((item, index) =>
      normalizeJsonValue(item, `${path}[${index}]`, ancestors),
    );
    ancestors.delete(value);
    return normalized;
  }

  const prototype = Object.getPrototypeOf(value);
  if (prototype !== Object.prototype && prototype !== null) {
    throw new TypeError(`Non-plain object at ${path}`);
  }

  const normalized: {[key: string]: JsonValue} = {};
  for (const key of Object.keys(value).sort()) {
    normalized[key] = normalizeJsonValue(
      (value as Record<string, unknown>)[key],
      `${path}.${key}`,
      ancestors,
    );
  }
  ancestors.delete(value);
  return normalized;
}

export function stableStringify(value: unknown): string {
  return JSON.stringify(normalizeJsonValue(value, '$', new Set()));
}

export function sha256(value: string): string {
  return createHash('sha256').update(value, 'utf8').digest('hex');
}

function describeFile(path: string, contents: string): JsonApiFile {
  return {
    path,
    bytes: Buffer.byteLength(contents, 'utf8'),
    sha256: sha256(contents),
  };
}

function readPackageVersion(): string {
  const packageJson = JSON.parse(readFileSync(join(REPOSITORY_ROOT, 'package.json'), 'utf8')) as {
    version?: unknown;
  };

  if (typeof packageJson.version !== 'string' || !packageJson.version) {
    throw new Error('The root package.json does not contain a valid version');
  }
  return packageJson.version;
}

function resolveCommit(): string {
  const commit =
    process.env.GITHUB_SHA ??
    execFileSync('git', ['rev-parse', 'HEAD'], {
      cwd: REPOSITORY_ROOT,
      encoding: 'utf8',
    }).trim();

  if (!COMMIT_PATTERN.test(commit)) {
    throw new Error(`Expected a full git commit SHA, received: ${commit}`);
  }
  return commit.toLowerCase();
}

export function generateJsonApi(options: GenerateJsonApiOptions = {}): JsonApiManifest {
  const outputDirectory = resolve(options.outputDirectory ?? DEFAULT_OUTPUT_DIRECTORY);
  const source = options.source ?? (addressBook as unknown as Record<string, unknown>);
  const moduleNames = Object.keys(source).sort();

  if (moduleNames.length === 0) {
    throw new Error('The address book does not export any modules');
  }

  const aggregate: Record<string, JsonValue> = {};
  const moduleContents = new Map<string, string>();
  const modules: JsonApiModule[] = [];

  for (const name of moduleNames) {
    if (!MODULE_NAME_PATTERN.test(name)) {
      throw new Error(`Invalid address-book module name: ${name}`);
    }

    const moduleValue = source[name];
    const normalizedModule = normalizeJsonValue(moduleValue, `$.${name}`, new Set());

    if (
      normalizedModule === null ||
      Array.isArray(normalizedModule) ||
      typeof normalizedModule !== 'object'
    ) {
      throw new TypeError(`Address-book module ${name} must be an object`);
    }

    const chainId = normalizedModule.CHAIN_ID;
    if (typeof chainId !== 'number' || !Number.isSafeInteger(chainId) || chainId <= 0) {
      throw new TypeError(`Address-book module ${name} must have a positive integer CHAIN_ID`);
    }

    aggregate[name] = normalizedModule;
    const contents = JSON.stringify(normalizedModule);
    const path = `modules/${name}.json`;
    moduleContents.set(name, contents);
    modules.push({name, chainId, ...describeFile(path, contents)});
  }

  const aggregateContents = JSON.stringify(aggregate);
  const manifest: JsonApiManifest = {
    schemaVersion: 1,
    packageVersion: options.packageVersion ?? readPackageVersion(),
    commit: options.commit ?? resolveCommit(),
    aggregate: describeFile('address-book.json', aggregateContents),
    modules,
  };

  if (!COMMIT_PATTERN.test(manifest.commit)) {
    throw new Error(`Expected a full git commit SHA, received: ${manifest.commit}`);
  }

  rmSync(outputDirectory, {recursive: true, force: true});
  mkdirSync(join(outputDirectory, 'modules'), {recursive: true});
  writeFileSync(join(outputDirectory, 'address-book.json'), aggregateContents, 'utf8');

  for (const [name, contents] of moduleContents) {
    writeFileSync(join(outputDirectory, 'modules', `${name}.json`), contents, 'utf8');
  }

  writeFileSync(join(outputDirectory, 'manifest.json'), stableStringify(manifest), 'utf8');

  return manifest;
}

if (require.main === module) {
  const manifest = generateJsonApi();
  const totalBytes =
    manifest.aggregate.bytes + manifest.modules.reduce((total, entry) => total + entry.bytes, 0);
  console.log(`Generated ${manifest.modules.length} address-book modules (${totalBytes} bytes)`);
}
