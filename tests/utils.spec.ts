import {describe, expect, it} from 'vitest';
import {POOL} from '../src/ts/AaveV3Ethereum';
import {getAddressBookReferences} from '../src/ts/utils';

describe('getAddressBookReferences', () => {
  it('should return correct response', () => {
    expect(getAddressBookReferences(POOL, 1)).toEqual(['AaveV3Ethereum.POOL']);
  });
});
