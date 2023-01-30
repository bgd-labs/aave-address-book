// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3Polygon {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

  IPool internal constant POOL = IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

  IAaveOracle internal constant ORACLE = IAaveOracle(0xb023e699F5a33916Ea823A16485e259257cA8Bd1);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x69FA688f1Dc47d4B5d8029D5a35FB7a548310654);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

  address internal constant ACL_ADMIN = 0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772;

  address internal constant COLLECTOR = 0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383;

  ICollector internal constant COLLECTOR_CONTROLLER =
    ICollector(0xDB89487A449274478e984665b8692AfC67459deF);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x929EC64c34a17401F460460D4B9390518E5B473e;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0xa5ba6E5EC19a1Bf23C857991c857dB62b2Aa187B;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x81387c40EB75acB02757C1Ae55D5936E78c9dEd3;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x52A1CeB68Ee6b7B5D13E0376A1E0E4423A8cE26e;

  address internal constant EMISSION_MANAGER = 0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;

  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x770ef9f4fe897e59daCc474EF11238303F9552b6;

  address internal constant WETH_GATEWAY = 0x1e4b7A6b903680eab0c5dAbcb8fD429cD2a9598c;

  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0xA125561fca253f19eA93970534Bb0364ea74187a;

  address internal constant SWAP_COLLATERAL_ADAPTER = 0x301F221bc732907E2da2dbBFaA8F8F6847c170c3;

  address internal constant WALLET_BALANCE_PROVIDER = 0xBc790382B3686abffE4be14A030A96aC6154023a;

  address internal constant UI_POOL_DATA_PROVIDER = 0xC69728f11E9E6127733751c8410432913123acf1;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x874313A46e4957D29FAAC43BF5Eb2B144894f557;
}

