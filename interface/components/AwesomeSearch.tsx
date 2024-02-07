"use client";
import { Address } from "@/app/page";
import Fuse from "fuse.js";
import { useRef, useState } from "react";

const fuseOptions = {
  // isCaseSensitive: false,
  // includeScore: false,
  // shouldSort: true,
  // includeMatches: false,
  // findAllMatches: true,
  // minMatchCharLength: 1,
  // location: 0,
  threshold: 0.4,
  // distance: 100,
  // useExtendedSearch: false,
  // ignoreLocation: false,
  // ignoreFieldNorm: false,
  // fieldNormWeight: 1,
  keys: [{ name: "path", weight: 2 }, "value"],
};

export function AwesomeSearch({ addresses }: { addresses: Address[] }) {
  const fuse = useRef(new Fuse(addresses, fuseOptions));
  const [needle, setNeedle] = useState<string>("");

  const matches = fuse.current.search(needle);

  return (
    <ul className="divide-y divide-slate-100">
      <div className="bg-white/30 p-12 shadow-xl ring-1 ring-gray-900/5 rounded-lg backdrop-blur-lg max-w-xl mx-auto w-full">
        <div className="flex justify-between items-center mb-4">
          <div className="space-y-1">
            <input
              className="focus:ring-2 focus:ring-blue-500 focus:outline-none appearance-none w-full text-sm leading-6 text-slate-900 placeholder-slate-400 rounded-md py-2 pl-10 ring-1 ring-slate-200 shadow-sm"
              type="text"
              aria-label="Filter addresses"
              placeholder="Filter addresses..."
              value={needle}
              onChange={(e) => setNeedle(e.target.value)}
            />
          </div>
        </div>
        <div className="divide-y divide-gray-900/5">
          {matches.map((match) => (
            <div
              key={match.refIndex}
              className="flex items-center justify-between py-3"
            >
              <div className="flex items-center space-x-4">
                <div className="space-y-1">
                  <p className="font-medium leading-none">{match.item.path}</p>
                  <p className="text-sm text-gray-500">
                    <a href={addresses[match.refIndex].link} target="_blank">
                      {match.item.value}
                    </a>
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </ul>
  );
}
