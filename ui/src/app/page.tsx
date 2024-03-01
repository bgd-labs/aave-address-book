import { Suspense } from 'react';
import * as addressBook from '../../../src/ts/AaveAddressBook';
import { CHAIN_ID_CLIENT_MAP } from '@bgd-labs/js-utils';
import Image from 'next/image';
import { Search } from '@/components/Search';
import { SearchSkeleton } from '@/components/SearchSkeleton';
import { Footer } from '@/components/Footer';
import { type Address } from '@/types';
import logo from '@/assets/logo.svg';

function isEthereumAddress(value: any): value is string {
  return typeof value === 'string' && /^0x[a-fA-F0-9]{40}$/.test(value);
}

function flattenObject(
  obj: any,
  path: string[] = [],
  chainId: number | null = null,
): Address[] {
  const result: Address[] = [];
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
    } else if (isEthereumAddress(value)) {
      const link = `${CHAIN_ID_CLIENT_MAP[chainId!]?.chain?.blockExplorers?.default.url}/address/${value}`;

      result.push({
        path: newPath,
        value,
        chainId,
        link,
        searchPath: newPath.join(''),
      });
    }
  }
  return result;
}

const addresses = flattenObject(addressBook);

export default function Home() {
  return (
    <>
      <main className="flex min-h-screen flex-col items-center justify-start pl-4 pr-2 pb-8 pt-16 sm:pt-36">
        <Image src={logo} alt="Aave Search" className="mb-7 w-36 sm:w-44" />
        <Suspense fallback={<SearchSkeleton />}>
          <Search addresses={addresses} />
        </Suspense>
        <Footer />
      </main>
    </>
  );
}
