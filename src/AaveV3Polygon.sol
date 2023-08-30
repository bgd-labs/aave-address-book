// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

library AaveV3Polygon {
  // https://polygonscan.com/address/0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);
  // https://polygonscan.com/address/0x794a61358D6845594F94dc1DB02A252b5b4814aD
  IPool internal constant POOL = IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);
  // https://polygonscan.com/address/0x8145eddDf43f50276641b55bd3AD95944510021E
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);
  // https://polygonscan.com/address/0xb023e699F5a33916Ea823A16485e259257cA8Bd1
  IAaveOracle internal constant ORACLE = IAaveOracle(0xb023e699F5a33916Ea823A16485e259257cA8Bd1);
  // https://polygonscan.com/address/0x0000000000000000000000000000000000000000
  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;
  // https://polygonscan.com/address/0x9441B65EE553F70df9C77d45d3283B6BC24F222d
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x9441B65EE553F70df9C77d45d3283B6BC24F222d);
  // https://polygonscan.com/address/0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);
  // https://polygonscan.com/address/0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772
  address internal constant ACL_ADMIN = 0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772;
  // https://polygonscan.com/address/0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383
  ICollector internal constant COLLECTOR = ICollector(0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383);
  // https://polygonscan.com/address/0x929EC64c34a17401F460460D4B9390518E5B473e
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x929EC64c34a17401F460460D4B9390518E5B473e;
  // https://polygonscan.com/address/0xCf85FF1c37c594a10195F7A9Ab85CBb0a03f69dE
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_2 = 0xCf85FF1c37c594a10195F7A9Ab85CBb0a03f69dE;
  // https://polygonscan.com/address/0x79b5e91037AE441dE0d9e6fd3Fd85b96B83d4E93
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_2 =
    0x79b5e91037AE441dE0d9e6fd3Fd85b96B83d4E93;
  // https://polygonscan.com/address/0x50ddd0Cd4266299527d25De9CBb55fE0EB8dAc30
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_2 =
    0x50ddd0Cd4266299527d25De9CBb55fE0EB8dAc30;
  // https://polygonscan.com/address/0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73
  address internal constant EMISSION_MANAGER = 0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;
  // https://polygonscan.com/address/0xc5de989E0D1BF605d19478Fdd32Aa827a10b464f
  address internal constant CAPS_PLUS_RISK_STEWARD = 0xc5de989E0D1BF605d19478Fdd32Aa827a10b464f;
  // https://polygonscan.com/address/0x2a6C8D620371AEc6bCA1d18AAaF96efE11Eb3d6c
  address internal constant DEBT_SWAP_ADAPTER = 0x2a6C8D620371AEc6bCA1d18AAaF96efE11Eb3d6c;
  // https://polygonscan.com/address/0xE202F2fc4b6A37Ba53cfD15bE42a762A645FCA07
  address internal constant LISTING_ENGINE = 0xE202F2fc4b6A37Ba53cfD15bE42a762A645FCA07;
  // https://polygonscan.com/address/0x770ef9f4fe897e59daCc474EF11238303F9552b6
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x770ef9f4fe897e59daCc474EF11238303F9552b6;
  // https://polygonscan.com/address/0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896
  address internal constant RATES_FACTORY = 0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896;
  // https://polygonscan.com/address/0xE3090207A2de94A856EA10a7e1Bd36dD6145712B
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0xE3090207A2de94A856EA10a7e1Bd36dD6145712B;
  // https://polygonscan.com/address/0x2B218C73f63820CE86655d16A79C333E24fEB0BE
  address internal constant STATIC_A_TOKEN_FACTORY = 0x2B218C73f63820CE86655d16A79C333E24fEB0BE;
  // https://polygonscan.com/address/0xC4aff49fCeD8ac1D818a6DCAB063f9f97E66ec5E
  address internal constant SWAP_COLLATERAL_ADAPTER = 0xC4aff49fCeD8ac1D818a6DCAB063f9f97E66ec5E;
  // https://polygonscan.com/address/0x874313A46e4957D29FAAC43BF5Eb2B144894f557
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x874313A46e4957D29FAAC43BF5Eb2B144894f557;
  // https://polygonscan.com/address/0xC69728f11E9E6127733751c8410432913123acf1
  address internal constant UI_POOL_DATA_PROVIDER = 0xC69728f11E9E6127733751c8410432913123acf1;
  // https://polygonscan.com/address/0xBc790382B3686abffE4be14A030A96aC6154023a
  address internal constant WALLET_BALANCE_PROVIDER = 0xBc790382B3686abffE4be14A030A96aC6154023a;
  // https://polygonscan.com/address/0x1e4b7A6b903680eab0c5dAbcb8fD429cD2a9598c
  address internal constant WETH_GATEWAY = 0x1e4b7A6b903680eab0c5dAbcb8fD429cD2a9598c;
}

