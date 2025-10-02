import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    setupFiles: ['./tests/setup.ts'], //this line,
    testTimeout: 100000,
  },
});
