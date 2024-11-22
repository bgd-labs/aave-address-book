import 'dotenv/config';
import {appendFileSync, existsSync, mkdirSync, readdirSync, rmSync, writeFileSync} from 'fs';
import {governanceConfigMainnet} from './configs/governance/ethereum';
import {arbitrumProtoV3, arbitrumSepoliaProtoV3} from './configs/pools/arbitrum';
import {
  avalancheProtoV2,
  avalancheProtoV3,
  fujiProtoV2,
  fujiProtoV3,
} from './configs/pools/avalanche';
import {baseProtoV3, baseSepoliaProtoV3, baseSepoliaLidoProtoV3} from './configs/pools/base';
import {
  mainnetProtoV3Pool,
  mainnetAmmV2Pool,
  mainnetArcV2Pool,
  mainnetProtoV2Pool,
  sepoliaProtoV3,
  lidoEthereumMainnetProtoV3Pool,
  etherFiEthereumMainnetProtoV3Pool,
} from './configs/pools/ethereum';
import {fantomProtoV3, fantomTestnetProtoV3} from './configs/pools/fantom';
import {harmonyProtoV3} from './configs/pools/harmony';
import {metisProtoV3} from './configs/pools/metis';
import {gnosisProtoV3} from './configs/pools/gnosis';
import {bnbProtoV3} from './configs/pools/bnb';
import {optimismProtoV3, optimismSepoliaProtoV3} from './configs/pools/optimism';
import {polygonProtoV2, polygonProtoV3} from './configs/pools/polygon';
import {scrollSepoliaProtoV3, scrollProtoV3} from './configs/pools/scroll';
import {zkSyncProtoV3} from './configs/pools/zksync';
import {generateGovernanceLibrary} from './generator/governanceV3Generator';
import {generateProtocolV2Library} from './generator/protocolV2Generator';
import {generateProtocolV3Library} from './generator/protocolV3Generator';
import {generateGovV2} from './generator/governanceV2Generator';
import {prefixWithGeneratedWarning, prefixWithPragma} from './generator/utils';
import {generateSafetyModule} from './generator/safetyModuleGenerator';
import {governanceConfigArbitrum} from './configs/governance/arbitrum';
import {governanceConfigAvalanche, governanceConfigFuji} from './configs/governance/avalanche';
import {governanceConfigOptimism} from './configs/governance/optimism';
import {governanceConfigPolygon} from './configs/governance/polygon';
import {generateABIImports} from './generator/abis';
import {governanceConfigMetis} from './configs/governance/metis';
import {governanceConfigBase} from './configs/governance/base';
import {governanceConfigBNB} from './configs/governance/bnb';
import {governanceConfigGnosis} from './configs/governance/gnosis';
import {baseAddresses, baseSepoliaAddresses} from './configs/networks/base';
import {generateNetworkAddresses} from './generator/networkGenerator';
import {arbitrumAddresses, arbitrumSepoliaAddresses} from './configs/networks/arbitrum';
import {avalancheAddresses, avalancheFujiAddresses} from './configs/networks/avalanche';
import {ethereumAddresses, sepoliaAddresses} from './configs/networks/ethereum';
import {polygonAddresses} from './configs/networks/polygon';
import {fantomAddresses} from './configs/networks/fantom';
import {optimismAddresses, optimismSepoliaAddresses} from './configs/networks/optimism';
import {metisAddresses} from './configs/networks/metis';
import {gnosisAddresses} from './configs/networks/gnosis';
import {bnbAddresses} from './configs/networks/bnb';
import {scrollAddresses} from './configs/networks/scroll';
import {polygonZkEvmAddresses} from './configs/networks/polygonZkEvm';
import {governanceConfigScroll} from './configs/governance/scroll';
import {governanceConfigPolygonZkEvm} from './configs/governance/polygonZkEvm';
import {generateTokenList} from './generator/generateTokenList';
import {generateAaveV1} from './generator/protocolV1Generator';
import {governanceConfigZkSync} from './configs/governance/zksync';
import {zkSyncAddresses} from './configs/networks/zksync';
import {ghoArbitrum} from './configs/gho/arbitrum';
import {ghoEthereum} from './configs/gho/ethereum';
import {generateGho} from './generator/ghoGenerator';

