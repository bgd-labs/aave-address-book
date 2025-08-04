import {describe, expect, it} from 'vitest';
import {POOL} from '../src/ts/AaveV3Ethereum';
import {isKnownAddress} from '../src/ts/utils';

describe.only('isKnownAddress', () => {
  it('should return correct response', () => {
    expect(isKnownAddress(POOL, 1)).toEqual(['AaveV3Ethereum.POOL']);
  });
});
