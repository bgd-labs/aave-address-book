import type {SizeLimitConfig} from 'size-limit';
import {readdirSync} from 'fs';

const files = readdirSync('dist');

module.exports = files
  .filter((file) => file.endsWith('.js'))
  .map((file) => ({path: `dist/${file}`})) satisfies SizeLimitConfig;