async function main() {
  // cleanup ts artifacts
  if (existsSync('./src/ts')) {
    const files = readdirSync('./src/ts');
    for (const file of files) {
      if (file !== 'abis' && file !== 'AaveV3Harmony.ts') rmSync(`./src/ts/${file}`);
    }
  } else {
    mkdirSync('./src/ts');
  }

  // generate files
  const governanceNames = await Promise.all(
    [
      // governanceConfigSepolia,
      governanceConfigMainnet,
      governanceConfigArbitrum,
      governanceConfigAvalanche,
      governanceConfigFuji,
      governanceConfigOptimism,
      governanceConfigPolygon,
      governanceConfigMetis,
      governanceConfigBase,
      governanceConfigBNB,
      governanceConfigGnosis,
      governanceConfigScroll,
      governanceConfigPolygonZkEvm,
      governanceConfigZkSync,
    ].map((config) => generateGovernanceLibrary(config)),
  );
  const v1Library = generateAaveV1();
  const v2LibraryNames = await Promise.all(
    [
      mainnetAmmV2Pool,
      mainnetArcV2Pool,
      mainnetProtoV2Pool,
      polygonProtoV2,
      fujiProtoV2,
      avalancheProtoV2,
    ].map((config) => generateProtocolV2Library(config)),
  );

  const v3LibraryNames = await Promise.all(
    [
      mainnetProtoV3Pool,
      sepoliaProtoV3,
      polygonProtoV3,
      avalancheProtoV3,
      fujiProtoV3,
      baseProtoV3,
      baseSepoliaProtoV3,
      baseSepoliaLidoProtoV3,
      metisProtoV3,
      gnosisProtoV3,
      bnbProtoV3,
      arbitrumProtoV3,
      arbitrumSepoliaProtoV3,
      optimismProtoV3,
      optimismSepoliaProtoV3,
      scrollProtoV3,
      scrollSepoliaProtoV3,
      zkSyncProtoV3,
      fantomTestnetProtoV3,
      fantomProtoV3,
      harmonyProtoV3,
      lidoEthereumMainnetProtoV3Pool,
      etherFiEthereumMainnetProtoV3Pool,
    ].map((config) => generateProtocolV3Library(config)),
  );
  const ghoAddresses = [ghoEthereum, ghoArbitrum].map((config) => generateGho(config));

  const tokenListImports = await generateTokenList([...v2LibraryNames, ...v3LibraryNames]);
  console.log('✅ Tokens list generation finished');

  const networkAddresses = [
    arbitrumAddresses,
    arbitrumSepoliaAddresses,
    avalancheAddresses,
    avalancheFujiAddresses,
    baseAddresses,
    baseSepoliaAddresses,
    ethereumAddresses,
    fantomAddresses,
    optimismAddresses,
    optimismSepoliaAddresses,
    polygonAddresses,
    metisAddresses,
    gnosisAddresses,
    bnbAddresses,
    scrollAddresses,
    polygonZkEvmAddresses,
    sepoliaAddresses,
    zkSyncAddresses,
  ].map((addresses) => generateNetworkAddresses(addresses));

  const govImports = generateGovV2();

  const smImports = generateSafetyModule();

  const abis = generateABIImports();

  writeFileSync('./src/ts/abis/index.ts', abis.join('\n'));

  const imports = [
    governanceNames,
    v1Library,
    v2LibraryNames,
    v3LibraryNames,
    networkAddresses,
    govImports,
    smImports,
    tokenListImports,
    ghoAddresses,
  ].flat();

  const jsExports = imports.map((f) => f.js).flat();
  writeFileSync(`./src/ts/AaveAddressBook.ts`, prefixWithGeneratedWarning(''));
  jsExports.map((jsExport) => appendFileSync('./src/ts/AaveAddressBook.ts', `${jsExport}\n`));
  console.log('✅ Generation finished');
}

main();
