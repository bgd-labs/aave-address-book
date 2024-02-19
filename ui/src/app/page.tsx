import * as addressBook from '../../../src/ts/AaveAddressBook';
import { CHAIN_ID_CLIENT_MAP } from '@bgd-labs/js-utils';
import { Search } from '@/components/Search';
import { Footer } from '@/components/Footer';
import { type Address } from '@/types';

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
      <main className="flex min-h-screen flex-col items-center justify-start pl-4 pr-2 pb-8 pt-28 sm:pt-36">
        <h1 className="leading-4 text-center mb-6">
          <div className="text-5xl font-heading font-bold -translate-x-1">
            Aave
          </div>
        </h1>
        <Search addresses={addresses} />
        <a
          className="absolute top-0 right-0 z-50 text-brand-900 hover:text-brand-500 transition-colors duration-300 ease-in-out"
          href="https://github.com/bgd-labs/aave-address-book"
          title="View on GitHub"
        >
          <svg
            className="w-16 h-16 sm:w-20 sm:h-20 fixed top-0 right-0 border-0 fill-brand-100"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 250 250"
          >
            <path d="M0 0l115 115h15l12 27 108 108V0z" fill="currentColor" />
            <path d="M128 109c-15-9-9-19-9-19 3-7 2-11 2-11-1-7 3-2 3-2 4 5 2 11 2 11-3 10 5 15 9 16" />
            <path d="M115 115s4 2 5 0l14-14c3-2 6-3 8-3-8-11-15-24 2-41 5-5 10-7 16-7 1-2 3-7 12-11 0 0 5 3 7 16 4 2 8 5 12 9s7 8 9 12c14 3 17 7 17 7-4 8-9 11-11 11 0 6-2 11-7 16-16 16-30 10-41 2 0 3-1 7-5 11l-12 11c-1 1 1 5 1 5z" />
          </svg>
        </a>
        <Footer />
      </main>
    </>
  );
}
