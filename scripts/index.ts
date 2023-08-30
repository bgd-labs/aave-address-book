import {appendFileSync, existsSync, mkdirSync, rmdirSync} from 'fs';
import {governanceConfigMainnet} from './configs/governance/mainnet';
import {governanceConfigSepolia} from './configs/governance/sepolia';
import {arbitrumGoerliProtoV3, arbitrumProtoV3} from './configs/pools/arbitrum';
import {
  avalancheProtoV2,
  avalancheProtoV3,
  fujiProtoV2,
  fujiProtoV3,
} from './configs/pools/avalanche';
import {baseProtoV3} from './configs/pools/base';
import {
  mainnetProtoV3Pool,
  mainnetAmmV2Pool,
  mainnetArcV2Pool,
  mainnetProtoV2Pool,
  goerliProtoV2Pool,
  sepoliaProtoV3,
  goerliGHOV3Pool,
} from './configs/pools/ethereum';
import {fantomProtoV3, fantomTestnetProtoV3} from './configs/pools/fantom';
import {harmonyProtoV3} from './configs/pools/harmony';
import {metisProtoV3} from './configs/pools/metis';
import {optimismGoerliProtoV3, optimismProtoV3} from './configs/pools/optimism';
import {
  mumbaiProtoV2,
  mumbaiProtoV3,
  polygonProtoV2,
  polygonProtoV3,
} from './configs/pools/polygon';
import {scrollAlphaProtoV3, scrollSepoliaProtoV3} from './configs/pools/scroll';
import {generateGovernanceLibrary} from './generator/governanceV3Generator';
import {generateProtocolV2Library} from './generator/protocolV2Generator';
import {generateProtocolV3Library} from './generator/protocolV3Generator';

async function main() {
  // cleanup ts artifacts
  if (existsSync('./src/ts')) {
    rmdirSync('./src/ts', {recursive: true});
  }
  mkdirSync('./src/ts');

  // generate files
  const governanceNames = await Promise.all(
    [governanceConfigSepolia, governanceConfigMainnet].map((config) =>
      generateGovernanceLibrary(config),
    ),
  );
  const v2LibraryNames = await Promise.all(
    [
      mainnetAmmV2Pool,
      mainnetArcV2Pool,
      mainnetProtoV2Pool,
      polygonProtoV2,
      mumbaiProtoV2,
      goerliProtoV2Pool,
      fujiProtoV2,
      avalancheProtoV2,
    ].map((config) => generateProtocolV2Library(config)),
  );
  const v3LibraryNames = await Promise.all(
    [
      mainnetProtoV3Pool,
      sepoliaProtoV3,
      goerliGHOV3Pool,
      polygonProtoV3,
      mumbaiProtoV3,
      avalancheProtoV3,
      fujiProtoV3,
      baseProtoV3,
      metisProtoV3,
      arbitrumGoerliProtoV3,
      arbitrumProtoV3,
      optimismGoerliProtoV3,
      optimismProtoV3,
      scrollAlphaProtoV3,
      scrollSepoliaProtoV3,
      fantomTestnetProtoV3,
      fantomProtoV3,
      harmonyProtoV3,
    ].map((config) => generateProtocolV3Library(config)),
  );

  const jsExports = [governanceNames, v2LibraryNames, v3LibraryNames]
    .flat()
    .map((f) => f.js)
    .flat();
  const solidityImports = [governanceNames, v2LibraryNames, v3LibraryNames]
    .flat()
    .map((f) => f.solidity)
    .flat();

  jsExports.map((jsExport) => appendFileSync('./src/ts/AaveAddressBook.ts', `${jsExport}\n`));
  // solidityImports.map((solExport) => appendFileSync('./src/AaveAddressBook.sol', solExport));
}

main();
