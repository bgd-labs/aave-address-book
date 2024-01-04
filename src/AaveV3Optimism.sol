// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3Optimism {
  // https://explorer.optimism.io/address/0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

  // https://explorer.optimism.io/address/0x794a61358D6845594F94dc1DB02A252b5b4814aD
  IPool internal constant POOL = IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

  // https://explorer.optimism.io/address/0x8145eddDf43f50276641b55bd3AD95944510021E
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

  // https://explorer.optimism.io/address/0xD81eb3728a631871a7eBBaD631b5f424909f0c77
  IAaveOracle internal constant ORACLE = IAaveOracle(0xD81eb3728a631871a7eBBaD631b5f424909f0c77);

  // https://explorer.optimism.io/address/0xE229d5DE4BD5beEAf12d427B5B57BFe66abD2c3b
  address internal constant PRICE_ORACLE_SENTINEL = 0xE229d5DE4BD5beEAf12d427B5B57BFe66abD2c3b;

  // https://explorer.optimism.io/address/0xd9Ca4878dd38B021583c1B669905592EAe76E044
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xd9Ca4878dd38B021583c1B669905592EAe76E044);

  // https://explorer.optimism.io/address/0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

  // https://explorer.optimism.io/address/0x746c675dAB49Bcd5BB9Dc85161f2d7Eb435009bf
  address internal constant ACL_ADMIN = 0x746c675dAB49Bcd5BB9Dc85161f2d7Eb435009bf;

  // https://explorer.optimism.io/address/0xB2289E329D2F85F1eD31Adbb30eA345278F21bcf
  ICollector internal constant COLLECTOR = ICollector(0xB2289E329D2F85F1eD31Adbb30eA345278F21bcf);

  // https://explorer.optimism.io/address/0x929EC64c34a17401F460460D4B9390518E5B473e
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x929EC64c34a17401F460460D4B9390518E5B473e;

  // https://explorer.optimism.io/address/0xbCb167bDCF14a8F791d6f4A6EDd964aed2F8813B
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_2 = 0xbCb167bDCF14a8F791d6f4A6EDd964aed2F8813B;

  // https://explorer.optimism.io/address/0x04a8D477eE202aDCE1682F5902e1160455205b12
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_2 =
    0x04a8D477eE202aDCE1682F5902e1160455205b12;

  // https://explorer.optimism.io/address/0x69713dA5fDfacf77E80C31F9B928Ec0Fc3716384
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_3 =
    0x69713dA5fDfacf77E80C31F9B928Ec0Fc3716384;

  // https://explorer.optimism.io/address/0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73
  address internal constant EMISSION_MANAGER = 0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;

  // https://explorer.optimism.io/address/0x5E76E98E0963EcDC6A065d1435F84065b7523f39
  address internal constant CAPS_PLUS_RISK_STEWARD = 0x5E76E98E0963EcDC6A065d1435F84065b7523f39;

  // https://explorer.optimism.io/address/0x3829943c53F2d00e20B58475aF19716724bF90Ba
  address internal constant FREEZING_STEWARD = 0x3829943c53F2d00e20B58475aF19716724bF90Ba;

  // https://explorer.optimism.io/address/0xcFaE0D8c5707FCc6478D6a65fFA31efADeF8b8EC
  address internal constant DEBT_SWAP_ADAPTER = 0xcFaE0D8c5707FCc6478D6a65fFA31efADeF8b8EC;

  // https://explorer.optimism.io/address/0x9abADECD08572e0eA5aF4d47A9C7984a5AA503dC
  address internal constant L2_ENCODER = 0x9abADECD08572e0eA5aF4d47A9C7984a5AA503dC;

  // https://explorer.optimism.io/address/0x893411580e590D62dDBca8a703d61Cc4A8c7b2b9
  address internal constant CONFIG_ENGINE = 0x893411580e590D62dDBca8a703d61Cc4A8c7b2b9;

  // https://explorer.optimism.io/address/0x770ef9f4fe897e59daCc474EF11238303F9552b6
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x770ef9f4fe897e59daCc474EF11238303F9552b6;

  // https://explorer.optimism.io/address/0xDd81E6F85358292075B78fc8D5830BE8434aF8BA
  address internal constant RATES_FACTORY = 0xDd81E6F85358292075B78fc8D5830BE8434aF8BA;

  // https://explorer.optimism.io/address/0xa12734e64417f61f8442E7D5132EdBFdbDDeF0fa
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0xa12734e64417f61f8442E7D5132EdBFdbDDeF0fa;

  // https://explorer.optimism.io/address/0x22D76094730fA377184100EFB8CEfC673B89B372
  address internal constant STATIC_A_TOKEN_FACTORY = 0x22D76094730fA377184100EFB8CEfC673B89B372;

  // https://explorer.optimism.io/address/0x830C5A67a0C95D69dA5fb7801Ac1773c6fB53857
  address internal constant SWAP_COLLATERAL_ADAPTER = 0x830C5A67a0C95D69dA5fb7801Ac1773c6fB53857;

  // https://explorer.optimism.io/address/0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x6F143FE2F7B02424ad3CaD1593D6f36c0Aab69d7;

  // https://explorer.optimism.io/address/0xbd83DdBE37fc91923d59C8c1E0bDe0CccCa332d5
  address internal constant UI_POOL_DATA_PROVIDER = 0xbd83DdBE37fc91923d59C8c1E0bDe0CccCa332d5;

  // https://explorer.optimism.io/address/0xBc790382B3686abffE4be14A030A96aC6154023a
  address internal constant WALLET_BALANCE_PROVIDER = 0xBc790382B3686abffE4be14A030A96aC6154023a;

  // https://explorer.optimism.io/address/0x76D3030728e52DEB8848d5613aBaDE88441cbc59
  address internal constant WETH_GATEWAY = 0x76D3030728e52DEB8848d5613aBaDE88441cbc59;

  // https://explorer.optimism.io/address/0x78F8Bd884C3D738B74B420540659c82f392820e0
  address internal constant WITHDRAW_SWAP_ADAPTER = 0x78F8Bd884C3D738B74B420540659c82f392820e0;
}

