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

function createComparator(searchQuery: string, marketNames: Set<string>) {
  return function comp(a: SearchItem, b: SearchItem) {
    const queryLower = searchQuery.toLowerCase();
    const aPathLower = a.searchPath.toLowerCase();
    const bPathLower = b.searchPath.toLowerCase();

    const aExactStart = aPathLower.startsWith(queryLower);
    const bExactStart = bPathLower.startsWith(queryLower);

    if (aExactStart && !bExactStart) return -1;
    if (!aExactStart && bExactStart) return 1;

    const aVersionPriority = getVersionPriority(a.searchPath);
    const bVersionPriority = getVersionPriority(b.searchPath);

    if (aVersionPriority !== bVersionPriority) {
      return aVersionPriority - bVersionPriority;
    }

    const isMarketQuery = marketNames.has(queryLower);

    if (!isMarketQuery) {
      const aIsEthereum = a.chainId === 1;
      const bIsEthereum = b.chainId === 1;

      if (aIsEthereum && !bIsEthereum) return -1;
      if (!aIsEthereum && bIsEthereum) return 1;
    }

    const aInProduction =
      !ChainList[a.chainId as keyof typeof ChainList]?.testnet;
    const bInProduction =
      !ChainList[b.chainId as keyof typeof ChainList]?.testnet;

    if (aInProduction && !bInProduction) return -1;
    if (!aInProduction && bInProduction) return 1;

    if (a.path.length !== b.path.length) {
      return a.path.length - b.path.length;
    }

    return a.searchPath.localeCompare(b.searchPath);
  };
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

  const { uf, cleanedSearchPaths } = useMemo(() => {
    const opts = {
      intraMode: 1,
      intraChars: "[a-z\\d'_]",
    };
    const cleaned = searchPaths.map((path) => path.replace(/_/g, ''));
    return {
      uf: new uFuzzy(opts),
      cleanedSearchPaths: cleaned,
    };
  }, [searchPaths]);

  const performSearch = useCallback(
    (search: string) => {
      if (!search.trim()) {
        setResults([]);
        return;
      }

      let [matches, _, order] = uf.search(cleanedSearchPaths, search, 10);
      let results: SearchItem[] = [];

      if (matches) {
        if (order) {
          results = order
            .slice(0, SEARCH_LIMIT)
            .map((r) => addresses[matches[r]]);
        } else {
          results = matches.map((r) => addresses[r]);
        }
      }

      const extractChainName = (searchPath: string): string | null => {
        const match = searchPath.match(/^AaveV[1-4]([A-Za-z]+)/);
        return match ? match[1].toLowerCase() : null;
      };

      const allChainNames = new Set(
        addresses
          .map((addr) => extractChainName(addr.searchPath))
          .filter((name): name is string => name !== null),
      );

      const sortedResults = results
        .sort(createComparator(search, allChainNames))
        .slice(0, SEARCH_LIMIT);

      setResults(sortedResults);
    },
    [cleanedSearchPaths, addresses, uf],
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
