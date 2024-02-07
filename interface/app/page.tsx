import Image from "next/image";
import * as _addresses from "../../src/ts/AaveAddressBook";
import { CHAIN_ID_CLIENT_MAP } from "@bgd-labs/js-utils";
import { AwesomeSearch } from "@/components/AwesomeSearch";
import Link from "next/link";

export type Address = { path: string; value: string; link: string };

// TODO: flatten nested as well
const addresses = Object.entries(_addresses).reduce((acc, [root, nested]) => {
  if (/ABI/.test(root)) return acc;
  Object.keys(nested).map((key) => {
    if (typeof nested[key as keyof typeof nested] === "string") {
      const value = nested[key as keyof typeof nested];
      if (!nested.CHAIN_ID) console.log(root);
      acc.push({
        path: `${root} ${key}`,
        value: value,
        link: `${CHAIN_ID_CLIENT_MAP[nested.CHAIN_ID]?.chain?.blockExplorers
          ?.default.url}/address/${value}`,
      });
    }
  });
  return acc;
}, [] as Address[]);

export default function Home() {
  return (
    <main className="relative flex min-h-screen flex-col items-center justify-center">
      <h1 className="pt-4 pb-8 bg-gradient-to-br from-black via-[#171717] to-[#4b4b4b] bg-clip-text text-center text-4xl font-medium tracking-tight text-transparent md:text-7xl">
        Aave address book
      </h1>
      <AwesomeSearch addresses={addresses} />
      <div className="flex justify-center space-x-5 pt-10 mt-10 border-t border-gray-300 w-full max-w-xl text-gray-600">
        <Link
          href="https://bgdlabs.com/"
          className="font-medium underline underline-offset-4 hover:text-black transition-colors"
        >
          BGD labs
        </Link>
      </div>

      <div className="sm:absolute sm:bottom-0 w-full px-20 py-10 flex justify-between">
        <Link
          href="https://github.com/bgd-labs/aave-address-book"
          className="flex items-center space-x-2"
        >
          <Image
            src="/github.svg"
            alt="GitHub Logo"
            width={24}
            height={24}
            priority
          />
          <p className="font-light">Source</p>
        </Link>
      </div>
    </main>
  );
}
