import {defineConfig} from 'vitest/config';
import {resolve} from 'path';

export default defineConfig({
  resolve: {
    alias: [
      {find: /^src\/(.*)$/, replacement: resolve(__dirname, 'src/$1')},
      {find: /^scripts\/(.*)$/, replacement: resolve(__dirname, 'scripts/$1')},
      {find: /^tests\/(.*)$/, replacement: resolve(__dirname, 'tests/$1')},
      {find: /^ui\/(.*)$/, replacement: resolve(__dirname, 'ui/$1')},
    ],
  },
  test: {
    setupFiles: ['./tests/setup.ts'],
    testTimeout: 10000,
  },
});
