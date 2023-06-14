import type {Options} from 'tsup';

const config: Options = {
  bundle: false,
  splitting: false,
  entry: ['src/ts/AaveAddressBook.ts', 'src/ts/*.ts'],
  sourcemap: true,
  format: ['iife', 'cjs', 'esm'],
  dts: {
    compilerOptions: {
      moduleResolution: 'node',
      allowSyntheticDefaultImports: true,
    },
  },
};

export default config;
