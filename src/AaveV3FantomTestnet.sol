// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3FantomTestnet {
  // https://testnet.ftmscan.com/address/0x1558c6FadDe1bEaf0f6628BDd1DFf3461185eA24
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x1558c6FadDe1bEaf0f6628BDd1DFf3461185eA24);

  // https://testnet.ftmscan.com/address/0x56Ab717d882F7A8d4a3C2b191707322c5Cc70db8
  IPool internal constant POOL = IPool(0x56Ab717d882F7A8d4a3C2b191707322c5Cc70db8);

  // https://testnet.ftmscan.com/address/0x257a6f06192D532e40F66b3DDfE2cBBaf8373822
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x257a6f06192D532e40F66b3DDfE2cBBaf8373822);

  // https://testnet.ftmscan.com/address/0x18a8d31dA46eeb9138a16dfC429E74C04ff523F4
  IAaveOracle internal constant ORACLE = IAaveOracle(0x18a8d31dA46eeb9138a16dfC429E74C04ff523F4);

  // https://testnet.ftmscan.com/address/0x0000000000000000000000000000000000000000
  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;

  // https://testnet.ftmscan.com/address/0x3c9F4EEa18B02ee331218646Fea59EE3661d2A61
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x3c9F4EEa18B02ee331218646Fea59EE3661d2A61);

  // https://testnet.ftmscan.com/address/0xD5D4f4fe4BfC8e8193f38927EfafDbfbB66dd7e0
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xD5D4f4fe4BfC8e8193f38927EfafDbfbB66dd7e0);

  // https://testnet.ftmscan.com/address/0x9973Ce75946D56fA3B0C6aa3647d67D440BDAec8
  address internal constant ACL_ADMIN = 0x9973Ce75946D56fA3B0C6aa3647d67D440BDAec8;

  // https://testnet.ftmscan.com/address/0x445e52B0C18704448f4589C4304f63Ea287c2eb0
  ICollector internal constant COLLECTOR = ICollector(0x445e52B0C18704448f4589C4304f63Ea287c2eb0);

  // https://testnet.ftmscan.com/address/0x9F749B597414eD4F53a0F23971327bb60f16ad94
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x9F749B597414eD4F53a0F23971327bb60f16ad94;

  // https://testnet.ftmscan.com/address/0x6056C29483433A095eF98Fb0d01F2827F5FCeB99
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x6056C29483433A095eF98Fb0d01F2827F5FCeB99;

  // https://testnet.ftmscan.com/address/0x67F50B454972F7557c359AfE2DD3caef9930d665
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x67F50B454972F7557c359AfE2DD3caef9930d665;

  // https://testnet.ftmscan.com/address/0x979667835fE95F39609220C7582C7f21DaF1ce11
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x979667835fE95F39609220C7582C7f21DaF1ce11;

  // https://testnet.ftmscan.com/address/0xBAdD48c3EB42A10dB791D7b02E3c07Fbf95B3155
  address internal constant EMISSION_MANAGER = 0xBAdD48c3EB42A10dB791D7b02E3c07Fbf95B3155;

  // https://testnet.ftmscan.com/address/0x021BE22Bdfa497D6643D4035E530095E7b452967
  address internal constant FAUCET = 0x021BE22Bdfa497D6643D4035E530095E7b452967;

  // https://testnet.ftmscan.com/address/0xf24dc19cFb9A25bbc4DDcaAdb116DfD17472207B
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xf24dc19cFb9A25bbc4DDcaAdb116DfD17472207B;

  // https://testnet.ftmscan.com/address/0xC91dB4F736b6Acf5A2e379a58280D1b06BD24E7d
  address internal constant UI_POOL_DATA_PROVIDER = 0xC91dB4F736b6Acf5A2e379a58280D1b06BD24E7d;

  // https://testnet.ftmscan.com/address/0x49cC86071dEcC7999BA656763b8389f23058bB34
  address internal constant WALLET_BALANCE_PROVIDER = 0x49cC86071dEcC7999BA656763b8389f23058bB34;

  // https://testnet.ftmscan.com/address/0xd2B0C9778d088Fc79C28Da719bC02158E64796bD
  address internal constant WETH_GATEWAY = 0xd2B0C9778d088Fc79C28Da719bC02158E64796bD;
}

