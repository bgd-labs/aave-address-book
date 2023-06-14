import type {Options} from 'tsup';

const config: Options = {
  entry: ['src/ts/AaveAddressBook.ts'],
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
