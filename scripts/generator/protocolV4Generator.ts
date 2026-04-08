import {appendFileSync, writeFileSync} from 'fs';
import {Hex} from 'viem';
import {Addresses, V4Config} from '../configs/types';
import {
  generateJsConstants,
  generateJsObject,
  generateSolidityConstants,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {getClient} from '../clients';
import {fetchHubAssets, FetchedHubAsset} from './protocol-v4-generator/fetchHubAssets';
import {fetchTokenizationSpokes} from './protocol-v4-generator/fetchTokenizationSpokes';
import {fetchPriceFeeds, FetchedPriceFeed} from './protocol-v4-generator/fetchPriceFeeds';

const V4_INTERFACE_REGISTRY: Record<string, string> = {
  ACCESS_MANAGER: 'IAccessManagerEnumerable',
  HUB_CONFIGURATOR: 'IHubConfigurator',
  SPOKE_CONFIGURATOR: 'ISpokeConfigurator',
  TREASURY_SPOKE: 'ITreasurySpoke',
  CONFIG_ENGINE: 'IAaveV4ConfigEngine',
  GIVER_POSITION_MANAGER: 'IGiverPositionManager',
  TAKER_POSITION_MANAGER: 'ITakerPositionManager',
  CONFIG_POSITION_MANAGER: 'IConfigPositionManager',
  NATIVE_TOKEN_GATEWAY: 'INativeTokenGateway',
  SIGNATURE_GATEWAY: 'ISignatureGateway',
};

interface ResolvedHub {
  hub: Hex;
  assets: (FetchedHubAsset & {tokenizationSpoke: Hex})[];
}

function buildMainLibraryAddresses(config: V4Config): Addresses {
  const addresses: Addresses = {};
  for (const [key, value] of Object.entries(config.admin)) {
    const interfaceType = V4_INTERFACE_REGISTRY[key];
    addresses[key] = interfaceType ? {value, type: interfaceType} : value;
  }
  return addresses;
}

function buildHubsAddresses(
  resolvedHubs: Record<string, ResolvedHub>,
): Addresses {
  const addresses: Addresses = {};
  for (const [hubName, hubData] of Object.entries(resolvedHubs)) {
    addresses[`${hubName}_HUB`] = {value: hubData.hub, type: 'IHub'};
  }
  return addresses;
}

function buildSpokesAddresses(
  config: V4Config,
  oraclesBySpoke: Map<string, Hex>,
): Addresses {
  const addresses: Addresses = {};

  // Treasury spoke
  const treasurySpoke = config.admin.TREASURY_SPOKE;
  if (treasurySpoke) {
    addresses['TREASURY_SPOKE'] = {value: treasurySpoke, type: 'ITreasurySpoke'};
  }

  // Lending spokes + oracles
  for (const [spokeName, spokeAddress] of Object.entries(config.spokes)) {
    addresses[`${spokeName}_SPOKE`] = {value: spokeAddress, type: 'ISpoke'};
    const oracle = oraclesBySpoke.get(spokeName);
    if (oracle) {
      addresses[`${spokeName}_SPOKE_ORACLE`] = {
        value: oracle,
        type: 'IAaveOracle',
      };
    }
  }

  return addresses;
}

function buildSpokePriceFeedsAddresses(
  config: V4Config,
  priceFeedData: FetchedPriceFeed[],
): Addresses {
  const addresses: Addresses = {};

  for (const [spokeName] of Object.entries(config.spokes)) {
    const spokePriceFeeds = priceFeedData.filter((pf) => pf.spokeName === spokeName);
    const symbolCount = new Map<string, number>();
    for (const pf of spokePriceFeeds) {
      symbolCount.set(pf.symbol, (symbolCount.get(pf.symbol) || 0) + 1);
    }
    for (const pf of spokePriceFeeds) {
      const needsDisambiguation = symbolCount.get(pf.symbol)! > 1;
      const key = needsDisambiguation
        ? `${pf.spokeName}_${pf.hubName}_${pf.symbol}_PRICE_FEED`
        : `${pf.spokeName}_${pf.symbol}_PRICE_FEED`;
      addresses[key] = pf.priceFeed;
    }
  }

  return addresses;
}

function buildTokenizationSpokesAddresses(resolvedHubs: Record<string, ResolvedHub>): Addresses {
  const addresses: Addresses = {};
  for (const [hubName, hubData] of Object.entries(resolvedHubs)) {
    for (const asset of hubData.assets) {
      addresses[`${hubName}_${asset.symbol}_TOKENIZATION_SPOKE`] = {
        value: asset.tokenizationSpoke,
        type: 'ITokenizationSpoke',
      };
    }
  }
  return addresses;
}

function buildPositionManagersAddresses(config: V4Config): Addresses {
  const addresses: Addresses = {};
  for (const [key, value] of Object.entries(config.positionManagers ?? {})) {
    const interfaceType = V4_INTERFACE_REGISTRY[key];
    addresses[key] = interfaceType ? {value, type: interfaceType} : value;
  }
  return addresses;
}

function buildExternalLibrariesAddresses(config: V4Config): Addresses {
  const addresses: Addresses = {};
  for (const [key, value] of Object.entries(config.externalLibraries)) {
    addresses[key] = value;
  }
  return addresses;
}

function buildAssetsAddresses(resolvedHubs: Record<string, ResolvedHub>): {
  solAddresses: Addresses[];
  jsObject: Record<string, Record<string, any>>;
} {
  const seen = new Set<string>();
  const solAddresses: Addresses[] = [];
  const jsObject: Record<string, Record<string, any>> = {};

  for (const hubData of Object.values(resolvedHubs)) {
    for (const asset of hubData.assets) {
      if (seen.has(asset.symbol)) continue;
      seen.add(asset.symbol);

      const addresses: Addresses = {};
      addresses[`${asset.symbol}_UNDERLYING`] = asset.underlying;
      addresses[`${asset.symbol}_DECIMALS`] = {value: asset.decimals, type: 'uint8'};
      solAddresses.push(addresses);

      jsObject[asset.symbol] = {
        UNDERLYING: asset.underlying,
        decimals: asset.decimals,
      };
    }
  }

  return {solAddresses, jsObject};
}

export async function generateProtocolV4Library(config: V4Config) {
  const client = getClient(config.chainId);
  if (!client) {
    throw new Error(`client for chain not found for chainId: ${config.chainId}`);
  }

  // Build set of known non-tokenization spokes for filtering
  const knownNonTokenizationSpokes = new Set<string>(
    Object.values(config.spokes).map((s) => s.toLowerCase()),
  );
  const treasurySpoke = config.admin.TREASURY_SPOKE;
  if (treasurySpoke) {
    knownNonTokenizationSpokes.add(treasurySpoke.toLowerCase());
  }

  // Fetch assets + tokenization spokes for each hub
  const resolvedHubs: Record<string, ResolvedHub> = {};
  for (const [hubName, hubAddress] of Object.entries(config.hubs)) {
    const assets = await fetchHubAssets(client, hubAddress);
    const tokSpokes = await fetchTokenizationSpokes(
      client,
      hubAddress,
      hubName,
      assets,
      knownNonTokenizationSpokes,
    );
    resolvedHubs[hubName] = {
      hub: hubAddress,
      assets: assets.map((a) => ({...a, tokenizationSpoke: tokSpokes.get(a.assetId)!})),
    };
  }

  // Build lookup maps for price feed resolution
  const hubNameByAddress = new Map(
    Object.entries(config.hubs).map(([name, hubAddr]) => [hubAddr.toLowerCase(), name]),
  );
  const symbolByHubAsset = new Map<string, string>();
  for (const [, hubData] of Object.entries(resolvedHubs)) {
    for (const asset of hubData.assets) {
      symbolByHubAsset.set(`${hubData.hub.toLowerCase()}-${asset.assetId}`, asset.symbol);
    }
  }

  // Fetch price feeds from spoke oracles
  const {priceFeeds: priceFeedData, oraclesBySpoke} = await fetchPriceFeeds(
    client,
    config.spokes,
    hubNameByAddress,
    symbolByHubAsset,
  );

  const name = `AaveV4${config.name}`;
  const chainId = config.chainId;

  const imports = `import {IHub, IHubConfigurator, ISpoke, ISpokeConfigurator, ITokenizationSpoke, ITreasurySpoke, IAaveOracle, IConfigPositionManager, IGiverPositionManager, ITakerPositionManager, INativeTokenGateway, ISignatureGateway, IAaveV4ConfigEngine, IAccessManagerEnumerable} from './AaveV4.sol';\n`;

  // Main library (core addresses)
  const mainAddresses = buildMainLibraryAddresses(config);
  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        imports +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({chainId, addresses: mainAddresses}),
            name,
          ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId,
        addresses: {
          ...mainAddresses,
          CHAIN_ID: {value: chainId, type: 'uint256'},
        },
      }).join('\n'),
    ),
  );

  // Hubs library (hub addresses)
  const hubsAddresses = buildHubsAddresses(resolvedHubs);
  if (Object.keys(hubsAddresses).length > 0) {
    const hubsLibraryName = `${name}Hubs`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        generateSolidityConstants({chainId, addresses: hubsAddresses}),
        hubsLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const HUBS = ${generateJsObject(hubsAddresses)} as const;\n`,
    );
  }

  // Spokes library (treasury spoke + lending spokes + oracles)
  const spokesAddresses = buildSpokesAddresses(config, oraclesBySpoke);
  if (Object.keys(spokesAddresses).length > 0) {
    const spokesLibraryName = `${name}Spokes`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        generateSolidityConstants({chainId, addresses: spokesAddresses}),
        spokesLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const SPOKES = ${generateJsObject(spokesAddresses)} as const;\n`,
    );
  }

  // Spoke Price Feeds library
  const spokePriceFeedsAddresses = buildSpokePriceFeedsAddresses(config, priceFeedData);
  if (Object.keys(spokePriceFeedsAddresses).length > 0) {
    const spokePriceFeedsLibraryName = `${name}SpokePriceFeeds`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        generateSolidityConstants({chainId, addresses: spokePriceFeedsAddresses}),
        spokePriceFeedsLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const SPOKE_PRICE_FEEDS = ${generateJsObject(spokePriceFeedsAddresses)} as const;\n`,
    );
  }

  // Tokenization Spokes library
  const tokenSpokesAddresses = buildTokenizationSpokesAddresses(resolvedHubs);
  if (Object.keys(tokenSpokesAddresses).length > 0) {
    const tokenSpokesLibraryName = `${name}TokenizationSpokes`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        generateSolidityConstants({chainId, addresses: tokenSpokesAddresses}),
        tokenSpokesLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const TOKENIZATION_SPOKES = ${generateJsObject(tokenSpokesAddresses)} as const;\n`,
    );
  }

  // Position Managers library
  const pmAddresses = buildPositionManagersAddresses(config);
  if (Object.keys(pmAddresses).length > 0) {
    const pmLibraryName = `${name}PositionManagers`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        generateSolidityConstants({chainId, addresses: pmAddresses}),
        pmLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const POSITION_MANAGERS = ${generateJsObject(pmAddresses)} as const;\n`,
    );
  }

  // External Libraries library
  const extLibAddresses = buildExternalLibrariesAddresses(config);
  if (Object.keys(extLibAddresses).length > 0) {
    const extLibraryName = `${name}ExternalLibraries`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        generateSolidityConstants({chainId, addresses: extLibAddresses}),
        extLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const EXTERNAL_LIBRARIES = ${generateJsObject(extLibAddresses)} as const;\n`,
    );
  }

  // Consolidated assets library (deduplicated across all hubs)
  const {solAddresses: assetsSolAddresses, jsObject: assetsJsObject} =
    buildAssetsAddresses(resolvedHubs);
  if (assetsSolAddresses.length > 0) {
    const assetsLibraryName = `${name}Assets`;
    appendFileSync(
      `./src/${name}.sol`,
      wrapIntoSolidityLibrary(
        assetsSolAddresses
          .map((addresses) => generateSolidityConstants({chainId, addresses}))
          .flat(),
        assetsLibraryName,
      ),
    );
    appendFileSync(
      `./src/ts/${name}.ts`,
      `\nexport const ASSETS = ${JSON.stringify(assetsJsObject, null, 2)} as const;\n`,
    );
  }

  return {
    name,
    chainId,
    js: [`export * as ${name} from './${name}';`],
  };
}
