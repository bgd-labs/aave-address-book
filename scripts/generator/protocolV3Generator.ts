import {Hex, Client, getContract, zeroAddress} from 'viem';
import {AddressInfo, Addresses, PoolConfig, ReserveData} from '../configs/types';
import {REWARDS_CONTROLLER_ABI} from '../abi/rewardsController_v3_abi';
import {appendFileSync, writeFileSync} from 'fs';
import {
  addressOrZero,
  bytes32toAddress,
  generateJsConstants,
  generateJsObject,
  generateSolidityConstants,
  getImplementationStorageSlot,
  prefixWithGeneratedWarning,
  prefixWithPragma,
  wrapIntoSolidityLibrary,
} from './utils';
import {generateAssetsLibrary} from './assetsLibraryGenerator';
import {IPoolAddressesProvider_ABI} from '../../src/ts/abis/IPoolAddressesProvider';
import {IStaticATokenFactory_ABI} from '../../src/ts/abis/IStaticATokenFactory';
import {IStataTokenFactory_ABI} from '../../src/ts/abis/IStataTokenFactory';
import {IAaveOracle_ABI} from '../../src/ts/abis/IAaveOracle';
import {IERC20Detailed_ABI} from '../../src/ts/abis/IERC20Detailed';
import {IAToken_ABI} from '../../src/ts/abis/IAToken';
import {IPool_ABI} from '../../src/ts/abis/IPool';
import {CHAIN_ID_CLIENT_MAP} from '../clients';

