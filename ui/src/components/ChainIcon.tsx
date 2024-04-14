'use client';

import Image from 'next/image';
import ethereumIcon from '../../../assets/chains/ethereum.svg';
import polygonIcon from '../../../assets/chains/polygon.svg';
import binanceIcon from '../../../assets/chains/binance.svg';
import arbitrumIcon from '../../../assets/chains/arbitrum.svg';
import avalancheIcon from '../../../assets/chains/avalanche.svg';
import baseIcon from '../../../assets/chains/base.svg';
import gnosisIcon from '../../../assets/chains/gnosis.svg';
import metisIcon from '../../../assets/chains/metis.svg';
import optimismIcon from '../../../assets/chains/optimism.svg';
import unknownIcon from '../../../assets/chains/unknown.svg';
import polygonZkEvmIcon from '../../../assets/chains/polygonZkEvm.svg';
import scrollIcon from '../../../assets/chains/scroll.svg';
import ethereumTestnetIcon from '../../../assets/chains/ethereumTestnet.svg';
import fantomOperaIcon from '../../../assets/chains/fantomOpera.svg';
import harmonyOneIcon from '../../../assets/chains/harmonyOne.svg';

type Props = {
  chainId?: number | null;
};

const getIcon = (chainId: number) => {
  switch (chainId) {
    case 1:
      return ethereumIcon;
    case 10:
      return optimismIcon;
    case 1088:
      return metisIcon;
    case 1101:
      return polygonZkEvmIcon;
    case 56:
      return binanceIcon;
    case 8453:
      return baseIcon;
    case 137:
      return polygonIcon;
    case 100:
      return gnosisIcon;
    case 42161:
      return arbitrumIcon;
    case 43114:
      return avalancheIcon;
    case 534352:
      return scrollIcon;
    case 250:
      return fantomOperaIcon;
    case 5: 
      return ethereumTestnetIcon;
    case 4002:
      return ethereumTestnetIcon;
    case 11155111:
      return ethereumTestnetIcon;
    case 534351:
      return ethereumTestnetIcon;
    case 80001:
      return ethereumTestnetIcon;
    case 43113:
      return ethereumTestnetIcon;
    case 421613:
      return ethereumTestnetIcon;
    case 420:
      return ethereumTestnetIcon;
    case 421614:
      return ethereumTestnetIcon;
    case 1666600000:
      return harmonyOneIcon;
    default:
      return unknownIcon;
  }
};

export const ChainIcon = ({ chainId }: Props) => {
  if (!chainId) return null;

  return (
    <Image
      src={getIcon(chainId)}
      className="h-5 w-5 shrink-0"
      alt={`Icon for chain ${chainId}`}
      unoptimized
    />
  );
};
