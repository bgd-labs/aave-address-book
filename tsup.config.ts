import type {Options} from 'tsup';

const config: Options = {
  bundle: false,
  splitting: false,
  clean: true,
  entry: ['src/ts/*.ts'],
  sourcemap: true,
  format: ['cjs', 'esm'],
  dts: true,
};

export default config;
