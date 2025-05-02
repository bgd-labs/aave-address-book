import * as fs from 'fs';
import {
  generateJsConstants,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {ChainId, chainlinkFeeds} from '@bgd-labs/toolbox';
import {zeroAddress} from 'viem';

const CHAIN_ID_TO_NAME = {
  [ChainId.mainnet]: 'Mainnet',
  [ChainId.polygon]: 'Polygon',
  [ChainId.avalanche]: 'Avalanche',
  [ChainId.arbitrum]: 'Arbitrum',
  [ChainId.optimism]: 'Optimism',
  [ChainId.gnosis]: 'Gnosis',
  [ChainId.base]: 'Base',
  [ChainId.metis]: 'Metis',
  [ChainId.bnb]: 'BNB',
  [ChainId.celo]: 'Celo',
  [ChainId.linea]: 'Linea',
  [ChainId.scroll]: 'Scroll',
  [ChainId.zksync]: 'ZkSync',
  [ChainId.sonic]: 'Sonic',
  [ChainId.mantle]: 'Mantle',
  [ChainId.soneium]: 'Soneium',
};

export function generateChainlink() {
  Object.keys(chainlinkFeeds).map((chainId) => {
    if (!CHAIN_ID_TO_NAME[chainId]) throw new Error(`Skipped chainId: ${chainId} on chainlink`);
    const name = `Chainlink${CHAIN_ID_TO_NAME[chainId]}`;
    const addresses = chainlinkFeeds[chainId as keyof typeof chainlinkFeeds].reduce((acc, feed) => {
      if (feed.proxyAddress) acc[feed.name] = feed.proxyAddress;
      return acc;
    }, {});
    console.log(addresses);

    let solidityLibrary = wrapIntoSolidityLibrary(
      generateSolidityConstants({
        chainId: Number(chainId),
        addresses,
      }),
      name,
    );

    fs.writeFileSync(
      `./src/${name}.sol`,
      prefixWithGeneratedWarning(prefixWithPragma(solidityLibrary)),
    );
  });
}
