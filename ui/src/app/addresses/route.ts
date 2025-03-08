import { flattenedAddresses } from '@/utils/getAddresses';
import { ChainList } from '@bgd-labs/rpc-env';
import { NextResponse } from 'next/server';

const TAG_MAP: Record<string, string[]> = {
  S_TOKEN: ['stable', 'debt'],
  V_TOKEN: ['variable', 'debt'],
  STATA_TOKEN: ['stata', 'static'],
};

export async function GET() {
  const addresses = flattenedAddresses.map((item) => ({
    ...item,
    link: `${ChainList[item.chainId as keyof typeof ChainList]?.blockExplorers?.default.url.replace(/\/$/, '')}/address/${item.value}`,
    searchPath: [
      ...item.path,
      item.value,
      ...(TAG_MAP[item.path[item.path.length - 1]] ?? []),
    ].join(' '),
  }));

  return NextResponse.json(addresses);
}