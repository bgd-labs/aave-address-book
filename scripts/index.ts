import {governanceConfigMainnet} from './configs/governance/mainnet';
import {governanceConfigSepolia} from './configs/governance/sepolia';
import {mainnetProtoV3Pool} from './configs/pools/mainnet';
import {generateGovernanceLibrary} from './generator/governanceV3Generator';
import {generateProtocolV3Library} from './generator/protocolV3Generator';

async function main() {
  const governanceNames = await Promise.all(
    [governanceConfigSepolia, governanceConfigMainnet].map((config) =>
      generateGovernanceLibrary(config),
    ),
  );
  const v3LibraryNames = await Promise.all(
    [mainnetProtoV3Pool].map((config) => generateProtocolV3Library(config)),
  );
}

main();
