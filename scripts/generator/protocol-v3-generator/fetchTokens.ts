import {Client, getContract} from 'viem';
import {IAaveOracle_ABI} from '../../../src/ts/abis/IAaveOracle';
import {IPool_ABI} from '../../../src/ts/abis/IPool';
import {IStaticATokenFactory_ABI} from '../../../src/ts/abis/IStaticATokenFactory';
import {IStataTokenFactory_ABI} from '../../../src/ts/abis/IStataTokenFactory';
import {PoolConfig, ReserveData} from '../../configs/types';
import {IERC20Detailed_ABI} from '../../../src/ts/abis/IERC20Detailed';
import {fetchPoolAddresses} from './fetchPoolAddresses';
import {bytes32toAddress, getImplementationStorageSlot, addressOrZero} from '../utils';
import {IAToken_ABI} from '../../../src/ts/abis/IAToken';

export async function fetchTokens(
  client: Client,
  poolConfig: PoolConfig,
  poolAddresses: Awaited<ReturnType<typeof fetchPoolAddresses>>,
) {
  const staticATokenFactoryContract = poolConfig.additionalAddresses.LEGACY_STATIC_A_TOKEN_FACTORY
    ? getContract({
        address: poolConfig.additionalAddresses.LEGACY_STATIC_A_TOKEN_FACTORY,
        abi: IStaticATokenFactory_ABI,
        client,
      })
    : null;
  const stataTokenFactoryContract = poolConfig.additionalAddresses.STATA_FACTORY
    ? getContract({
        address: poolConfig.additionalAddresses.STATA_FACTORY,
        abi: IStataTokenFactory_ABI,
        client,
      })
    : null;
  const poolContract = getContract({address: poolAddresses.POOL.value, abi: IPool_ABI, client});
  const oracleContract = getContract({
    address: poolAddresses.ORACLE.value,
    abi: IAaveOracle_ABI,
    client,
  });

  const reserves = await poolContract.read.getReservesList();
  const reservesData: ReserveData[] = await Promise.all(
    reserves.map(async (reserve) => {
      const erc20Contract = getContract({address: reserve, abi: IERC20Detailed_ABI, client});
      const [data, symbol, decimals, oracle] = await Promise.all([
        poolContract.read.getReserveData([reserve]),
        reserve === '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2'
          ? 'MKR'
          : erc20Contract.read.symbol(),
        erc20Contract.read.decimals(),
        oracleContract.read.getSourceOfAsset([reserve]),
      ]);
      const result: ReserveData = {
        symbol: reserve === '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2' ? 'MKR' : symbol,
        decimals: decimals,
        id: data.id,
        UNDERLYING: reserve,
        A_TOKEN: data.aTokenAddress,
        V_TOKEN: data.variableDebtTokenAddress,
        INTEREST_RATE_STRATEGY: data.interestRateStrategyAddress,
        ORACLE: oracle,
      };
      if (staticATokenFactoryContract)
        result.STATIC_A_TOKEN = await staticATokenFactoryContract.read.getStaticAToken([reserve]);
      if (stataTokenFactoryContract)
        result.STATA_TOKEN = await stataTokenFactoryContract.read.getStataToken([reserve]);
      return result;
    }),
  );
  return reservesData;
}

export async function inferAdditionalTokenInfo(
  client: Client,
  poolConfig: PoolConfig,
  reservesData: Awaited<ReturnType<typeof fetchTokens>>,
) {
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
    COLLECTOR: {value: addressOrZero(poolConfig.initial?.COLLECTOR), type: 'ICollector'},
    DEFAULT_A_TOKEN_IMPL_REV_1: addressOrZero(poolConfig.initial?.DEFAULT_A_TOKEN_IMPL),
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1: addressOrZero(
      poolConfig.initial?.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL,
    ),
  };
}