library AaveV3PolygonAssets {
  // https://polygonscan.com/address/0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063
  address internal constant DAI_UNDERLYING = 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063;
  uint256 internal constant DAI_DECIMALS = 18;
  // https://polygonscan.com/address/0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE
  address internal constant DAI_A_TOKEN = 0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE;
  // https://polygonscan.com/address/0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
  address internal constant DAI_V_TOKEN = 0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC;
  // https://polygonscan.com/address/0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B
  address internal constant DAI_S_TOKEN = 0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B;
  // https://polygonscan.com/address/0x4746DeC9e833A82EC7C2C1356372CcF2cfcD2F3D
  address internal constant DAI_ORACLE = 0x4746DeC9e833A82EC7C2C1356372CcF2cfcD2F3D;
  // https://polygonscan.com/address/0xA9F3C3caE095527061e6d270DBE163693e6fda9D
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xA9F3C3caE095527061e6d270DBE163693e6fda9D;
  // https://polygonscan.com/address/0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39
  address internal constant LINK_UNDERLYING = 0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39;
  uint256 internal constant LINK_DECIMALS = 18;
  // https://polygonscan.com/address/0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530
  address internal constant LINK_A_TOKEN = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;
  // https://polygonscan.com/address/0x953A573793604aF8d41F306FEb8274190dB4aE0e
  address internal constant LINK_V_TOKEN = 0x953A573793604aF8d41F306FEb8274190dB4aE0e;
  // https://polygonscan.com/address/0x89D976629b7055ff1ca02b927BA3e020F22A44e4
  address internal constant LINK_S_TOKEN = 0x89D976629b7055ff1ca02b927BA3e020F22A44e4;
  // https://polygonscan.com/address/0xd9FFdb71EbE7496cC440152d43986Aae0AB76665
  address internal constant LINK_ORACLE = 0xd9FFdb71EbE7496cC440152d43986Aae0AB76665;
  // https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;
  // https://polygonscan.com/address/0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174
  address internal constant USDC_UNDERLYING = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
  uint256 internal constant USDC_DECIMALS = 6;
  // https://polygonscan.com/address/0x625E7708f30cA75bfd92586e17077590C60eb4cD
  address internal constant USDC_A_TOKEN = 0x625E7708f30cA75bfd92586e17077590C60eb4cD;
  // https://polygonscan.com/address/0xFCCf3cAbbe80101232d343252614b6A3eE81C989
  address internal constant USDC_V_TOKEN = 0xFCCf3cAbbe80101232d343252614b6A3eE81C989;
  // https://polygonscan.com/address/0x307ffe186F84a3bc2613D1eA417A5737D69A7007
  address internal constant USDC_S_TOKEN = 0x307ffe186F84a3bc2613D1eA417A5737D69A7007;
  // https://polygonscan.com/address/0xfE4A8cc5b5B2366C1B58Bea3858e81843581b2F7
  address internal constant USDC_ORACLE = 0xfE4A8cc5b5B2366C1B58Bea3858e81843581b2F7;
  // https://polygonscan.com/address/0xC82dF96432346cFb632473eB619Db3B8AC280234
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0xC82dF96432346cFb632473eB619Db3B8AC280234;
  // https://polygonscan.com/address/0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6
  address internal constant WBTC_UNDERLYING = 0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6;
  uint256 internal constant WBTC_DECIMALS = 8;
  // https://polygonscan.com/address/0x078f358208685046a11C85e8ad32895DED33A249
  address internal constant WBTC_A_TOKEN = 0x078f358208685046a11C85e8ad32895DED33A249;
  // https://polygonscan.com/address/0x92b42c66840C7AD907b4BF74879FF3eF7c529473
  address internal constant WBTC_V_TOKEN = 0x92b42c66840C7AD907b4BF74879FF3eF7c529473;
  // https://polygonscan.com/address/0x633b207Dd676331c413D4C013a6294B0FE47cD0e
  address internal constant WBTC_S_TOKEN = 0x633b207Dd676331c413D4C013a6294B0FE47cD0e;
  // https://polygonscan.com/address/0xc907E116054Ad103354f2D350FD2514433D57F6f
  address internal constant WBTC_ORACLE = 0xc907E116054Ad103354f2D350FD2514433D57F6f;
  // https://polygonscan.com/address/0x07Fa3744FeC271F80c2EA97679823F65c13CCDf4
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x07Fa3744FeC271F80c2EA97679823F65c13CCDf4;
  // https://polygonscan.com/address/0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619
  address internal constant WETH_UNDERLYING = 0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619;
  uint256 internal constant WETH_DECIMALS = 18;
  // https://polygonscan.com/address/0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8
  address internal constant WETH_A_TOKEN = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;
  // https://polygonscan.com/address/0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
  address internal constant WETH_V_TOKEN = 0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351;
  // https://polygonscan.com/address/0xD8Ad37849950903571df17049516a5CD4cbE55F6
  address internal constant WETH_S_TOKEN = 0xD8Ad37849950903571df17049516a5CD4cbE55F6;
  // https://polygonscan.com/address/0xF9680D99D6C9589e2a93a78A04A279e509205945
  address internal constant WETH_ORACLE = 0xF9680D99D6C9589e2a93a78A04A279e509205945;
  // https://polygonscan.com/address/0x27eFE5db315b71753b2a38ED3d5dd7E9362ba93F
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x27eFE5db315b71753b2a38ED3d5dd7E9362ba93F;
  // https://polygonscan.com/address/0xc2132D05D31c914a87C6611C10748AEb04B58e8F
  address internal constant USDT_UNDERLYING = 0xc2132D05D31c914a87C6611C10748AEb04B58e8F;
  uint256 internal constant USDT_DECIMALS = 6;
  // https://polygonscan.com/address/0x6ab707Aca953eDAeFBc4fD23bA73294241490620
  address internal constant USDT_A_TOKEN = 0x6ab707Aca953eDAeFBc4fD23bA73294241490620;
  // https://polygonscan.com/address/0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
  address internal constant USDT_V_TOKEN = 0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7;
  // https://polygonscan.com/address/0x70eFfc565DB6EEf7B927610155602d31b670e802
  address internal constant USDT_S_TOKEN = 0x70eFfc565DB6EEf7B927610155602d31b670e802;
  // https://polygonscan.com/address/0x0A6513e40db6EB1b165753AD52E80663aeA50545
  address internal constant USDT_ORACLE = 0x0A6513e40db6EB1b165753AD52E80663aeA50545;
  // https://polygonscan.com/address/0xA9F3C3caE095527061e6d270DBE163693e6fda9D
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0xA9F3C3caE095527061e6d270DBE163693e6fda9D;
  // https://polygonscan.com/address/0xD6DF932A45C0f255f85145f286eA0b292B21C90B
  address internal constant AAVE_UNDERLYING = 0xD6DF932A45C0f255f85145f286eA0b292B21C90B;
  uint256 internal constant AAVE_DECIMALS = 18;
  // https://polygonscan.com/address/0xf329e36C7bF6E5E86ce2150875a84Ce77f477375
  address internal constant AAVE_A_TOKEN = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;
  // https://polygonscan.com/address/0xE80761Ea617F66F96274eA5e8c37f03960ecC679
  address internal constant AAVE_V_TOKEN = 0xE80761Ea617F66F96274eA5e8c37f03960ecC679;
  // https://polygonscan.com/address/0xfAeF6A702D15428E588d4C0614AEFb4348D83D48
  address internal constant AAVE_S_TOKEN = 0xfAeF6A702D15428E588d4C0614AEFb4348D83D48;
  // https://polygonscan.com/address/0x72484B12719E23115761D5DA1646945632979bB6
  address internal constant AAVE_ORACLE = 0x72484B12719E23115761D5DA1646945632979bB6;
  // https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;
  // https://polygonscan.com/address/0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270
  address internal constant WMATIC_UNDERLYING = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;
  uint256 internal constant WMATIC_DECIMALS = 18;
  // https://polygonscan.com/address/0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97
  address internal constant WMATIC_A_TOKEN = 0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97;
  // https://polygonscan.com/address/0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
  address internal constant WMATIC_V_TOKEN = 0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8;
  // https://polygonscan.com/address/0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E
  address internal constant WMATIC_S_TOKEN = 0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E;
  // https://polygonscan.com/address/0xAB594600376Ec9fD91F8e885dADF0CE036862dE0
  address internal constant WMATIC_ORACLE = 0xAB594600376Ec9fD91F8e885dADF0CE036862dE0;
  // https://polygonscan.com/address/0xFB0898dCFb69DF9E01DBE625A5988D6542e5BdC5
  address internal constant WMATIC_INTEREST_RATE_STRATEGY =
    0xFB0898dCFb69DF9E01DBE625A5988D6542e5BdC5;
  // https://polygonscan.com/address/0x172370d5Cd63279eFa6d502DAB29171933a610AF
  address internal constant CRV_UNDERLYING = 0x172370d5Cd63279eFa6d502DAB29171933a610AF;
  uint256 internal constant CRV_DECIMALS = 18;
  // https://polygonscan.com/address/0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf
  address internal constant CRV_A_TOKEN = 0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf;
  // https://polygonscan.com/address/0x77CA01483f379E58174739308945f044e1a764dc
  address internal constant CRV_V_TOKEN = 0x77CA01483f379E58174739308945f044e1a764dc;
  // https://polygonscan.com/address/0x08Cb71192985E936C7Cd166A8b268035e400c3c3
  address internal constant CRV_S_TOKEN = 0x08Cb71192985E936C7Cd166A8b268035e400c3c3;
  // https://polygonscan.com/address/0x336584C8E6Dc19637A5b36206B1c79923111b405
  address internal constant CRV_ORACLE = 0x336584C8E6Dc19637A5b36206B1c79923111b405;
  // https://polygonscan.com/address/0xBefcd01681224555b74eAC87207eaF9Bc3361F59
  address internal constant CRV_INTEREST_RATE_STRATEGY = 0xBefcd01681224555b74eAC87207eaF9Bc3361F59;
  // https://polygonscan.com/address/0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a
  address internal constant SUSHI_UNDERLYING = 0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a;
  uint256 internal constant SUSHI_DECIMALS = 18;
  // https://polygonscan.com/address/0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA
  address internal constant SUSHI_A_TOKEN = 0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA;
  // https://polygonscan.com/address/0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907
  address internal constant SUSHI_V_TOKEN = 0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907;
  // https://polygonscan.com/address/0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841
  address internal constant SUSHI_S_TOKEN = 0x78246294a4c6fBf614Ed73CcC9F8b875ca8eE841;
  // https://polygonscan.com/address/0x49B0c695039243BBfEb8EcD054EB70061fd54aa0
  address internal constant SUSHI_ORACLE = 0x49B0c695039243BBfEb8EcD054EB70061fd54aa0;
  // https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F
  address internal constant SUSHI_INTEREST_RATE_STRATEGY =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;
  // https://polygonscan.com/address/0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7
  address internal constant GHST_UNDERLYING = 0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7;
  uint256 internal constant GHST_DECIMALS = 18;
  // https://polygonscan.com/address/0x8Eb270e296023E9D92081fdF967dDd7878724424
  address internal constant GHST_A_TOKEN = 0x8Eb270e296023E9D92081fdF967dDd7878724424;
  // https://polygonscan.com/address/0xCE186F6Cccb0c955445bb9d10C59caE488Fea559
  address internal constant GHST_V_TOKEN = 0xCE186F6Cccb0c955445bb9d10C59caE488Fea559;
  // https://polygonscan.com/address/0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc
  address internal constant GHST_S_TOKEN = 0x3EF10DFf4928279c004308EbADc4Db8B7620d6fc;
  // https://polygonscan.com/address/0xDD229Ce42f11D8Ee7fFf29bDB71C7b81352e11be
  address internal constant GHST_ORACLE = 0xDD229Ce42f11D8Ee7fFf29bDB71C7b81352e11be;
  // https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F
  address internal constant GHST_INTEREST_RATE_STRATEGY =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;
  // https://polygonscan.com/address/0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3
  address internal constant BAL_UNDERLYING = 0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3;
  uint256 internal constant BAL_DECIMALS = 18;
  // https://polygonscan.com/address/0x8ffDf2DE812095b1D19CB146E4c004587C0A0692
  address internal constant BAL_A_TOKEN = 0x8ffDf2DE812095b1D19CB146E4c004587C0A0692;
  // https://polygonscan.com/address/0xA8669021776Bc142DfcA87c21b4A52595bCbB40a
  address internal constant BAL_V_TOKEN = 0xA8669021776Bc142DfcA87c21b4A52595bCbB40a;
  // https://polygonscan.com/address/0xa5e408678469d23efDB7694b1B0A85BB0669e8bd
  address internal constant BAL_S_TOKEN = 0xa5e408678469d23efDB7694b1B0A85BB0669e8bd;
  // https://polygonscan.com/address/0xD106B538F2A868c28Ca1Ec7E298C3325E0251d66
  address internal constant BAL_ORACLE = 0xD106B538F2A868c28Ca1Ec7E298C3325E0251d66;
  // https://polygonscan.com/address/0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A
  address internal constant BAL_INTEREST_RATE_STRATEGY = 0xCbDC7D7984D7AD59434f0B1999D2006898C40f9A;
  // https://polygonscan.com/address/0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369
  address internal constant DPI_UNDERLYING = 0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369;
  uint256 internal constant DPI_DECIMALS = 18;
  // https://polygonscan.com/address/0x724dc807b04555b71ed48a6896b6F41593b8C637
  address internal constant DPI_A_TOKEN = 0x724dc807b04555b71ed48a6896b6F41593b8C637;
  // https://polygonscan.com/address/0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6
  address internal constant DPI_V_TOKEN = 0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6;
  // https://polygonscan.com/address/0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a
  address internal constant DPI_S_TOKEN = 0xDC1fad70953Bb3918592b6fCc374fe05F5811B6a;
  // https://polygonscan.com/address/0x2e48b7924FBe04d575BA229A59b64547d9da16e9
  address internal constant DPI_ORACLE = 0x2e48b7924FBe04d575BA229A59b64547d9da16e9;
  // https://polygonscan.com/address/0xd9d85499449f26d2A2c240defd75314f23920089
  address internal constant DPI_INTEREST_RATE_STRATEGY = 0xd9d85499449f26d2A2c240defd75314f23920089;
  // https://polygonscan.com/address/0xE111178A87A3BFf0c8d18DECBa5798827539Ae99
  address internal constant EURS_UNDERLYING = 0xE111178A87A3BFf0c8d18DECBa5798827539Ae99;
  uint256 internal constant EURS_DECIMALS = 2;
  // https://polygonscan.com/address/0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5
  address internal constant EURS_A_TOKEN = 0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5;
  // https://polygonscan.com/address/0x5D557B07776D12967914379C71a1310e917C7555
  address internal constant EURS_V_TOKEN = 0x5D557B07776D12967914379C71a1310e917C7555;
  // https://polygonscan.com/address/0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB
  address internal constant EURS_S_TOKEN = 0x8a9FdE6925a839F6B1932d16B36aC026F8d3FbdB;
  // https://polygonscan.com/address/0x73366Fe0AA0Ded304479862808e02506FE556a98
  address internal constant EURS_ORACLE = 0x73366Fe0AA0Ded304479862808e02506FE556a98;
  // https://polygonscan.com/address/0x8F183Ee74C790CB558232a141099b316D6C8Ba6E
  address internal constant EURS_INTEREST_RATE_STRATEGY =
    0x8F183Ee74C790CB558232a141099b316D6C8Ba6E;
  // https://polygonscan.com/address/0x4e3Decbb3645551B8A19f0eA1678079FCB33fB4c
  address internal constant jEUR_UNDERLYING = 0x4e3Decbb3645551B8A19f0eA1678079FCB33fB4c;
  uint256 internal constant jEUR_DECIMALS = 18;
  // https://polygonscan.com/address/0x6533afac2E7BCCB20dca161449A13A32D391fb00
  address internal constant jEUR_A_TOKEN = 0x6533afac2E7BCCB20dca161449A13A32D391fb00;
  // https://polygonscan.com/address/0x44705f578135cC5d703b4c9c122528C73Eb87145
  address internal constant jEUR_V_TOKEN = 0x44705f578135cC5d703b4c9c122528C73Eb87145;
  // https://polygonscan.com/address/0x6B4b37618D85Db2a7b469983C888040F7F05Ea3D
  address internal constant jEUR_S_TOKEN = 0x6B4b37618D85Db2a7b469983C888040F7F05Ea3D;
  // https://polygonscan.com/address/0x73366Fe0AA0Ded304479862808e02506FE556a98
  address internal constant jEUR_ORACLE = 0x73366Fe0AA0Ded304479862808e02506FE556a98;
  // https://polygonscan.com/address/0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4
  address internal constant jEUR_INTEREST_RATE_STRATEGY =
    0x41B66b4b6b4c9dab039d96528D1b88f7BAF8C5A4;
  // https://polygonscan.com/address/0xE0B52e49357Fd4DAf2c15e02058DCE6BC0057db4
  address internal constant agEUR_UNDERLYING = 0xE0B52e49357Fd4DAf2c15e02058DCE6BC0057db4;
  uint256 internal constant agEUR_DECIMALS = 18;
  // https://polygonscan.com/address/0x8437d7C167dFB82ED4Cb79CD44B7a32A1dd95c77
  address internal constant agEUR_A_TOKEN = 0x8437d7C167dFB82ED4Cb79CD44B7a32A1dd95c77;
  // https://polygonscan.com/address/0x3ca5FA07689F266e907439aFd1fBB59c44fe12f6
  address internal constant agEUR_V_TOKEN = 0x3ca5FA07689F266e907439aFd1fBB59c44fe12f6;
  // https://polygonscan.com/address/0x40B4BAEcc69B882e8804f9286b12228C27F8c9BF
  address internal constant agEUR_S_TOKEN = 0x40B4BAEcc69B882e8804f9286b12228C27F8c9BF;
  // https://polygonscan.com/address/0x73366Fe0AA0Ded304479862808e02506FE556a98
  address internal constant agEUR_ORACLE = 0x73366Fe0AA0Ded304479862808e02506FE556a98;
  // https://polygonscan.com/address/0xA9F3C3caE095527061e6d270DBE163693e6fda9D
  address internal constant agEUR_INTEREST_RATE_STRATEGY =
    0xA9F3C3caE095527061e6d270DBE163693e6fda9D;
  // https://polygonscan.com/address/0xa3Fa99A148fA48D14Ed51d610c367C61876997F1
  address internal constant miMATIC_UNDERLYING = 0xa3Fa99A148fA48D14Ed51d610c367C61876997F1;
  uint256 internal constant miMATIC_DECIMALS = 18;
  // https://polygonscan.com/address/0xeBe517846d0F36eCEd99C735cbF6131e1fEB775D
  address internal constant miMATIC_A_TOKEN = 0xeBe517846d0F36eCEd99C735cbF6131e1fEB775D;
  // https://polygonscan.com/address/0x18248226C16BF76c032817854E7C83a2113B4f06
  address internal constant miMATIC_V_TOKEN = 0x18248226C16BF76c032817854E7C83a2113B4f06;
  // https://polygonscan.com/address/0x687871030477bf974725232F764aa04318A8b9c8
  address internal constant miMATIC_S_TOKEN = 0x687871030477bf974725232F764aa04318A8b9c8;
  // https://polygonscan.com/address/0xd8d483d813547CfB624b8Dc33a00F2fcbCd2D428
  address internal constant miMATIC_ORACLE = 0xd8d483d813547CfB624b8Dc33a00F2fcbCd2D428;
  // https://polygonscan.com/address/0xA9F3C3caE095527061e6d270DBE163693e6fda9D
  address internal constant miMATIC_INTEREST_RATE_STRATEGY =
    0xA9F3C3caE095527061e6d270DBE163693e6fda9D;
  // https://polygonscan.com/address/0x3A58a54C066FdC0f2D55FC9C89F0415C92eBf3C4
  address internal constant stMATIC_UNDERLYING = 0x3A58a54C066FdC0f2D55FC9C89F0415C92eBf3C4;
  uint256 internal constant stMATIC_DECIMALS = 18;
  // https://polygonscan.com/address/0xEA1132120ddcDDA2F119e99Fa7A27a0d036F7Ac9
  address internal constant stMATIC_A_TOKEN = 0xEA1132120ddcDDA2F119e99Fa7A27a0d036F7Ac9;
  // https://polygonscan.com/address/0x6b030Ff3FB9956B1B69f475B77aE0d3Cf2CC5aFa
  address internal constant stMATIC_V_TOKEN = 0x6b030Ff3FB9956B1B69f475B77aE0d3Cf2CC5aFa;
  // https://polygonscan.com/address/0x1fFD28689DA7d0148ff0fCB669e9f9f0Fc13a219
  address internal constant stMATIC_S_TOKEN = 0x1fFD28689DA7d0148ff0fCB669e9f9f0Fc13a219;
  // https://polygonscan.com/address/0xEe96b77129cF54581B5a8FECCcC50A6A067034a1
  address internal constant stMATIC_ORACLE = 0xEe96b77129cF54581B5a8FECCcC50A6A067034a1;
  // https://polygonscan.com/address/0x03733F4E008d36f2e37F0080fF1c8DF756622E6F
  address internal constant stMATIC_INTEREST_RATE_STRATEGY =
    0x03733F4E008d36f2e37F0080fF1c8DF756622E6F;
  // https://polygonscan.com/address/0xfa68FB4628DFF1028CFEc22b4162FCcd0d45efb6
  address internal constant MaticX_UNDERLYING = 0xfa68FB4628DFF1028CFEc22b4162FCcd0d45efb6;
  uint256 internal constant MaticX_DECIMALS = 18;
  // https://polygonscan.com/address/0x80cA0d8C38d2e2BcbaB66aA1648Bd1C7160500FE
  address internal constant MaticX_A_TOKEN = 0x80cA0d8C38d2e2BcbaB66aA1648Bd1C7160500FE;
  // https://polygonscan.com/address/0xB5b46F918C2923fC7f26DB76e8a6A6e9C4347Cf9
  address internal constant MaticX_V_TOKEN = 0xB5b46F918C2923fC7f26DB76e8a6A6e9C4347Cf9;
  // https://polygonscan.com/address/0x62fC96b27a510cF4977B59FF952Dc32378Cc221d
  address internal constant MaticX_S_TOKEN = 0x62fC96b27a510cF4977B59FF952Dc32378Cc221d;
  // https://polygonscan.com/address/0x0e1120524e14Bd7aD96Ea76A1b1dD699913e2a45
  address internal constant MaticX_ORACLE = 0x0e1120524e14Bd7aD96Ea76A1b1dD699913e2a45;
  // https://polygonscan.com/address/0x6B434652E4C4e3e972f9F267982F05ae0fcc24b6
  address internal constant MaticX_INTEREST_RATE_STRATEGY =
    0x6B434652E4C4e3e972f9F267982F05ae0fcc24b6;
  // https://polygonscan.com/address/0x03b54A6e9a984069379fae1a4fC4dBAE93B3bCCD
  address internal constant wstETH_UNDERLYING = 0x03b54A6e9a984069379fae1a4fC4dBAE93B3bCCD;
  uint256 internal constant wstETH_DECIMALS = 18;
  // https://polygonscan.com/address/0xf59036CAEBeA7dC4b86638DFA2E3C97dA9FcCd40
  address internal constant wstETH_A_TOKEN = 0xf59036CAEBeA7dC4b86638DFA2E3C97dA9FcCd40;
  // https://polygonscan.com/address/0x77fA66882a8854d883101Fb8501BD3CaD347Fc32
  address internal constant wstETH_V_TOKEN = 0x77fA66882a8854d883101Fb8501BD3CaD347Fc32;
  // https://polygonscan.com/address/0x173e54325AE58B072985DbF232436961981EA000
  address internal constant wstETH_S_TOKEN = 0x173e54325AE58B072985DbF232436961981EA000;
  // https://polygonscan.com/address/0xe34949A48cd2E6f5CD41753e449bd2d43993C9AC
  address internal constant wstETH_ORACLE = 0xe34949A48cd2E6f5CD41753e449bd2d43993C9AC;
  // https://polygonscan.com/address/0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0xA6459195d60A797D278f58Ffbd2BA62Fb3F7FA1E;
}
