'use client';

import { useState, forwardRef } from 'react';
import { FuseResult } from 'fuse.js';
import { Box } from '@/components/Box';
import { ChainIcon } from '@/components/ChainIcon';
import { cn } from '@/utils/cn';
import { type Address } from '@/types';

type SearchResultProps = {
  result: FuseResult<Address>;
  tabIndex: number;
};

export const SearchResult = forwardRef<HTMLAnchorElement, SearchResultProps>(
  ({ result, tabIndex }, ref) => {
    const [copied, setCopied] = useState(false);

    const handleCopyClick = async (event: React.MouseEvent) => {
      event.preventDefault();
      event.stopPropagation();
      await navigator.clipboard.writeText(result.item.value);
      setCopied(true);
      setTimeout(() => {
        setCopied(false);
      }, 1500);
    };

    return (
      <Box className="border-b-brand-900" isHoverable>
        <a
          className="px-3 pt-4 pb-4 flex gap-3 cursor-pointer outline-none"
          href={result.item.link}
          target="_blank"
          ref={ref}
          tabIndex={tabIndex}
        >
          <ChainIcon chainId={result.item.chainId} />
          <div className="leading-none">
            <div className="mb-2 flex flex-wrap gap-1">
              {result.item.path.map((p, i) => (
                <span
                  key={i}
                  className="text-brand-900 text-xs font-semibold leading-none rounded-sm bg-brand-100 border border-brand-300 py-1 px-1.5 truncate max-w-60 sm:max-w-full"
                >
                  {p}
                </span>
              ))}
            </div>
            <div className="font-mono text-xs text-brand-500 truncate px-0.5 w-60 sm:w-full">
              {result.item.value}
            </div>
          </div>
          <button
            className="ml-auto px-4 opacity-30 hover:opacity-100"
            onClick={handleCopyClick}
          >
            <span className="flex h-6 w-6 overflow-hidden">
              <svg
                className={cn(
                  'h-6 w-6 shrink-0 transition-all duration-150 ease-linear',
                  {
                    ['-translate-x-full text-green-500']: copied,
                  },
                )}
                viewBox="0 0 50 50"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M15 30.7361H11V11H31.5714V14.3833M39 18.8944V38.0667H19V18.8944H39Z"
                  stroke="currentColor"
                  strokeWidth="3"
                />
              </svg>
              <svg
                viewBox="0 0 50 50"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
                className={cn(
                  'h-6 w-6 shrink-0 translate-x-full transition-all duration-150 ease-linear',
                  {
                    ['-translate-x-full text-green-500']: copied,
                  },
                )}
              >
                <path
                  d="M14 24.8571L21.1719 33L41 12"
                  stroke="currentColor"
                  strokeWidth="4"
                />
              </svg>
            </span>
          </button>
        </a>
      </Box>
    );
  },
);

SearchResult.displayName = 'SearchResult';
