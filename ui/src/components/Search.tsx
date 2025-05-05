'use client';

import { useState, useEffect, useCallback, useMemo, useRef } from 'react';
import { usePathname, useSearchParams } from 'next/navigation';
import { cn } from '@/utils/cn';
import { type SearchItem } from '@/types';
import { Box } from './Box';
import { SearchResult } from './SearchResult';
import uFuzzy from '@leeoniya/ufuzzy';
import { ChainList } from '@bgd-labs/toolbox';

const SEARCH_LIMIT = 100;
const DEBOUNCE_TIME = 100;

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

function comp(a: SearchItem, b: SearchItem) {
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
  return 0;
}

const getResultText = (results: any[], limit: number) => {
  const resultCount = results.length;
  if (resultCount === 0) return '';
  const displayCount = resultCount < limit ? resultCount : `${limit}+`;
  return `${displayCount} result${resultCount === 1 ? '' : 's'}`;
};

export const Search = ({
  addresses,
  searchPaths,
}: {
  addresses: SearchItem[];
  searchPaths: string[];
}) => {
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const searchString = searchParams.get('q');

  const [search, setSearch] = useState(searchString || '');
  const [results, setResults] = useState<SearchItem[]>([]);
  const [activeIndex, setActiveIndex] = useState(-1);

  const refs = useRef<(HTMLAnchorElement | null)[]>([]);
  const inputRef = useRef<HTMLInputElement>(null);

  const timeoutId = useRef<ReturnType<typeof setInterval> | null>(null);

  const uf = useMemo(() => {
    const opts = {
      intraMode: 1,
      intraChars: "[a-z\\d'_]",
    };
    return new uFuzzy(opts);
  }, []);

  const performSearch = useCallback(
    (search: string) => {
      let [matches, idx, order] = uf.search(
        searchPaths.map((path) => path.replace(/_/g, '')),
        search,
        10,
      );
      console.log(idx);
      let results: SearchItem[] = [];
      if (order && matches) {
        results = order
          .slice(0, SEARCH_LIMIT)
          .map((r) => addresses[matches[r]]);
      }

      setResults(results.sort(comp));
    },
    [searchPaths, addresses, uf],
  );

  const handleKeyDown = (event: React.KeyboardEvent) => {
    if (event.key === 'ArrowDown' || (event.key === 'Tab' && !event.shiftKey)) {
      event.preventDefault();
      setActiveIndex((prevActiveIndex) =>
        prevActiveIndex === -1 ? 0 : (prevActiveIndex + 1) % results.length,
      );
    } else if (
      event.key === 'ArrowUp' ||
      (event.key === 'Tab' && event.shiftKey)
    ) {
      event.preventDefault();
      setActiveIndex((prevActiveIndex) => {
        if (prevActiveIndex === 0) {
          inputRef.current?.focus();
          return -1;
        }
        return prevActiveIndex === -1
          ? 0
          : (prevActiveIndex - 1 + results.length) % results.length;
      });
    }
  };

  useEffect(() => {
    inputRef.current?.focus();
  }, []);

  useEffect(() => {
    refs.current = refs.current.slice(0, results.length);
    setActiveIndex(-1);
  }, [results]);

  useEffect(() => {
    if (refs.current[activeIndex]) {
      refs.current[activeIndex]?.focus();
    }
  }, [activeIndex]);

  useEffect(() => {
    if (timeoutId.current) {
      clearTimeout(timeoutId.current);
    }
    timeoutId.current = setTimeout(() => {
      if (search) {
        window.history.replaceState(null, '', `${pathname}?q=${search}`);
      } else {
        window.history.replaceState(null, '', pathname);
      }
      performSearch(search);
    }, DEBOUNCE_TIME);
    return () => {
      if (timeoutId.current !== null) {
        clearTimeout(timeoutId.current);
      }
    };
  }, [search, performSearch, pathname]);

  return (
    <div className="w-full max-w-2xl mb-10" onKeyDown={handleKeyDown}>
      <Box
        className={cn(
          'group border-brand-900 border p-1.5 focus-within:bg-brand-300 transition-colors',
          {
            ['border-b-0']: results.length > 0,
          },
        )}
      >
        <svg
          className="w-7 h-7 group-focus-within:text-brand-900 absolute top-1/2 left-3 -translate-y-1/2 text-brand-500 transition-all"
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
        <div className="hover:ring-1 focus-within:ring-1 ring-brand-900 transition-all">
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="rounded-none outline-none py-3 px-11 w-full text-xl border-r-2 border-t-2 border-transparent focus:border-brand-900 transition-all ring-inset placeholder:text-brand-500 "
            placeholder="Search..."
            ref={inputRef}
          />
        </div>
        <div className="absolute top-0 right-5 h-full flex items-center translate-y-[2px] justify-center text-brand-500 text-sm">
          {getResultText(results, SEARCH_LIMIT)}
        </div>
      </Box>
      {results.length !== 0 &&
        results.map((result, index) => (
          <SearchResult
            key={result.searchPath}
            result={result}
            ref={(el) => {
              (refs.current[index] = el) as any;
            }}
            tabIndex={index === activeIndex ? 0 : -1}
          />
        ))}
    </div>
  );
};
