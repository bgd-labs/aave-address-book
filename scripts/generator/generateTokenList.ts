import {schema, TokenInfo, TokenList} from '@uniswap/token-lists';
import Ajv from 'ajv';
import addFormats from 'ajv-formats';
import {ReserveData, UmbrellaStakeData} from '../configs/types';
import {readFileSync, existsSync, writeFileSync} from 'fs';
import {cwd} from 'process';
import {join} from 'path';
import prettier from 'prettier';
import {Address, getContract, Hex, zeroAddress} from 'viem';
import {IERC20Detailed_ABI} from '../../src/ts/abis/IERC20Detailed';
import {IStataTokenV2_ABI} from './../../src/ts/abis/IStataTokenV2';
import {fixSymbol} from './assetsLibraryGenerator';
import {getSymbolUri, getUmbrellaStkVariant, VARIANT} from './svgUtils';
import {getClient} from '../clients';
import {ChainList} from '@bgd-labs/toolbox';
import {getTokenSymbol} from './utils';

const TAGS = {
  underlying: 'underlying',
  aaveV2: 'aaveV2',
  aTokenV2: 'aTokenV2',
  aaveV3: 'aaveV3',
  aTokenV3: 'aTokenV3',
  staticAToken: 'staticAT',
  stataToken: 'stataToken',
  umbrellaStkToken: 'uStkToken',
} as const;

type ReserveTokenListParams = {
  name: string;
  pool: Hex;
  chainId: number;
  reservesData: ReserveData[];
};

type UmbrellaTokenListParams = {
  name: string;
  chainId: number;
  umbrella: Hex;
  umbrellaStakeData: UmbrellaStakeData[];
};

function findInList(tokens: TokenInfo[], address: Address, chainId: number) {
  return tokens.find((x) => x.address === address && x.chainId === chainId);
}