library AaveV3FantomTestnetAssets {
  address internal constant DAI_UNDERLYING = 0x77FDe93fEe5fe272dC17d799cb61447431E6Eba2;
  address internal constant DAI_A_TOKEN = 0x2B101eFBB4dFf1fbB8f87f02C560Fb8AC773aFC5;
  address internal constant DAI_V_TOKEN = 0x7a277581a2b1F0B52ce98A1A9b3ADb2DAbE99639;
  address internal constant DAI_S_TOKEN = 0xDbFbB8697438646fa75071C71d9B3dD1abaaB19f;
  address internal constant DAI_ORACLE = 0x00DF377c2C82a65A8bAe2Ff04a9434a721Bc5aEB;
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xEF97dc4389e8198068939ac2E92ca24371b67F1F;

  address internal constant LINK_UNDERLYING = 0x1Da81b322451C51D2580B373974a999d5A9C2D21;
  address internal constant LINK_A_TOKEN = 0x7d18f0834A38cA6B0e58CC671900f0017E6d55Ff;
  address internal constant LINK_V_TOKEN = 0x37a36207141fec36F383b9012FFACA924e4c7809;
  address internal constant LINK_S_TOKEN = 0xF21aC6F04D88Cb4EC2a33Aa3A3a909FF64d4dDe1;
  address internal constant LINK_ORACLE = 0x55c7852e10fcd07cF63Ad1bb9FC191b6F4d96ebD;
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x9060C6E714BA5C3A46665599103989778a736D4B;

  address internal constant USDC_UNDERLYING = 0x66F61903D7FEC18048bEc2e792f272cb8B657733;
  address internal constant USDC_A_TOKEN = 0xFFF336d1310D5Ba18CfFb2006afa762EC7d7a4fb;
  address internal constant USDC_V_TOKEN = 0x7723CeBe9a4D7416a7023d30bBefe73b755CE0bf;
  address internal constant USDC_S_TOKEN = 0xb9fdF942fd49A3876b4c5aAd3b65B48C8c7Bec2C;
  address internal constant USDC_ORACLE = 0x4CeDCB57Af02293231BAA9D39354D6BFDFD251e0;
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x3877E12506b087e56CdB7C9a54A04bE0D322B26C;

  address internal constant WBTC_UNDERLYING = 0x2c95d10bA4BBEc79e562e8B3f48687751808C925;
  address internal constant WBTC_A_TOKEN = 0x17A6c7f20e804a558E0674c0Eef1F69442770596;
  address internal constant WBTC_V_TOKEN = 0x798FD7a01C614F23a9fF27427e94175c3A8eBa5B;
  address internal constant WBTC_S_TOKEN = 0xCE3F0aA0b7cd4d7202a6c14e835EdF58F73e0F41;
  address internal constant WBTC_ORACLE = 0x8022B4f0165644D9EFcDEF70b09F5739b95740bc;
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x9060C6E714BA5C3A46665599103989778a736D4B;

  address internal constant WETH_UNDERLYING = 0xc8c0Cf9436F4862a8F60Ce680Ca5a9f0f99b5ded;
  address internal constant WETH_A_TOKEN = 0x0e426e6e6B226D8bd566e417b90411Dcf14DF861;
  address internal constant WETH_V_TOKEN = 0x5d18c525aD0C583aeEa44535cce7fd234D10Ef65;
  address internal constant WETH_S_TOKEN = 0xFb58c0193E4BEBAd5385776e7e4c53bA80caEAda;
  address internal constant WETH_ORACLE = 0x9e2DDb6aA91399546Bd875E2e63E8d6df276922e;
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x9060C6E714BA5C3A46665599103989778a736D4B;

  address internal constant USDT_UNDERLYING = 0x9DFf9E93B1e513379cf820504D642c6891d8F7CC;
  address internal constant USDT_A_TOKEN = 0x97293798206Fc4FDF23D6b536ED3D694599e35BC;
  address internal constant USDT_V_TOKEN = 0x8aE1A997A45C7A7b8c00889C8d0eAabBa899CA90;
  address internal constant USDT_S_TOKEN = 0x3C2550b9D48B1c1814AeF3E58E76c6fD343d9775;
  address internal constant USDT_ORACLE = 0x7CBa02e449d1D41b792A28fC15ee3F72C5aDC113;
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x3877E12506b087e56CdB7C9a54A04bE0D322B26C;

  address internal constant AAVE_UNDERLYING = 0x52D800ca262522580CeBAD275395ca6e7598C014;
  address internal constant AAVE_A_TOKEN = 0xf10e04c48f14d50F7378e01a1EEf7498D9a27d08;
  address internal constant AAVE_V_TOKEN = 0xD54a60da0deA4054169faeD0217F8Be0198A789E;
  address internal constant AAVE_S_TOKEN = 0xc83e9eF21C7736dfA4049835e05dbCC6a9b1C42b;
  address internal constant AAVE_ORACLE = 0xB516d30421d2A0524769A243BBE5e193E78ab35c;
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x9060C6E714BA5C3A46665599103989778a736D4B;

  address internal constant WFTM_UNDERLYING = 0x2Fa2e7a6dEB7bb51B625336DBe1dA23511914a8A;
  address internal constant WFTM_A_TOKEN = 0xFA3AdA68fA9512B2e22a5fac6b6F0231068A2b36;
  address internal constant WFTM_V_TOKEN = 0x5a76c9C809e7032F857dC24430e724831b202e29;
  address internal constant WFTM_S_TOKEN = 0x519Cc175fe84B19A67D136216408774FA6145AEE;
  address internal constant WFTM_ORACLE = 0x76675dEA78639e06a0f6b377262A03dEA916D6a4;
  address internal constant WFTM_INTEREST_RATE_STRATEGY =
    0x9060C6E714BA5C3A46665599103989778a736D4B;

  address internal constant CRV_UNDERLYING = 0xc199807AF4fEDB02EE567Ed0FeB814A077de4802;
  address internal constant CRV_A_TOKEN = 0x01CEf190E98cE7B8CA722e33C0D3aF456106103d;
  address internal constant CRV_V_TOKEN = 0x40489046ABe77aa660C6270A4abD0018821eE2e6;
  address internal constant CRV_S_TOKEN = 0x8DC8F6Db4805109590A07e6F1488D5fD20A2980c;
  address internal constant CRV_ORACLE = 0xd409F17095a370800A9C352124C6a1e82695203E;
  address internal constant CRV_INTEREST_RATE_STRATEGY = 0x9060C6E714BA5C3A46665599103989778a736D4B;

  address internal constant SUSHI_UNDERLYING = 0x1fdE0eCc619726f4cD597887C9F3b4c8740e19e2;
  address internal constant SUSHI_A_TOKEN = 0xac8fd53423708ac1C49E5486485854FBE1487e65;
  address internal constant SUSHI_V_TOKEN = 0xd863A878743D56B1208DC3bf3F280c0d16eC28D4;
  address internal constant SUSHI_S_TOKEN = 0x2D95dC1559576dF4A4d22e6befB6f23b151Df04c;
  address internal constant SUSHI_ORACLE = 0xcDA8dE50b65cB2Affc8B89f35C40A97Eed4B270F;
  address internal constant SUSHI_INTEREST_RATE_STRATEGY =
    0x9060C6E714BA5C3A46665599103989778a736D4B;
}
