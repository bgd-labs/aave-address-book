import {Address, Client, getContract, zeroAddress} from 'viem';
import {fetchPoolAddresses} from './fetchPoolAddresses';
import {ILendingPool_ABI} from '../../../src/ts/abis/ILendingPool';
import {ReserveData} from '../../configs/types';
import {IERC20Detailed_ABI} from '../../../src/ts/abis/IERC20Detailed';
import {IAaveOracle_ABI} from '../../../src/ts/abis/IAaveOracle';
import {A_TOKEN_V2_ABI} from '../../abi/aToken_v2_abi';
import {INCENTIVES_CONTROLLER_ABI} from '../../abi/incentivesController_abi';

export async function fetchTokens(
  client: Client,
  poolAddresses: Awaited<ReturnType<typeof fetchPoolAddresses>>,
) {
  const poolContract = getContract({
    address: poolAddresses.POOL.value,
    abi: ILendingPool_ABI,
    client,
  });
  const reserves = await poolContract.read.getReservesList();
  const oracleContract = getContract({
    address: poolAddresses.ORACLE.value,
    abi: IAaveOracle_ABI,
    client,
  });
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
      return {
        symbol: reserve === '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2' ? 'MKR' : symbol,
        decimals: decimals,
        id: data.id,
        UNDERLYING: reserve,
        A_TOKEN: data.aTokenAddress,
        V_TOKEN: data.variableDebtTokenAddress,
        INTEREST_RATE_STRATEGY: data.interestRateStrategyAddress,
        ORACLE: oracle,
      };
    }),
  );
  return reservesData;
}

export async function inferAdditionalTokenInfo(
  client: Client,
  reservesData: Awaited<ReturnType<typeof fetchTokens>>,
) {
  if (reservesData.length > 0) {
    const aTokenContract = getContract({
      address: reservesData[0].A_TOKEN,
      abi: A_TOKEN_V2_ABI,
      client,
    });
    const DEFAULT_INCENTIVES_CONTROLLER = await aTokenContract.read.getIncentivesController();
    const COLLECTOR = await aTokenContract.read.RESERVE_TREASURY_ADDRESS();

    let EMISSION_MANAGER: Address = zeroAddress;
    try {
      const incentivesControllerContract = getContract({
        address: DEFAULT_INCENTIVES_CONTROLLER,
        abi: INCENTIVES_CONTROLLER_ABI,
        client,
      });
      EMISSION_MANAGER = await incentivesControllerContract.read.EMISSION_MANAGER();
    } catch (e) {
      console.log(`old version of incentives controller deployed`);
    }

    return {
      COLLECTOR: {value: COLLECTOR, type: 'ICollector'},
      DEFAULT_INCENTIVES_CONTROLLER,
      EMISSION_MANAGER,
    };
  }
}