export interface PoolV3Addresses {
  POOL_ADDRESSES_PROVIDER: AddressInfo;
  POOL: AddressInfo;
  POOL_IMPL: AddressInfo;
  AAVE_PROTOCOL_DATA_PROVIDER: AddressInfo;
  POOL_CONFIGURATOR: AddressInfo;
  POOL_CONFIGURATOR_IMPL: AddressInfo;
  ORACLE: AddressInfo;
  PRICE_ORACLE_SENTINEL: AddressInfo;
  ACL_ADMIN: AddressInfo;
  ACL_MANAGER: AddressInfo;
  COLLECTOR: AddressInfo;
  EMISSION_MANAGER: AddressInfo;
  DEFAULT_INCENTIVES_CONTROLLER: AddressInfo;
  [key: `DEFAULT_A_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  [key: `DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  [key: `DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  reservesData: ReserveData[];
  externalLibraries: null | Record<string, AddressInfo>;
}

async function getAdditionalTokenInfo(
  client: Client,
  pool: PoolConfig,
  reservesData: PoolV3Addresses['reservesData'],
): Promise<{
  COLLECTOR: AddressInfo;
  [key: `DEFAULT_A_TOKEN_IMPL_REV_${number}`]: AddressInfo;
  [key: `DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${number}`]: AddressInfo;
}> {
  if (reservesData.length > 0) {
    const aTokenContract = getContract({
      address: reservesData[0].A_TOKEN,
      abi: [
        {
          inputs: [],
          name: 'ATOKEN_REVISION',
          outputs: [{internalType: 'uint256', name: '', type: 'uint256'}],
          stateMutability: 'view',
          type: 'function',
        },
        ...IAToken_ABI,
      ] as const,
      client,
    });
    const variableDebtTokenContract = getContract({
      address: reservesData[0].V_TOKEN,
      abi: [
        {
          inputs: [],
          name: 'DEBT_TOKEN_REVISION',
          outputs: [{internalType: 'uint256', name: '', type: 'uint256'}],
          stateMutability: 'view',
          type: 'function',
        },
      ] as const,
      client,
    });

    const [COLLECTOR, aTokenImplSlot, aTokenImplRevision, vTokenImplSlot] = await Promise.all([
      aTokenContract.read.RESERVE_TREASURY_ADDRESS(),
      getImplementationStorageSlot(client, reservesData[0].A_TOKEN),
      aTokenContract.read.ATOKEN_REVISION(),
      getImplementationStorageSlot(client, reservesData[0].V_TOKEN),
    ]);
    const defaultATokenImplementation = bytes32toAddress(aTokenImplSlot);

    const aTokenRevision = Number(aTokenImplRevision);

    const defaultVariableDebtTokenImplementation = bytes32toAddress(vTokenImplSlot);

    const variableDebtTokenRevision = Number(
      await variableDebtTokenContract.read.DEBT_TOKEN_REVISION(),
    );

    return {
      COLLECTOR: {value: COLLECTOR, type: 'ICollector'},
      [`DEFAULT_A_TOKEN_IMPL_REV_${aTokenRevision}`]: defaultATokenImplementation,
      [`DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_${variableDebtTokenRevision}`]:
        defaultVariableDebtTokenImplementation,
    };
  }
  return {
    COLLECTOR: {value: addressOrZero(pool.initial?.COLLECTOR), type: 'ICollector'},
    DEFAULT_A_TOKEN_IMPL_REV_1: addressOrZero(pool.initial?.DEFAULT_A_TOKEN_IMPL),
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1: addressOrZero(
      pool.initial?.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL,
    ),
  };
}

export async function getPoolV3Addresses(
  pool: PoolConfig,
): Promise<PoolV3Addresses & {eModes: Map<number, string>}> {
  const client = CHAIN_ID_CLIENT_MAP[pool.chainId];
  const addressProviderContract = getContract({
    address: pool.POOL_ADDRESSES_PROVIDER,
    abi: IPoolAddressesProvider_ABI,
    client,
  });
  if (!client) {
    console.log(client, pool.chainId, pool.POOL_ADDRESSES_PROVIDER);
    throw new Error('client for chain not found');
  }
  try {
    const [
      POOL,
      POOL_CONFIGURATOR,
      ORACLE,
      PRICE_ORACLE_SENTINEL,
      ACL_ADMIN,
      ACL_MANAGER,
      AAVE_PROTOCOL_DATA_PROVIDER,
    ] = await Promise.all([
      addressProviderContract.read.getPool(),
      addressProviderContract.read.getPoolConfigurator(),
      addressProviderContract.read.getPriceOracle(),
      addressProviderContract.read.getPriceOracleSentinel(),
      addressProviderContract.read.getACLAdmin(),
      addressProviderContract.read.getACLManager(),
      addressProviderContract.read.getPoolDataProvider(),
    ]);

    const [POOL_IMPL, POOL_CONFIGURATOR_IMPL, DEFAULT_INCENTIVES_CONTROLLER] = await Promise.all([
      getImplementationStorageSlot(client, POOL),
      getImplementationStorageSlot(client, POOL_CONFIGURATOR),
      addressProviderContract.read.getAddress([
        '0x703c2c8634bed68d98c029c18f310e7f7ec0e5d6342c590190b3cb8b3ba54532',
      ]),
    ]);

    let EMISSION_MANAGER: Hex = zeroAddress;
    try {
      const incentivesControllerContract = getContract({
        address: DEFAULT_INCENTIVES_CONTROLLER,
        abi: REWARDS_CONTROLLER_ABI,
        client,
      });
      EMISSION_MANAGER = await incentivesControllerContract.read.getEmissionManager();
    } catch (e) {
      console.log(`old version of incentives controller deployed on ${pool.name}`);
    }

    const eModes = new Map<number, string>();
    const staticATokenFactoryContract = pool.additionalAddresses.STATIC_A_TOKEN_FACTORY
      ? getContract({
          address: pool.additionalAddresses.STATIC_A_TOKEN_FACTORY,
          abi: IStaticATokenFactory_ABI,
          client,
        })
      : null;
    const stataTokenFactoryContract = pool.additionalAddresses.STATA_FACTORY
      ? getContract({
          address: pool.additionalAddresses.STATA_FACTORY,
          abi: IStataTokenFactory_ABI,
          client,
        })
      : null;
    const poolContract = getContract({address: POOL, abi: IPool_ABI, client});
    const oracleContract = getContract({address: ORACLE, abi: IAaveOracle_ABI, client});

    let i = 1;
    let emptyCount = 0;
    while (true) {
      const eModeData = await poolContract.read.getEModeCategoryData([i]);
      if (eModeData.liquidationThreshold == 0) {
        emptyCount++;
      } else {
        eModes.set(i, eModeData.label);
      }
      if (emptyCount > 2) break;
      i++;
    }
    const reserves = await poolContract.read.getReservesList();
    const reservesData: PoolV3Addresses['reservesData'] = await Promise.all(
      reserves.map(async (reserve) => {
        const erc20Contract = getContract({address: reserve, abi: IERC20Detailed_ABI, client});
        const [data, symbol, decimals, oracle] = await Promise.all([
          poolContract.read.getReserveData([reserve]),
          reserve === '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2'
            ? 'MRK'
            : erc20Contract.read.symbol(),
          erc20Contract.read.decimals(),
          oracleContract.read.getSourceOfAsset([reserve]),
        ]);
        const result: ReserveData = {
          symbol: reserve === '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2' ? 'MRK' : symbol,
          decimals: decimals,
          UNDERLYING: reserve,
          A_TOKEN: data.aTokenAddress,
          V_TOKEN: data.variableDebtTokenAddress,
          INTEREST_RATE_STRATEGY: data.interestRateStrategyAddress,
          ORACLE: oracle,
        };
        if (staticATokenFactoryContract)
          result.STATIC_A_TOKEN = (await staticATokenFactoryContract.read.getStaticAToken([
            reserve,
          ])) as Hex;
        if (stataTokenFactoryContract)
          result.STATA_TOKEN = (await stataTokenFactoryContract.read.getStataToken([
            reserve,
          ])) as Hex;
        return result;
      }),
    );

    const {COLLECTOR, ...rest} = await getAdditionalTokenInfo(client, pool, reservesData);

    // fetching libraries on 3.1+
    let externalLibraries: null | Record<string, AddressInfo> = null;
    try {
      const [
        FLASHLOAN_LOGIC,
        BORROW_LOGIC,
        BRIDGE_LOGIC,
        E_MODE_LOGIC,
        LIQUIDATION_LOGIC,
        POOL_LOGIC,
        SUPPLY_LOGIC,
      ] = await Promise.all([
        poolContract.read.getFlashLoanLogic(),
        poolContract.read.getBorrowLogic(),
        poolContract.read.getBridgeLogic(),
        poolContract.read.getEModeLogic(),
        poolContract.read.getLiquidationLogic(),
        poolContract.read.getPoolLogic(),
        poolContract.read.getSupplyLogic(),
      ]);
      externalLibraries = {
        FLASHLOAN_LOGIC,
        BORROW_LOGIC,
        BRIDGE_LOGIC,
        E_MODE_LOGIC,
        LIQUIDATION_LOGIC,
        POOL_LOGIC,
        SUPPLY_LOGIC,
      };
    } catch (e) {
      // might fail on fantom/harmony and testnets
    }

    return {
      eModes,
      externalLibraries,
      POOL_ADDRESSES_PROVIDER: {
        value: pool.POOL_ADDRESSES_PROVIDER,
        type: 'IPoolAddressesProvider',
      },
      POOL: {value: POOL, type: 'IPool'},
      POOL_IMPL: bytes32toAddress(POOL_IMPL),
      POOL_CONFIGURATOR: {
        value: POOL_CONFIGURATOR,
        type: 'IPoolConfigurator',
      },
      POOL_CONFIGURATOR_IMPL: bytes32toAddress(POOL_CONFIGURATOR_IMPL),
      ORACLE: {
        value: ORACLE,
        type: 'IAaveOracle',
      },
      PRICE_ORACLE_SENTINEL,
      AAVE_PROTOCOL_DATA_PROVIDER: {value: AAVE_PROTOCOL_DATA_PROVIDER, type: 'IPoolDataProvider'},
      ACL_MANAGER: {value: ACL_MANAGER, type: 'IACLManager'},
      ACL_ADMIN,
      COLLECTOR,
      DEFAULT_INCENTIVES_CONTROLLER,
      ...rest,
      EMISSION_MANAGER,
      reservesData,
    };
  } catch (error: any) {
    throw new Error(JSON.stringify({message: error.message, pool, stack: error.stack}));
  }
}

function generateEmodes(chainId: number, eModes: Map<number, string>, libraryName: string) {
  const eModeZero = eModes.get(0);
  if (!eModeZero) eModes.set(0, 'NONE');
  const sorted = Array.from(eModes).sort(([keyA], [keyB]) => keyA - keyB);
  const formatted = sorted.reduce((acc, [value, label]) => {
    acc[label.toUpperCase().replace('-', '_').replace(' ', '_')] = {
      value,
      type: 'uint8',
    };
    return acc;
  }, {} as Addresses);
  return {
    solidity: wrapIntoSolidityLibrary(
      generateSolidityConstants({
        chainId,
        addresses: formatted,
      }),
      libraryName,
    ),
    js: `export const E_MODES = ${generateJsObject({addresses: formatted})} as const;\n`,
  };
}

function generateExternalLibraries(
  chainId: number,
  libraries: Record<string, AddressInfo>,
  libraryName: string,
) {
  return {
    solidity: wrapIntoSolidityLibrary(
      generateSolidityConstants({
        chainId,
        addresses: libraries,
      }),
      libraryName,
    ),
    js: `export const EXTERNAL_LIBRARIES = ${generateJsObject({addresses: libraries})} as const;\n`,
  };
}

export async function generateProtocolV3Library(config: PoolConfig) {
  const {reservesData, eModes, externalLibraries, ...addresses} = await getPoolV3Addresses(config);
  const name = `AaveV3${config.name}`;

  // generate main library
  writeFileSync(
    `./src/${name}.sol`,
    prefixWithGeneratedWarning(
      prefixWithPragma(
        `import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';\n` +
          `import {ICollector} from './common/ICollector.sol';` +
          wrapIntoSolidityLibrary(
            generateSolidityConstants({
              chainId: config.chainId,
              addresses: {...addresses, ...config.additionalAddresses},
            }),
            name,
          ),
      ),
    ),
  );
  writeFileSync(
    `./src/ts/${name}.ts`,
    prefixWithGeneratedWarning(
      generateJsConstants({
        chainId: config.chainId,
        addresses: {
          ...addresses,
          ...config.additionalAddresses,
          CHAIN_ID: {value: config.chainId, type: 'uint256'},
        },
      }).join('\n'),
    ),
  );

  // generate assets library
  const assetsLibraryName = name + 'Assets';
  const assetsLibrary = generateAssetsLibrary(config.chainId, reservesData, assetsLibraryName);
  appendFileSync(`./src/${name}.sol`, assetsLibrary.solidity);
  appendFileSync(`./src/ts/${name}.ts`, assetsLibrary.js);

  // generate emodes library
  const eModesLibraryName = name + 'EModes';
  const eModesLibrary = generateEmodes(config.chainId, eModes, eModesLibraryName);
  appendFileSync(`./src/${name}.sol`, eModesLibrary.solidity);
  appendFileSync(`./src/ts/${name}.ts`, eModesLibrary.js);

  // generate externalLibraries library
  if (externalLibraries) {
    const externalLibraryName = name + 'ExternalLibraries';
    const externalLibrary = generateExternalLibraries(
      config.chainId,
      externalLibraries,
      externalLibraryName,
    );
    appendFileSync(`./src/${name}.sol`, externalLibrary.solidity);
    appendFileSync(`./src/ts/${name}.ts`, externalLibrary.js);
  }

  return {
    pool: (addresses.POOL as any).value,
    name,
    reservesData,
    chainId: config.chainId,
    js: [`export * as ${name} from './${name}';`],
    solidity: [`import {${name}} from './${name}.sol';`],
  };
}
