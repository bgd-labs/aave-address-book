import type {Options} from 'tsup';

const config: Options = {
  bundle: false,
  splitting: false,
  clean: true,
  entry: ['src/ts/*.ts'],
  sourcemap: true,
  format: ['iife', 'cjs', 'esm'],
  dts: true,
};

export default config;