library AaveV3OptimismAssets {
  // https://explorer.optimism.io/address/0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1
  address internal constant DAI_UNDERLYING = 0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1;

  uint8 internal constant DAI_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE
  address internal constant DAI_A_TOKEN = 0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE;

  // https://explorer.optimism.io/address/0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
  address internal constant DAI_V_TOKEN = 0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC;

  // https://explorer.optimism.io/address/0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B
  address internal constant DAI_S_TOKEN = 0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B;

  // https://explorer.optimism.io/address/0x8dBa75e83DA73cc766A7e5a0ee71F656BAb470d6
  address internal constant DAI_ORACLE = 0x8dBa75e83DA73cc766A7e5a0ee71F656BAb470d6;

  // https://explorer.optimism.io/address/0x6D6D3b7FC50999bf20dE5CC8e0F63AFD18B95f0e
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0x6D6D3b7FC50999bf20dE5CC8e0F63AFD18B95f0e;

  // https://explorer.optimism.io/address/0x6dDc64289bE8a71A707fB057d5d07Cc756055d6e
  address internal constant DAI_STATA_TOKEN = 0x6dDc64289bE8a71A707fB057d5d07Cc756055d6e;

  // https://explorer.optimism.io/address/0x350a791Bfc2C21F9Ed5d10980Dad2e2638ffa7f6
  address internal constant LINK_UNDERLYING = 0x350a791Bfc2C21F9Ed5d10980Dad2e2638ffa7f6;

  uint8 internal constant LINK_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530
  address internal constant LINK_A_TOKEN = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;

  // https://explorer.optimism.io/address/0x953A573793604aF8d41F306FEb8274190dB4aE0e
  address internal constant LINK_V_TOKEN = 0x953A573793604aF8d41F306FEb8274190dB4aE0e;

  // https://explorer.optimism.io/address/0x89D976629b7055ff1ca02b927BA3e020F22A44e4
  address internal constant LINK_S_TOKEN = 0x89D976629b7055ff1ca02b927BA3e020F22A44e4;

  // https://explorer.optimism.io/address/0xCc232dcFAAE6354cE191Bd574108c1aD03f86450
  address internal constant LINK_ORACLE = 0xCc232dcFAAE6354cE191Bd574108c1aD03f86450;

  // https://explorer.optimism.io/address/0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C;

  // https://explorer.optimism.io/address/0x39BCf217ACc4Bf2fCaF7BC8800E69D986912c75e
  address internal constant LINK_STATA_TOKEN = 0x39BCf217ACc4Bf2fCaF7BC8800E69D986912c75e;

  // https://explorer.optimism.io/address/0x7F5c764cBc14f9669B88837ca1490cCa17c31607
  address internal constant USDC_UNDERLYING = 0x7F5c764cBc14f9669B88837ca1490cCa17c31607;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://explorer.optimism.io/address/0x625E7708f30cA75bfd92586e17077590C60eb4cD
  address internal constant USDC_A_TOKEN = 0x625E7708f30cA75bfd92586e17077590C60eb4cD;

  // https://explorer.optimism.io/address/0xFCCf3cAbbe80101232d343252614b6A3eE81C989
  address internal constant USDC_V_TOKEN = 0xFCCf3cAbbe80101232d343252614b6A3eE81C989;

  // https://explorer.optimism.io/address/0x307ffe186F84a3bc2613D1eA417A5737D69A7007
  address internal constant USDC_S_TOKEN = 0x307ffe186F84a3bc2613D1eA417A5737D69A7007;

  // https://explorer.optimism.io/address/0x16a9FA2FDa030272Ce99B29CF780dFA30361E0f3
  address internal constant USDC_ORACLE = 0x16a9FA2FDa030272Ce99B29CF780dFA30361E0f3;

  // https://explorer.optimism.io/address/0x769EbC5106bF09D9A665CCb691e1907612b57F16
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x769EbC5106bF09D9A665CCb691e1907612b57F16;

  // https://explorer.optimism.io/address/0x9F281eb58fd98ad98EDe0fc4C553AD4D73e7Ca2C
  address internal constant USDC_STATA_TOKEN = 0x9F281eb58fd98ad98EDe0fc4C553AD4D73e7Ca2C;

  // https://explorer.optimism.io/address/0x68f180fcCe6836688e9084f035309E29Bf0A2095
  address internal constant WBTC_UNDERLYING = 0x68f180fcCe6836688e9084f035309E29Bf0A2095;

  uint8 internal constant WBTC_DECIMALS = 8;

  // https://explorer.optimism.io/address/0x078f358208685046a11C85e8ad32895DED33A249
  address internal constant WBTC_A_TOKEN = 0x078f358208685046a11C85e8ad32895DED33A249;

  // https://explorer.optimism.io/address/0x92b42c66840C7AD907b4BF74879FF3eF7c529473
  address internal constant WBTC_V_TOKEN = 0x92b42c66840C7AD907b4BF74879FF3eF7c529473;

  // https://explorer.optimism.io/address/0x633b207Dd676331c413D4C013a6294B0FE47cD0e
  address internal constant WBTC_S_TOKEN = 0x633b207Dd676331c413D4C013a6294B0FE47cD0e;

  // https://explorer.optimism.io/address/0xD702DD976Fb76Fffc2D3963D037dfDae5b04E593
  address internal constant WBTC_ORACLE = 0xD702DD976Fb76Fffc2D3963D037dfDae5b04E593;

  // https://explorer.optimism.io/address/0x04daBC3C1c052AB94AA2ca80140f2b978d2F6E17
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x04daBC3C1c052AB94AA2ca80140f2b978d2F6E17;

  // https://explorer.optimism.io/address/0x6d998FeEFC7B3664eaD09CAf02b5a0fc2E365F18
  address internal constant WBTC_STATA_TOKEN = 0x6d998FeEFC7B3664eaD09CAf02b5a0fc2E365F18;

  // https://explorer.optimism.io/address/0x4200000000000000000000000000000000000006
  address internal constant WETH_UNDERLYING = 0x4200000000000000000000000000000000000006;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://explorer.optimism.io/address/0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8
  address internal constant WETH_A_TOKEN = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;

  // https://explorer.optimism.io/address/0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
  address internal constant WETH_V_TOKEN = 0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351;

  // https://explorer.optimism.io/address/0xD8Ad37849950903571df17049516a5CD4cbE55F6
  address internal constant WETH_S_TOKEN = 0xD8Ad37849950903571df17049516a5CD4cbE55F6;

  // https://explorer.optimism.io/address/0x13e3Ee699D1909E989722E753853AE30b17e08c5
  address internal constant WETH_ORACLE = 0x13e3Ee699D1909E989722E753853AE30b17e08c5;

  // https://explorer.optimism.io/address/0x5f58C25D17C09c9e1892F45DE6dA45ed973A5326
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x5f58C25D17C09c9e1892F45DE6dA45ed973A5326;

  // https://explorer.optimism.io/address/0x98d69620C31869fD4822ceb6ADAB31180475FD37
  address internal constant WETH_STATA_TOKEN = 0x98d69620C31869fD4822ceb6ADAB31180475FD37;

  // https://explorer.optimism.io/address/0x94b008aA00579c1307B0EF2c499aD98a8ce58e58
  address internal constant USDT_UNDERLYING = 0x94b008aA00579c1307B0EF2c499aD98a8ce58e58;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://explorer.optimism.io/address/0x6ab707Aca953eDAeFBc4fD23bA73294241490620
  address internal constant USDT_A_TOKEN = 0x6ab707Aca953eDAeFBc4fD23bA73294241490620;

  // https://explorer.optimism.io/address/0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
  address internal constant USDT_V_TOKEN = 0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7;

  // https://explorer.optimism.io/address/0x70eFfc565DB6EEf7B927610155602d31b670e802
  address internal constant USDT_S_TOKEN = 0x70eFfc565DB6EEf7B927610155602d31b670e802;

  // https://explorer.optimism.io/address/0xECef79E109e997bCA29c1c0897ec9d7b03647F5E
  address internal constant USDT_ORACLE = 0xECef79E109e997bCA29c1c0897ec9d7b03647F5E;

  // https://explorer.optimism.io/address/0x6D6D3b7FC50999bf20dE5CC8e0F63AFD18B95f0e
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x6D6D3b7FC50999bf20dE5CC8e0F63AFD18B95f0e;

  // https://explorer.optimism.io/address/0x035c93db04E5aAea54E6cd0261C492a3e0638b37
  address internal constant USDT_STATA_TOKEN = 0x035c93db04E5aAea54E6cd0261C492a3e0638b37;

  // https://explorer.optimism.io/address/0x76FB31fb4af56892A25e32cFC43De717950c9278
  address internal constant AAVE_UNDERLYING = 0x76FB31fb4af56892A25e32cFC43De717950c9278;

  uint8 internal constant AAVE_DECIMALS = 18;

  // https://explorer.optimism.io/address/0xf329e36C7bF6E5E86ce2150875a84Ce77f477375
  address internal constant AAVE_A_TOKEN = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;

  // https://explorer.optimism.io/address/0xE80761Ea617F66F96274eA5e8c37f03960ecC679
  address internal constant AAVE_V_TOKEN = 0xE80761Ea617F66F96274eA5e8c37f03960ecC679;

  // https://explorer.optimism.io/address/0xfAeF6A702D15428E588d4C0614AEFb4348D83D48
  address internal constant AAVE_S_TOKEN = 0xfAeF6A702D15428E588d4C0614AEFb4348D83D48;

  // https://explorer.optimism.io/address/0x338ed6787f463394D24813b297401B9F05a8C9d1
  address internal constant AAVE_ORACLE = 0x338ed6787f463394D24813b297401B9F05a8C9d1;

  // https://explorer.optimism.io/address/0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C;

  // https://explorer.optimism.io/address/0xae0Ca1B1Bc6cac26981B5e2b9c40f8Ce8A9082eE
  address internal constant AAVE_STATA_TOKEN = 0xae0Ca1B1Bc6cac26981B5e2b9c40f8Ce8A9082eE;

  // https://explorer.optimism.io/address/0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9
  address internal constant sUSD_UNDERLYING = 0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9;

  uint8 internal constant sUSD_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97
  address internal constant sUSD_A_TOKEN = 0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97;

  // https://explorer.optimism.io/address/0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
  address internal constant sUSD_V_TOKEN = 0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8;

  // https://explorer.optimism.io/address/0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E
  address internal constant sUSD_S_TOKEN = 0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E;

  // https://explorer.optimism.io/address/0x7f99817d87baD03ea21E05112Ca799d715730efe
  address internal constant sUSD_ORACLE = 0x7f99817d87baD03ea21E05112Ca799d715730efe;

  // https://explorer.optimism.io/address/0xD61ca03Eac0352090f45bE50403F7B17d20E11F2
  address internal constant sUSD_INTEREST_RATE_STRATEGY =
    0xD61ca03Eac0352090f45bE50403F7B17d20E11F2;

  // https://explorer.optimism.io/address/0x3A956E2Fcc7e71Ea14b0257d40BEbdB287d19652
  address internal constant sUSD_STATA_TOKEN = 0x3A956E2Fcc7e71Ea14b0257d40BEbdB287d19652;

  // https://explorer.optimism.io/address/0x4200000000000000000000000000000000000042
  address internal constant OP_UNDERLYING = 0x4200000000000000000000000000000000000042;

  uint8 internal constant OP_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf
  address internal constant OP_A_TOKEN = 0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf;

  // https://explorer.optimism.io/address/0x77CA01483f379E58174739308945f044e1a764dc
  address internal constant OP_V_TOKEN = 0x77CA01483f379E58174739308945f044e1a764dc;

  // https://explorer.optimism.io/address/0x08Cb71192985E936C7Cd166A8b268035e400c3c3
  address internal constant OP_S_TOKEN = 0x08Cb71192985E936C7Cd166A8b268035e400c3c3;

  // https://explorer.optimism.io/address/0x0D276FC14719f9292D5C1eA2198673d1f4269246
  address internal constant OP_ORACLE = 0x0D276FC14719f9292D5C1eA2198673d1f4269246;

  // https://explorer.optimism.io/address/0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C
  address internal constant OP_INTEREST_RATE_STRATEGY = 0xeE1BAc9355EaAfCD1B68d272d640d870bC9b4b5C;

  // https://explorer.optimism.io/address/0xd4F1Cf9A038269FE8F03745C2875591Ad6438ab1
  address internal constant OP_STATA_TOKEN = 0xd4F1Cf9A038269FE8F03745C2875591Ad6438ab1;

  // https://explorer.optimism.io/address/0x1F32b1c2345538c0c6f582fCB022739c4A194Ebb
  address internal constant wstETH_UNDERLYING = 0x1F32b1c2345538c0c6f582fCB022739c4A194Ebb;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://explorer.optimism.io/address/0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA
  address internal constant wstETH_A_TOKEN = 0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA;

  // https://explorer.optimism.io/address/0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907
  address internal constant wstETH_V_TOKEN = 0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907;

  // https://explorer.optimism.io/address/0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841
  address internal constant wstETH_S_TOKEN = 0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841;

  // https://explorer.optimism.io/address/0x80f2c02224a2E548FC67c0bF705eBFA825dd5439
  address internal constant wstETH_ORACLE = 0x80f2c02224a2E548FC67c0bF705eBFA825dd5439;

  // https://explorer.optimism.io/address/0x6BA97468e2e6a3711a6DD05F0075d48E878c910e
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0x6BA97468e2e6a3711a6DD05F0075d48E878c910e;

  // https://explorer.optimism.io/address/0xb972abef80046A57409e37a7DF5dEf2638917516
  address internal constant wstETH_STATA_TOKEN = 0xb972abef80046A57409e37a7DF5dEf2638917516;

  // https://explorer.optimism.io/address/0xc40F949F8a4e094D1b49a23ea9241D289B7b2819
  address internal constant LUSD_UNDERLYING = 0xc40F949F8a4e094D1b49a23ea9241D289B7b2819;

  uint8 internal constant LUSD_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x8Eb270e296023E9D92081fdF967dDd7878724424
  address internal constant LUSD_A_TOKEN = 0x8Eb270e296023E9D92081fdF967dDd7878724424;

  // https://explorer.optimism.io/address/0xCE186F6Cccb0c955445bb9d10C59caE488Fea559
  address internal constant LUSD_V_TOKEN = 0xCE186F6Cccb0c955445bb9d10C59caE488Fea559;

  // https://explorer.optimism.io/address/0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc
  address internal constant LUSD_S_TOKEN = 0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc;

  // https://explorer.optimism.io/address/0x9dfc79Aaeb5bb0f96C6e9402671981CdFc424052
  address internal constant LUSD_ORACLE = 0x9dfc79Aaeb5bb0f96C6e9402671981CdFc424052;

  // https://explorer.optimism.io/address/0x41365f2aC2D19c3B4Bc691007d314aba80af3669
  address internal constant LUSD_INTEREST_RATE_STRATEGY =
    0x41365f2aC2D19c3B4Bc691007d314aba80af3669;

  // https://explorer.optimism.io/address/0x84648dc3Cefb601bc28a49A07a1A8Bad04D30Ad3
  address internal constant LUSD_STATA_TOKEN = 0x84648dc3Cefb601bc28a49A07a1A8Bad04D30Ad3;

  // https://explorer.optimism.io/address/0xdFA46478F9e5EA86d57387849598dbFB2e964b02
  address internal constant MAI_UNDERLYING = 0xdFA46478F9e5EA86d57387849598dbFB2e964b02;

  uint8 internal constant MAI_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x8ffDf2DE812095b1D19CB146E4c004587C0A0692
  address internal constant MAI_A_TOKEN = 0x8ffDf2DE812095b1D19CB146E4c004587C0A0692;

  // https://explorer.optimism.io/address/0xA8669021776Bc142DfcA87c21b4A52595bCbB40a
  address internal constant MAI_V_TOKEN = 0xA8669021776Bc142DfcA87c21b4A52595bCbB40a;

  // https://explorer.optimism.io/address/0xa5e408678469d23efDB7694b1B0A85BB0669e8bd
  address internal constant MAI_S_TOKEN = 0xa5e408678469d23efDB7694b1B0A85BB0669e8bd;

  // https://explorer.optimism.io/address/0x73A3919a69eFCd5b19df8348c6740bB1446F5ed0
  address internal constant MAI_ORACLE = 0x73A3919a69eFCd5b19df8348c6740bB1446F5ed0;

  // https://explorer.optimism.io/address/0x049E42fe40368384d04bC10f8494Ea6FD164442a
  address internal constant MAI_INTEREST_RATE_STRATEGY = 0x049E42fe40368384d04bC10f8494Ea6FD164442a;

  // https://explorer.optimism.io/address/0x60495bC8D8Baf7E866888ecC00491e37B47dfF24
  address internal constant MAI_STATA_TOKEN = 0x60495bC8D8Baf7E866888ecC00491e37B47dfF24;

  // https://explorer.optimism.io/address/0x9Bcef72be871e61ED4fBbc7630889beE758eb81D
  address internal constant rETH_UNDERLYING = 0x9Bcef72be871e61ED4fBbc7630889beE758eb81D;

  uint8 internal constant rETH_DECIMALS = 18;

  // https://explorer.optimism.io/address/0x724dc807b04555b71ed48a6896b6F41593b8C637
  address internal constant rETH_A_TOKEN = 0x724dc807b04555b71ed48a6896b6F41593b8C637;

  // https://explorer.optimism.io/address/0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6
  address internal constant rETH_V_TOKEN = 0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6;

  // https://explorer.optimism.io/address/0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a
  address internal constant rETH_S_TOKEN = 0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a;

  // https://explorer.optimism.io/address/0x52d5F9f884CA21C27E2100735d793C6771eAB793
  address internal constant rETH_ORACLE = 0x52d5F9f884CA21C27E2100735d793C6771eAB793;

  // https://explorer.optimism.io/address/0x3B57B081dA6Af5e2759A57bD3211932Cb6176997
  address internal constant rETH_INTEREST_RATE_STRATEGY =
    0x3B57B081dA6Af5e2759A57bD3211932Cb6176997;

  // https://explorer.optimism.io/address/0xf9ce3c97b4b54F3D16861420f4816D9f68190B7B
  address internal constant rETH_STATA_TOKEN = 0xf9ce3c97b4b54F3D16861420f4816D9f68190B7B;

  // https://explorer.optimism.io/address/0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85
  address internal constant USDCn_UNDERLYING = 0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85;

  uint8 internal constant USDCn_DECIMALS = 6;

  // https://explorer.optimism.io/address/0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5
  address internal constant USDCn_A_TOKEN = 0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5;

  // https://explorer.optimism.io/address/0x5D557B07776D12967914379C71a1310e917C7555
  address internal constant USDCn_V_TOKEN = 0x5D557B07776D12967914379C71a1310e917C7555;

  // https://explorer.optimism.io/address/0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB
  address internal constant USDCn_S_TOKEN = 0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB;

  // https://explorer.optimism.io/address/0x16a9FA2FDa030272Ce99B29CF780dFA30361E0f3
  address internal constant USDCn_ORACLE = 0x16a9FA2FDa030272Ce99B29CF780dFA30361E0f3;

  // https://explorer.optimism.io/address/0xB57Ff919A953424d6B143ABfD6740A225eab953e
  address internal constant USDCn_INTEREST_RATE_STRATEGY =
    0xB57Ff919A953424d6B143ABfD6740A225eab953e;
}

library AaveV3OptimismEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant STABLECOINS = 1;

  uint8 internal constant ETH_CORRELATED = 2;
}
