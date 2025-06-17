import { Suspense } from 'react';
import { flattenedAddresses } from '../utils/getAddresses';
import Image from 'next/image';
import { Search } from '@/components/Search';
import { ChainList } from '@bgd-labs/toolbox';
import { SearchSkeleton } from '@/components/SearchSkeleton';
import { Footer } from '@/components/Footer';
import logo from '@/assets/logo.svg';
import { SafeDownload } from '@/components/SafeDownload';

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

const searchPaths = addresses.map((a) => a.searchPath);

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
