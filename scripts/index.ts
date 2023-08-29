import {governanceConfigMainnet} from './configs/governance/mainnet';
import {governanceConfigSepolia} from './configs/governance/sepolia';
import {generateGovernanceLibrary} from './generator/governanceV3Generator';

async function main() {
  await Promise.all(
    [governanceConfigSepolia, governanceConfigMainnet].map((config) =>
      generateGovernanceLibrary(config),
    ),
  );
}

main();
