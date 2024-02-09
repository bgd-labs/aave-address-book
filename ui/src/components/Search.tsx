'use client';
import { useState, useEffect, useCallback, useMemo, useRef } from 'react';
import { cn } from '@/utils/cn';
import { type Address } from '@/types';
import Fuse, { FuseResult } from 'fuse.js';
import { Box } from './Box';
import { ChainIcon } from '@/components/ChainIcon';

const fuseOptions = {
  isCaseSensitive: false,
  includeScore: false,
  shouldSort: true,
  includeMatches: false,
  findAllMatches: false,
  minMatchCharLength: 2,
  location: 0,
  threshold: 0.4,
  distance: 100,
  useExtendedSearch: false,
  ignoreLocation: false,
  ignoreFieldNorm: false,
  fieldNormWeight: 1,
  keys: [{ name: 'searchPath', weight: 3 }, 'value'],
};

const SEARCH_LIMIT = 32;
const DEBOUNCE_TIME = 150;

export const Search = ({ addresses }: { addresses: Address[] }) => {
  const [search, setSearch] = useState('');
  const [results, setResults] = useState<FuseResult<Address>[]>([]);
  const timeoutId = useRef<ReturnType<typeof setInterval> | null>(null);

  const fuseIndex = useMemo(
    () => Fuse.createIndex(fuseOptions.keys, addresses),
    [addresses],
  );

  const performSearch = useCallback(
    (search: string) => {
      const fuse = new Fuse(addresses, fuseOptions, fuseIndex);
      if (search) {
        const limitedSearch = search.slice(0, SEARCH_LIMIT);
        setResults(fuse.search(limitedSearch, { limit: 100 }));
      } else {
        setResults([]);
      }
    },
    [addresses, fuseIndex],
  );

  useEffect(() => {
    if (timeoutId.current) {
      clearTimeout(timeoutId.current);
    }
    timeoutId.current = setTimeout(() => {
      performSearch(search);
    }, DEBOUNCE_TIME);
    return () => {
      if (timeoutId.current !== null) {
        clearTimeout(timeoutId.current);
      }
    };
  }, [search, performSearch]);

  return (
    <div className="w-full max-w-2xl mb-10">
      <Box
        className={cn('group border-brand-900 border', {
          ['border-b-0']: results.length > 0,
        })}
      >
        <svg
          className="w-7 h-7 group-focus-within:text-blue-500 absolute top-1/2 left-3 -translate-y-1/2 text-brand-500 transition-all"
          fill="none"
          viewBox="0 0 24 24"
        >
          <path
            stroke="currentColor"
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="1.5"
            d="M19.25 19.25L15.5 15.5M4.75 11C4.75 7.54822 7.54822 4.75 11 4.75C14.4518 4.75 17.25 7.54822 17.25 11C17.25 14.4518 14.4518 17.25 11 17.25C7.54822 17.25 4.75 14.4518 4.75 11Z"
          ></path>
        </svg>
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="outline-none py-3 px-11 w-full text-xl border border-2 border-transparent focus:border-blue-200 transition-all"
        />
        <div className="text-brand-500 text-xs absolute top-1/2 right-3 -translate-y-1/2">
          {search !== '' && results.length}
        </div>
      </Box>
      {results.length !== 0 &&
        results.map((result) => (
          <Box key={result.item.searchPath} isHoverable>
            <a
              className="px-3 pt-4 pb-4 flex gap-3 cursor-pointer"
              href={result.item.link}
              target='_blank'
            >
              <ChainIcon chainId={result.item.chainId} />
              <div className="leading-none">
                <div className="mb-2 flex flex-wrap gap-1">
                  {result.item.path.map((p, i) => (
                    <span
                      key={i}
                      className="text-brand-900 text-xs font-semibold leading-none rounded-sm bg-brand-100 border border-brand-300 py-1 px-1.5"
                    >
                      {p}
                    </span>
                  ))}
                </div>
                <div className="font-mono text-xs text-brand-500 truncate px-0.5 w-60 sm:w-full">
                  {result.item.value}
                </div>
              </div>
            </a>
          </Box>
        ))}
    </div>
  );
};
