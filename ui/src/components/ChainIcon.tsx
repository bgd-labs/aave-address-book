'use client';

import { Web3Icon } from '@bgd-labs/react-web3-icons';

type Props = {
  chainId?: number | null;
};

export const ChainIcon = ({ chainId }: Props) => {
  if (!chainId) return null;

  return (
    <Web3Icon
      chainId={chainId}
      className="h-5 w-5 shrink-0"
      loader={
        <div className="h-5 w-5 shrink-0 animate-pulse rounded-full bg-brand-300" />
      }
      alt={`Icon for chain ${chainId}`}
    />
  );
};