export async function generateTokenList(
  tokenSources: (ReserveTokenListParams | UmbrellaTokenListParams)[],
) {
  const path = join(cwd(), 'tokenlist.json');
  const cachedList: TokenList = existsSync(path)
    ? JSON.parse(readFileSync(path, 'utf-8'))
    : {tokens: []};

  const tokens: TokenInfo[] = [];

  for (const source of tokenSources) {
    const chainId = source.chainId;
    if (ChainList[chainId].testnet) continue;

    async function addToken(
      token: Address,
      variant: VARIANT,
      tags: string[],
      dataItem: ReserveData | UmbrellaStakeData,
      extensions?: Record<string, string>,
    ) {
      const alreadyInList = findInList(tokens, token, chainId);
      if (alreadyInList) return;
      const cache = findInList(cachedList.tokens, token, chainId);
      const client = getClient(chainId);

      const erc20contract = getContract({
        abi: IERC20Detailed_ABI,
        address: token,
        client,
      });
      const [name, symbol] = cache
        ? [cache.name, cache.symbol]
        : token == '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2'
          ? ['Maker', 'MKR']
          : await Promise.all([erc20contract.read.name(), erc20contract.read.symbol()]);

      let reserveSymbol = dataItem.symbol;
      if (variant == VARIANT.UMBRELLA_STAKE_TOKEN) {
        reserveSymbol = await getTokenSymbol(client, dataItem.UNDERLYING);
      } else if (variant == VARIANT.UMBRELLA_STAKE_STATA_TOKEN) {
        const umbrellaUnderlyingContract = getContract({
          abi: IStataTokenV2_ABI,
          address: dataItem.UNDERLYING,
          client,
        });
        reserveSymbol = await getTokenSymbol(client, await umbrellaUnderlyingContract.read.asset());
      }
      const symbolUri = await getSymbolUri(reserveSymbol, variant);

      return tokens.push({
        chainId: chainId,
        address: token,
        name,
        decimals: dataItem.decimals,
        symbol: symbol,
        tags,
        ...(symbolUri ? {logoURI: symbolUri} : {}),
        ...(extensions ? {extensions} : {}),
      });
    }

    if ('reservesData' in source && source.reservesData) {
      const {reservesData, name: poolName} = source;
      for (const reserve of reservesData) {
        await addToken(reserve.UNDERLYING, VARIANT.UNDERLYING, [TAGS.underlying], reserve);
        await addToken(
          reserve.A_TOKEN,
          VARIANT.A_TOKEN,
          /V2/.test(poolName) ? [TAGS.aTokenV2, TAGS.aaveV2] : [TAGS.aTokenV3, TAGS.aaveV3],
          reserve,
          {pool: source.pool, underlying: reserve.UNDERLYING},
        );
        if (reserve.STATIC_A_TOKEN && reserve.STATIC_A_TOKEN != zeroAddress)
          await addToken(
            reserve.STATIC_A_TOKEN,
            VARIANT.STATIC_A_TOKEN,
            [/V2/.test(poolName) ? TAGS.aaveV3 : TAGS.aaveV3, TAGS.staticAToken],
            reserve,
            {
              pool: source.pool,
              underlying: reserve.UNDERLYING,
              underlyingAToken: reserve.A_TOKEN,
            },
          );
        if (reserve.STATA_TOKEN && reserve.STATA_TOKEN != zeroAddress)
          await addToken(
            reserve.STATA_TOKEN,
            VARIANT.STATA_TOKEN,
            [/V2/.test(poolName) ? TAGS.aaveV3 : TAGS.aaveV3, TAGS.stataToken],
            reserve,
            {
              pool: source.pool,
              underlying: reserve.UNDERLYING,
              underlyingAToken: reserve.A_TOKEN,
            },
          );
      }
    }
    if ('umbrellaStakeData' in source && source.umbrellaStakeData) {
      const {umbrellaStakeData, umbrella} = source;
      for (const stakeData of umbrellaStakeData) {
        await addToken(
          stakeData.STAKE_TOKEN,
          getUmbrellaStkVariant(stakeData.symbol),
          [TAGS.umbrellaStkToken],
          stakeData,
          {underlying: stakeData.UNDERLYING, umbrella},
        );
      }
    }
  }

  const tokenList = {
    name: 'Aave token list',
    logoURI: 'https://raw.githubusercontent.com/bgd-labs/web3-icons/main/icons/full/aave.svg',
    keywords: ['audited', 'verified', 'aave'],

    tags: {
      [TAGS.underlying]: {
        name: 'underlyingAsset',
        description: 'Tokens that are used as underlying assets in the Aave protocol',
      },
      [TAGS.aaveV2]: {
        name: 'Aave V2',
        description: 'Tokens related to aave v2',
      },
      [TAGS.aaveV3]: {
        name: 'Aave V3',
        description: 'Tokens related to aave v3',
      },
      [TAGS.aTokenV2]: {
        name: 'aToken V2',
        description: 'Tokens that earn interest on the Aave Protocol V2',
      },
      [TAGS.aTokenV3]: {
        name: 'aToken V3',
        description: 'Tokens that earn interest on the Aave Protocol V3',
      },
      [TAGS.stataToken]: {
        name: 'stata token',
        description: 'Tokens that are wrapped into a 4626 Vault',
      },
      [TAGS.staticAToken]: {
        name: 'static a token',
        description: 'Tokens that are wrapped into a 4626 Vault',
      },
      [TAGS.umbrellaStkToken]: {
        name: 'umbrella stake token',
        description: 'New version of the Aave Safety Module stk tokens, used on Umbrella',
      },
    },
    tokens,
    version: cachedList.version,
    timestamp: cachedList.timestamp,
  };

  if (JSON.stringify(cachedList.tokens) !== JSON.stringify(tokens)) {
    tokenList.version = {
      major: 3,
      minor: 0,
      patch: cachedList.version?.patch != undefined ? cachedList.version.patch + 1 : 0,
    };
    tokenList.timestamp = new Date().toISOString();
  }

  const ajv = new Ajv({allErrors: true, verbose: true});
  addFormats(ajv);
  const validator = ajv.compile(schema);
  validator(tokenList);

  writeFileSync(
    path,
    await prettier.format(JSON.stringify(tokenList), {
      filepath: path,
    }),
  );

  if (validator.errors) {
    for (const error of validator.errors) {
      if (error.keyword !== 'maxLength') {
        console.log(validator.errors);
        throw new Error('error creating tokenlist');
      }
    }
  }
  return {
    js: [],
  };
}