library AaveV3PolygonAssets {
  address internal constant UNDERLYING_DAI = 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063;

  address internal constant A_TOKEN_DAI = 0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE;

  address internal constant V_TOKEN_DAI = 0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC;

  address internal constant S_TOKEN_DAI = 0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B;

  address internal constant ORACLE_DAI = 0x4746DeC9e833A82EC7C2C1356372CcF2cfcD2F3D;

  address internal constant INTEREST_RATE_STRATEGY_DAI = 0xA9F3C3caE095527061e6d270DBE163693e6fda9D;

  address internal constant UNDERLYING_LINK = 0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39;

  address internal constant A_TOKEN_LINK = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;

  address internal constant V_TOKEN_LINK = 0x953A573793604aF8d41F306FEb8274190dB4aE0e;

  address internal constant S_TOKEN_LINK = 0x89D976629b7055ff1ca02b927BA3e020F22A44e4;

  address internal constant ORACLE_LINK = 0xd9FFdb71EbE7496cC440152d43986Aae0AB76665;

  address internal constant INTEREST_RATE_STRATEGY_LINK =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_USDC = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;

  address internal constant A_TOKEN_USDC = 0x625E7708f30cA75bfd92586e17077590C60eb4cD;

  address internal constant V_TOKEN_USDC = 0xFCCf3cAbbe80101232d343252614b6A3eE81C989;

  address internal constant S_TOKEN_USDC = 0x307ffe186F84a3bc2613D1eA417A5737D69A7007;

  address internal constant ORACLE_USDC = 0xfE4A8cc5b5B2366C1B58Bea3858e81843581b2F7;

  address internal constant INTEREST_RATE_STRATEGY_USDC =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;

  address internal constant UNDERLYING_WBTC = 0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6;

  address internal constant A_TOKEN_WBTC = 0x078f358208685046a11C85e8ad32895DED33A249;

  address internal constant V_TOKEN_WBTC = 0x92b42c66840C7AD907b4BF74879FF3eF7c529473;

  address internal constant S_TOKEN_WBTC = 0x633b207Dd676331c413D4C013a6294B0FE47cD0e;

  address internal constant ORACLE_WBTC = 0xc907E116054Ad103354f2D350FD2514433D57F6f;

  address internal constant INTEREST_RATE_STRATEGY_WBTC =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_WETH = 0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619;

  address internal constant A_TOKEN_WETH = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;

  address internal constant V_TOKEN_WETH = 0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351;

  address internal constant S_TOKEN_WETH = 0xD8Ad37849950903571df17049516a5CD4cbE55F6;

  address internal constant ORACLE_WETH = 0xF9680D99D6C9589e2a93a78A04A279e509205945;

  address internal constant INTEREST_RATE_STRATEGY_WETH =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_USDT = 0xc2132D05D31c914a87C6611C10748AEb04B58e8F;

  address internal constant A_TOKEN_USDT = 0x6ab707Aca953eDAeFBc4fD23bA73294241490620;

  address internal constant V_TOKEN_USDT = 0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7;

  address internal constant S_TOKEN_USDT = 0x70eFfc565DB6EEf7B927610155602d31b670e802;

  address internal constant ORACLE_USDT = 0x0A6513e40db6EB1b165753AD52E80663aeA50545;

  address internal constant INTEREST_RATE_STRATEGY_USDT =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;

  address internal constant UNDERLYING_AAVE = 0xD6DF932A45C0f255f85145f286eA0b292B21C90B;

  address internal constant A_TOKEN_AAVE = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;

  address internal constant V_TOKEN_AAVE = 0xE80761Ea617F66F96274eA5e8c37f03960ecC679;

  address internal constant S_TOKEN_AAVE = 0xfAeF6A702D15428E588d4C0614AEFb4348D83D48;

  address internal constant ORACLE_AAVE = 0x72484B12719E23115761D5DA1646945632979bB6;

  address internal constant INTEREST_RATE_STRATEGY_AAVE =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_WMATIC = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;

  address internal constant A_TOKEN_WMATIC = 0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97;

  address internal constant V_TOKEN_WMATIC = 0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8;

  address internal constant S_TOKEN_WMATIC = 0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E;

  address internal constant ORACLE_WMATIC = 0xAB594600376Ec9fD91F8e885dADF0CE036862dE0;

  address internal constant INTEREST_RATE_STRATEGY_WMATIC =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_CRV = 0x172370d5Cd63279eFa6d502DAB29171933a610AF;

  address internal constant A_TOKEN_CRV = 0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf;

  address internal constant V_TOKEN_CRV = 0x77CA01483f379E58174739308945f044e1a764dc;

  address internal constant S_TOKEN_CRV = 0x08Cb71192985E936C7Cd166A8b268035e400c3c3;

  address internal constant ORACLE_CRV = 0x336584C8E6Dc19637A5b36206B1c79923111b405;

  address internal constant INTEREST_RATE_STRATEGY_CRV = 0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_SUSHI = 0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a;

  address internal constant A_TOKEN_SUSHI = 0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA;

  address internal constant V_TOKEN_SUSHI = 0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907;

  address internal constant S_TOKEN_SUSHI = 0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841;

  address internal constant ORACLE_SUSHI = 0x49B0c695039243BBfEb8EcD054EB70061fd54aa0;

  address internal constant INTEREST_RATE_STRATEGY_SUSHI =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_GHST = 0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7;

  address internal constant A_TOKEN_GHST = 0x8Eb270e296023E9D92081fdF967dDd7878724424;

  address internal constant V_TOKEN_GHST = 0xCE186F6Cccb0c955445bb9d10C59caE488Fea559;

  address internal constant S_TOKEN_GHST = 0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc;

  address internal constant ORACLE_GHST = 0xDD229Ce42f11D8Ee7fFf29bDB71C7b81352e11be;

  address internal constant INTEREST_RATE_STRATEGY_GHST =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_BAL = 0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3;

  address internal constant A_TOKEN_BAL = 0x8ffDf2DE812095b1D19CB146E4c004587C0A0692;

  address internal constant V_TOKEN_BAL = 0xA8669021776Bc142DfcA87c21b4A52595bCbB40a;

  address internal constant S_TOKEN_BAL = 0xa5e408678469d23efDB7694b1B0A85BB0669e8bd;

  address internal constant ORACLE_BAL = 0xD106B538F2A868c28Ca1Ec7E298C3325E0251d66;

  address internal constant INTEREST_RATE_STRATEGY_BAL = 0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_DPI = 0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369;

  address internal constant A_TOKEN_DPI = 0x724dc807b04555b71ed48a6896b6F41593b8C637;

  address internal constant V_TOKEN_DPI = 0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6;

  address internal constant S_TOKEN_DPI = 0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a;

  address internal constant ORACLE_DPI = 0x2e48b7924FBe04d575BA229A59b64547d9da16e9;

  address internal constant INTEREST_RATE_STRATEGY_DPI = 0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_EURS = 0xE111178A87A3BFf0c8d18DECBa5798827539Ae99;

  address internal constant A_TOKEN_EURS = 0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5;

  address internal constant V_TOKEN_EURS = 0x5D557B07776D12967914379C71a1310e917C7555;

  address internal constant S_TOKEN_EURS = 0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB;

  address internal constant ORACLE_EURS = 0x73366Fe0AA0Ded304479862808e02506FE556a98;

  address internal constant INTEREST_RATE_STRATEGY_EURS =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;

  address internal constant UNDERLYING_jEUR = 0x4e3Decbb3645551B8A19f0eA1678079FCB33fB4c;

  address internal constant A_TOKEN_jEUR = 0x6533afac2E7BCCB20dca161449A13A32D391fb00;

  address internal constant V_TOKEN_jEUR = 0x44705f578135cC5d703b4c9c122528C73Eb87145;

  address internal constant S_TOKEN_jEUR = 0x6B4b37618D85Db2a7b469983C888040F7F05Ea3D;

  address internal constant ORACLE_jEUR = 0x73366Fe0AA0Ded304479862808e02506FE556a98;

  address internal constant INTEREST_RATE_STRATEGY_jEUR =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;

  address internal constant UNDERLYING_agEUR = 0xE0B52e49357Fd4DAf2c15e02058DCE6BC0057db4;

  address internal constant A_TOKEN_agEUR = 0x8437d7C167dFB82ED4Cb79CD44B7a32A1dd95c77;

  address internal constant V_TOKEN_agEUR = 0x3ca5FA07689F266e907439aFd1fBB59c44fe12f6;

  address internal constant S_TOKEN_agEUR = 0x40B4BAEcc69B882e8804f9286b12228C27F8c9BF;

  address internal constant ORACLE_agEUR = 0x73366Fe0AA0Ded304479862808e02506FE556a98;

  address internal constant INTEREST_RATE_STRATEGY_agEUR =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;

  address internal constant UNDERLYING_miMATIC = 0xa3Fa99A148fA48D14Ed51d610c367C61876997F1;

  address internal constant A_TOKEN_miMATIC = 0xeBe517846d0F36eCEd99C735cbF6131e1fEB775D;

  address internal constant V_TOKEN_miMATIC = 0x18248226C16BF76c032817854E7C83a2113B4f06;

  address internal constant S_TOKEN_miMATIC = 0x687871030477bf974725232F764aa04318A8b9c8;

  address internal constant ORACLE_miMATIC = 0xd8d483d813547CfB624b8Dc33a00F2fcbCd2D428;

  address internal constant INTEREST_RATE_STRATEGY_miMATIC =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;

  address internal constant UNDERLYING_stMATIC = 0x3A58a54C066FdC0f2D55FC9C89F0415C92eBf3C4;

  address internal constant A_TOKEN_stMATIC = 0xEA1132120ddcDDA2F119e99Fa7A27a0d036F7Ac9;

  address internal constant V_TOKEN_stMATIC = 0x6b030Ff3FB9956B1B69f475B77aE0d3Cf2CC5aFa;

  address internal constant S_TOKEN_stMATIC = 0x1fFD28689DA7d0148ff0fCB669e9f9f0Fc13a219;

  address internal constant ORACLE_stMATIC = 0x97371dF4492605486e23Da797fA68e55Fc38a13f;

  address internal constant INTEREST_RATE_STRATEGY_stMATIC =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;

  address internal constant UNDERLYING_MaticX = 0xfa68FB4628DFF1028CFEc22b4162FCcd0d45efb6;

  address internal constant A_TOKEN_MaticX = 0x80cA0d8C38d2e2BcbaB66aA1648Bd1C7160500FE;

  address internal constant V_TOKEN_MaticX = 0xB5b46F918C2923fC7f26DB76e8a6A6e9C4347Cf9;

  address internal constant S_TOKEN_MaticX = 0x62fC96b27a510cF4977B59FF952Dc32378Cc221d;

  address internal constant ORACLE_MaticX = 0x5d37E4b374E6907de8Fc7fb33EE3b0af403C7403;

  address internal constant INTEREST_RATE_STRATEGY_MaticX =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;
}
