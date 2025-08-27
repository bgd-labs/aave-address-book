import { describe, expect, it } from 'vitest';
import { POOL } from '../src/ts/AaveV3Ethereum';
import { filterAddresses, findAddress, getAddressBookReferences } from '../src/ts/utils';
import { AaveV3Ethereum } from '../src/ts/AaveAddressBook';

describe('getAddressBookReferences', () => {
  it('should return correct response', () => {
    expect(getAddressBookReferences(POOL, 1)).toEqual(['AaveV3Ethereum.POOL']);
  });
});

describe("findAddress", () => {
  it("finds a pool for a pool-configurator", () => {
    const result = findAddress({
      CHAIN_ID: 1,
      POOL_CONFIGURATOR: AaveV3Ethereum.POOL_CONFIGURATOR,
    });

    expect(result.POOL).toBe(AaveV3Ethereum.POOL);
  });

  it("throws if no entry is found", () => {
    expect(() =>
      findAddress({
        CHAIN_ID: 1,
        POOL_CONFIGURATOR: "0x0000000000000000000000000000000000000000",
      }),
    ).toThrow();
  });

  it("throws if multiple entries are found", () => {
    expect(() =>
      findAddress({
        CHAIN_ID: 1,
      }),
    ).toThrow();
  });
});

describe("filterAddress", () => {
  it("finds all entries for chain id", () => {
    const results = filterAddresses({
      CHAIN_ID: 1,
    });

    expect(results.length).toMatchInlineSnapshot(`14`);
  });
})