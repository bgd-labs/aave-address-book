import { Suspense } from 'react';
import { flattenedAddresses } from '../utils/getAddresses';
import Image from 'next/image';
import { Search } from '@/components/Search';
import { ChainList } from '@bgd-labs/rpc-env';
import { SearchSkeleton } from '@/components/SearchSkeleton';
import { Footer } from '@/components/Footer';
import logo from '@/assets/logo.svg';
import { SafeDownload } from '@/components/SafeDownload';

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
  STATA_TOKEN: ['stata', 'static'],
};

const addresses = flattenedAddresses.map((item) => ({
  ...item,
  link: `${ChainList[item.chainId as keyof typeof ChainList]?.blockExplorers?.default.url.replace(/\/$/, '')}/address/${item.value}`,
  searchPath: [
    ...item.path,
    item.value,
    ...(TAG_MAP[item.path[item.path.length - 1]] ?? []),
  ].join(' '),
}));

const sortedAddresses = addresses.sort((a, b) => {
  const aInProduction = !ChainList[a.chainId as keyof typeof ChainList].testnet;
  const bInProduction = !ChainList[b.chainId as keyof typeof ChainList].testnet;

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

  // A dirty hack to slightly prioritize mainnet addresses
  const aSearchPathLength =
    a.chainId === 1 ? a.searchPath.length - 6 : a.searchPath.length;
  const bSearchPathLength =
    b.chainId === 1 ? b.searchPath.length - 6 : b.searchPath.length;

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
        <SafeDownload />
        <Footer />
      </main>
    </>
  );
}
