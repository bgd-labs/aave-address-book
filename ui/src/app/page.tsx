import { Suspense } from 'react';
import * as addressBook from '../../../src/ts/AaveAddressBook';
import { CHAIN_ID_CLIENT_MAP } from '@bgd-labs/js-utils';
import Image from 'next/image';
import { Search } from '@/components/Search';
import { SearchSkeleton } from '@/components/SearchSkeleton';
import { Footer } from '@/components/Footer';
import { type SearchItem } from '@/types';
import logo from '@/assets/logo.svg';
import { Address, isAddress } from 'viem';

const PRODUCTION_CHAIN_IDS = [
  1, 8453, 42161, 43114, 250, 1666600000, 10, 137, 1088, 100, 56, 534352,
];
const VERSION_PRIORITY: { [key: string]: number } = {
  AaveV3: 1,
  AaveV2: 2,
  AaveV1: 3,
};

function getVersionPriority(name: string): number {
  for (const version in VERSION_PRIORITY) {
    if (name.startsWith(version)) {
      return VERSION_PRIORITY[version];
    }
  }
  return 4;
}

const TAG_MAP: Record<string, string[]> = {
  S_TOKEN: ['stable', 'debt'],
  V_TOKEN: ['variable', 'debt'],
};

function flattenObject(
  obj: any,
  path: string[] = [],
  chainId: number | null = null,
): SearchItem[] {
  const result: SearchItem[] = [];
  const entries = Object.entries(obj).sort(([keyA], [keyB]) => {
    if (keyA === 'CHAIN_ID') return -1;
    if (keyB === 'CHAIN_ID') return 1;
    return 0;
  });

  for (let [key, value] of entries) {
    if (key === 'tokenlist') continue;

    const newPath = [...path, key];
    if (key === 'CHAIN_ID') {
      chainId = value as number;
    }
    if (typeof value === 'object' && value !== null) {
      result.push(...flattenObject(value, newPath, chainId));
    } else if (isAddress(value as string)) {
      const link = `${CHAIN_ID_CLIENT_MAP[chainId!]?.chain?.blockExplorers?.default.url}/address/${value}`;
      const key = newPath[newPath.length - 1];
      const searchPath = [...newPath, value];
      if (TAG_MAP[key]) searchPath.push(...TAG_MAP[key]);
      result.push({
        path: newPath,
        value: value as Address,
        chainId,
        link,
        searchPath: searchPath.join(' '),
      });
    }
  }
  return result;
}

const addresses = flattenObject(addressBook);
const sortedAddresses = addresses.sort((a, b) => {
  const aInProduction = PRODUCTION_CHAIN_IDS.includes(a.chainId ?? 0);
  const bInProduction = PRODUCTION_CHAIN_IDS.includes(b.chainId ?? 0);

  if (aInProduction && !bInProduction) {
    return -1;
  } else if (!aInProduction && bInProduction) {
    return 1;
  }

  const aVersionPriority = getVersionPriority(a.searchPath);
  const bVersionPriority = getVersionPriority(b.searchPath);

  if (aVersionPriority !== bVersionPriority) {
    return aVersionPriority - bVersionPriority;
  }

  const pathLengthDiff = a.path.length - b.path.length;
  if (pathLengthDiff !== 0) {
    return pathLengthDiff;
  }

  // A dirty hack to sligthly prioritize mainnet addresses
  const aSearchPathLength = a.chainId === 1 ? a.searchPath.length - 6 : a.searchPath.length;
  const bSearchPathLength = b.chainId === 1 ? b.searchPath.length - 6 : b.searchPath.length;

  const searchPathLengthDiff = aSearchPathLength - bSearchPathLength;
  if (searchPathLengthDiff !== 0) {
    return searchPathLengthDiff;
  }

  return 0;
});
const searchPaths = sortedAddresses.map((a) => a.searchPath);

export default function Home() {
  return (
    <>
      <main className="flex min-h-screen flex-col items-center justify-start pl-4 pr-2 pb-8 pt-16 sm:pt-36">
        <Image
          src={logo}
          alt="Aave Search"
          className="mb-7 w-36 sm:w-44"
          priority
        />
        <Suspense fallback={<SearchSkeleton />}>
          <Search addresses={addresses} searchPaths={searchPaths} />
        </Suspense>
        <Footer />
      </main>
    </>
  );
}
