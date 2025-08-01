// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from './AaveV2.sol';
import {ICollector} from './AaveV3.sol';
library AaveV2Polygon {
  // https://polygonscan.com/address/0xd05e3E715d945B59290df0ae8eF85c1BdB684744
  ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    ILendingPoolAddressesProvider(0xd05e3E715d945B59290df0ae8eF85c1BdB684744);

  // https://polygonscan.com/address/0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf
  ILendingPool internal constant POOL = ILendingPool(0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf);

  // https://polygonscan.com/address/0x1685D81212580DD4cDA287616C2f6F4794927e18
  address internal constant POOL_IMPL = 0x1685D81212580DD4cDA287616C2f6F4794927e18;

  // https://polygonscan.com/address/0x26db2B833021583566323E3b8985999981b9F1F3
  ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
    ILendingPoolConfigurator(0x26db2B833021583566323E3b8985999981b9F1F3);

  // https://polygonscan.com/address/0x56C8Aa7e4fCAbaaD5e87d6847D0901134939A13a
  address internal constant POOL_CONFIGURATOR_IMPL = 0x56C8Aa7e4fCAbaaD5e87d6847D0901134939A13a;

  // https://polygonscan.com/address/0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d
  IAaveOracle internal constant ORACLE = IAaveOracle(0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d);

  // https://polygonscan.com/address/0x17F73aEaD876CC4059089ff815EDA37052960dFB
  ILendingRateOracle internal constant LENDING_RATE_ORACLE =
    ILendingRateOracle(0x17F73aEaD876CC4059089ff815EDA37052960dFB);

  // https://polygonscan.com/address/0x7551b5D2763519d4e37e8B81929D336De671d46d
  IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IAaveProtocolDataProvider(0x7551b5D2763519d4e37e8B81929D336De671d46d);

  // https://polygonscan.com/address/0xAdDb96Fb6A795faf042DD25BD4710267C41D1F74
  address internal constant LENDING_POOL_COLLATERAL_MANAGER =
    0xAdDb96Fb6A795faf042DD25BD4710267C41D1F74;

  // https://polygonscan.com/address/0xDf7d0e6454DB638881302729F5ba99936EaAB233
  address internal constant POOL_ADMIN = 0xDf7d0e6454DB638881302729F5ba99936EaAB233;

  // https://polygonscan.com/address/0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6
  address internal constant EMERGENCY_ADMIN = 0xCb45E82419baeBCC9bA8b1e5c7858e48A3B26Ea6;

  // https://polygonscan.com/address/0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383
  ICollector internal constant COLLECTOR = ICollector(0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383);

  // https://polygonscan.com/address/0x357D51124f59836DeD84c8a1730D72B749d8BC23
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x357D51124f59836DeD84c8a1730D72B749d8BC23;

  // https://polygonscan.com/address/0x2bB25175d9B0F8965780209EB558Cc3b56cA6d32
  address internal constant EMISSION_MANAGER = 0x2bB25175d9B0F8965780209EB558Cc3b56cA6d32;

  // https://polygonscan.com/address/0x63dfa7c09Dc2Ff4030d6B8Dc2ce6262BF898C8A4
  address internal constant DEBT_SWAP_ADAPTER = 0x63dfa7c09Dc2Ff4030d6B8Dc2ce6262BF898C8A4;

  // https://polygonscan.com/address/0x9eCed0293e7B73CFf4a2b4F9C82aAc8346158bd9
  address internal constant CONFIG_ENGINE = 0x9eCed0293e7B73CFf4a2b4F9C82aAc8346158bd9;

  // https://polygonscan.com/address/0x3db487975aB1728DB5787b798866c2021B24ec52
  address internal constant MIGRATION_HELPER = 0x3db487975aB1728DB5787b798866c2021B24ec52;

  // https://polygonscan.com/address/0x3ac4e9aa29940770aeC38fe853a4bbabb2dA9C19
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x3ac4e9aa29940770aeC38fe853a4bbabb2dA9C19;

  // https://polygonscan.com/address/0xD05003a24A17d9117B11eC04cF9743b050779c08
  address internal constant RATES_FACTORY = 0xD05003a24A17d9117B11eC04cF9743b050779c08;

  // https://polygonscan.com/address/0x6D49dC81a1f07a6B1902DC79bc2D408cb9D555d1
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x6D49dC81a1f07a6B1902DC79bc2D408cb9D555d1;

  // https://polygonscan.com/address/0x35784a624D4FfBC3594f4d16fA3801FeF063241c
  address internal constant SWAP_COLLATERAL_ADAPTER = 0x35784a624D4FfBC3594f4d16fA3801FeF063241c;

  // https://polygonscan.com/address/0x645654D59A5226CBab969b1f5431aA47CBf64ab8
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x645654D59A5226CBab969b1f5431aA47CBf64ab8;

  // https://polygonscan.com/address/0x204f2Eb81D996729829debC819f7992DCEEfE7b1
  address internal constant UI_POOL_DATA_PROVIDER = 0x204f2Eb81D996729829debC819f7992DCEEfE7b1;

  // https://polygonscan.com/address/0x34aa032bC416Cf2CdC45c0C8f065b1F19463D43e
  address internal constant WALLET_BALANCE_PROVIDER = 0x34aa032bC416Cf2CdC45c0C8f065b1F19463D43e;

  // https://polygonscan.com/address/0xf1e6d4347105138B51E2bacA9A22fA228309ebB1
  address internal constant WETH_GATEWAY = 0xf1e6d4347105138B51E2bacA9A22fA228309ebB1;
}
library AaveV2PolygonAssets {
  // https://polygonscan.com/address/0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063
  address internal constant DAI_UNDERLYING = 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063;

  uint8 internal constant DAI_DECIMALS = 18;

  // https://polygonscan.com/address/0x27F8D03b3a2196956ED754baDc28D73be8830A6e
  address internal constant DAI_A_TOKEN = 0x27F8D03b3a2196956ED754baDc28D73be8830A6e;

  // https://polygonscan.com/address/0x75c4d1Fb84429023170086f06E682DcbBF537b7d
  address internal constant DAI_V_TOKEN = 0x75c4d1Fb84429023170086f06E682DcbBF537b7d;

  // https://polygonscan.com/address/0xC368bAB13A2b46D02c20c28AeBaB79bbE7E067AA
  address internal constant DAI_ORACLE = 0xC368bAB13A2b46D02c20c28AeBaB79bbE7E067AA;

  // https://polygonscan.com/address/0xDa6b70b725404A0c6bb116B1584fb88Eb7d7ED6d
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xDa6b70b725404A0c6bb116B1584fb88Eb7d7ED6d;

  // https://polygonscan.com/address/0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174
  address internal constant USDC_UNDERLYING = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://polygonscan.com/address/0x1a13F4Ca1d028320A707D99520AbFefca3998b7F
  address internal constant USDC_A_TOKEN = 0x1a13F4Ca1d028320A707D99520AbFefca3998b7F;

  // https://polygonscan.com/address/0x248960A9d75EdFa3de94F7193eae3161Eb349a12
  address internal constant USDC_V_TOKEN = 0x248960A9d75EdFa3de94F7193eae3161Eb349a12;

  // https://polygonscan.com/address/0xeAa310d63670b8C36699cE53E3e926b23355F3df
  address internal constant USDC_ORACLE = 0xeAa310d63670b8C36699cE53E3e926b23355F3df;

  // https://polygonscan.com/address/0x4309B0d719a0Dfb526EE9C0E58b77635B2971cC4
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x4309B0d719a0Dfb526EE9C0E58b77635B2971cC4;

  // https://polygonscan.com/address/0xc2132D05D31c914a87C6611C10748AEb04B58e8F
  address internal constant USDT_UNDERLYING = 0xc2132D05D31c914a87C6611C10748AEb04B58e8F;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://polygonscan.com/address/0x60D55F02A771d515e077c9C2403a1ef324885CeC
  address internal constant USDT_A_TOKEN = 0x60D55F02A771d515e077c9C2403a1ef324885CeC;

  // https://polygonscan.com/address/0x8038857FD47108A07d1f6Bf652ef1cBeC279A2f3
  address internal constant USDT_V_TOKEN = 0x8038857FD47108A07d1f6Bf652ef1cBeC279A2f3;

  // https://polygonscan.com/address/0xf44Fee6877F2f1a0b84c8bC49ff4Ec35DF089Ea0
  address internal constant USDT_ORACLE = 0xf44Fee6877F2f1a0b84c8bC49ff4Ec35DF089Ea0;

  // https://polygonscan.com/address/0xAb85FD7DCBFdD40e822321DAc4D5fD3cf08b2542
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0xAb85FD7DCBFdD40e822321DAc4D5fD3cf08b2542;

  // https://polygonscan.com/address/0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6
  address internal constant WBTC_UNDERLYING = 0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6;

  uint8 internal constant WBTC_DECIMALS = 8;

  // https://polygonscan.com/address/0x5c2ed810328349100A66B82b78a1791B101C9D61
  address internal constant WBTC_A_TOKEN = 0x5c2ed810328349100A66B82b78a1791B101C9D61;

  // https://polygonscan.com/address/0xF664F50631A6f0D72ecdaa0e49b0c019Fa72a8dC
  address internal constant WBTC_V_TOKEN = 0xF664F50631A6f0D72ecdaa0e49b0c019Fa72a8dC;

  // https://polygonscan.com/address/0xA338e0492B2F944E9F8C0653D3AD1484f2657a37
  address internal constant WBTC_ORACLE = 0xA338e0492B2F944E9F8C0653D3AD1484f2657a37;

  // https://polygonscan.com/address/0x3465528BE493a61629234C259b62b9539817d8e7
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x3465528BE493a61629234C259b62b9539817d8e7;

  // https://polygonscan.com/address/0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619
  address internal constant WETH_UNDERLYING = 0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://polygonscan.com/address/0x28424507fefb6f7f8E9D3860F56504E4e5f5f390
  address internal constant WETH_A_TOKEN = 0x28424507fefb6f7f8E9D3860F56504E4e5f5f390;

  // https://polygonscan.com/address/0xeDe17e9d79fc6f9fF9250D9EEfbdB88Cc18038b5
  address internal constant WETH_V_TOKEN = 0xeDe17e9d79fc6f9fF9250D9EEfbdB88Cc18038b5;

  // https://polygonscan.com/address/0xd141820D89840C9A3b0AE46c041D70B98F15928F
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xd141820D89840C9A3b0AE46c041D70B98F15928F;

  // https://polygonscan.com/address/0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270
  address internal constant WPOL_UNDERLYING = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;

  uint8 internal constant WPOL_DECIMALS = 18;

  // https://polygonscan.com/address/0x8dF3aad3a84da6b69A4DA8aeC3eA40d9091B2Ac4
  address internal constant WPOL_A_TOKEN = 0x8dF3aad3a84da6b69A4DA8aeC3eA40d9091B2Ac4;

  // https://polygonscan.com/address/0x59e8E9100cbfCBCBAdf86b9279fa61526bBB8765
  address internal constant WPOL_V_TOKEN = 0x59e8E9100cbfCBCBAdf86b9279fa61526bBB8765;

  // https://polygonscan.com/address/0x327e23A4855b6F663a28c5161541d69Af8973302
  address internal constant WPOL_ORACLE = 0x327e23A4855b6F663a28c5161541d69Af8973302;

  // https://polygonscan.com/address/0xAF5917cFc2F376eCD6c4df91C9AC5965Beaf5AfA
  address internal constant WPOL_INTEREST_RATE_STRATEGY =
    0xAF5917cFc2F376eCD6c4df91C9AC5965Beaf5AfA;

  // https://polygonscan.com/address/0xD6DF932A45C0f255f85145f286eA0b292B21C90B
  address internal constant AAVE_UNDERLYING = 0xD6DF932A45C0f255f85145f286eA0b292B21C90B;

  uint8 internal constant AAVE_DECIMALS = 18;

  // https://polygonscan.com/address/0x1d2a0E5EC8E5bBDCA5CB219e649B565d8e5c3360
  address internal constant AAVE_A_TOKEN = 0x1d2a0E5EC8E5bBDCA5CB219e649B565d8e5c3360;

  // https://polygonscan.com/address/0x1c313e9d0d826662F5CE692134D938656F681350
  address internal constant AAVE_V_TOKEN = 0x1c313e9d0d826662F5CE692134D938656F681350;

  // https://polygonscan.com/address/0xbE23a3AA13038CfC28aFd0ECe4FdE379fE7fBfc4
  address internal constant AAVE_ORACLE = 0xbE23a3AA13038CfC28aFd0ECe4FdE379fE7fBfc4;

  // https://polygonscan.com/address/0xae9b3Eb616ed753dcE96C75B6AE30A60Ff9290B4
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0xae9b3Eb616ed753dcE96C75B6AE30A60Ff9290B4;

  // https://polygonscan.com/address/0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7
  address internal constant GHST_UNDERLYING = 0x385Eeac5cB85A38A9a07A70c73e0a3271CfB54A7;

  uint8 internal constant GHST_DECIMALS = 18;

  // https://polygonscan.com/address/0x080b5BF8f360F624628E0fb961F4e67c9e3c7CF1
  address internal constant GHST_A_TOKEN = 0x080b5BF8f360F624628E0fb961F4e67c9e3c7CF1;

  // https://polygonscan.com/address/0x36e988a38542C3482013Bb54ee46aC1fb1efedcd
  address internal constant GHST_V_TOKEN = 0x36e988a38542C3482013Bb54ee46aC1fb1efedcd;

  // https://polygonscan.com/address/0xe638249AF9642CdA55A92245525268482eE4C67b
  address internal constant GHST_ORACLE = 0xe638249AF9642CdA55A92245525268482eE4C67b;

  // https://polygonscan.com/address/0xfe72F0c532c4E7cfA65FCbd3B92D926d26Fb73a9
  address internal constant GHST_INTEREST_RATE_STRATEGY =
    0xfe72F0c532c4E7cfA65FCbd3B92D926d26Fb73a9;

  // https://polygonscan.com/address/0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3
  address internal constant BAL_UNDERLYING = 0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3;

  uint8 internal constant BAL_DECIMALS = 18;

  // https://polygonscan.com/address/0xc4195D4060DaEac44058Ed668AA5EfEc50D77ff6
  address internal constant BAL_A_TOKEN = 0xc4195D4060DaEac44058Ed668AA5EfEc50D77ff6;

  // https://polygonscan.com/address/0x773E0e32e7b6a00b7cA9daa85dfba9D61B7f2574
  address internal constant BAL_V_TOKEN = 0x773E0e32e7b6a00b7cA9daa85dfba9D61B7f2574;

  // https://polygonscan.com/address/0x03CD157746c61F44597dD54C6f6702105258C722
  address internal constant BAL_ORACLE = 0x03CD157746c61F44597dD54C6f6702105258C722;

  // https://polygonscan.com/address/0xA78F3bc07035422f6f69c3f2B72fcCd0487348FA
  address internal constant BAL_INTEREST_RATE_STRATEGY = 0xA78F3bc07035422f6f69c3f2B72fcCd0487348FA;

  // https://polygonscan.com/address/0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369
  address internal constant DPI_UNDERLYING = 0x85955046DF4668e1DD369D2DE9f3AEB98DD2A369;

  uint8 internal constant DPI_DECIMALS = 18;

  // https://polygonscan.com/address/0x81fB82aAcB4aBE262fc57F06fD4c1d2De347D7B1
  address internal constant DPI_A_TOKEN = 0x81fB82aAcB4aBE262fc57F06fD4c1d2De347D7B1;

  // https://polygonscan.com/address/0x43150AA0B7e19293D935A412C8607f9172d3d3f3
  address internal constant DPI_V_TOKEN = 0x43150AA0B7e19293D935A412C8607f9172d3d3f3;

  // https://polygonscan.com/address/0xC70aAF9092De3a4E5000956E672cDf5E996B4610
  address internal constant DPI_ORACLE = 0xC70aAF9092De3a4E5000956E672cDf5E996B4610;

  // https://polygonscan.com/address/0x6405F880E431403588e92b241Ca15603047ef8a4
  address internal constant DPI_INTEREST_RATE_STRATEGY = 0x6405F880E431403588e92b241Ca15603047ef8a4;

  // https://polygonscan.com/address/0x172370d5Cd63279eFa6d502DAB29171933a610AF
  address internal constant CRV_UNDERLYING = 0x172370d5Cd63279eFa6d502DAB29171933a610AF;

  uint8 internal constant CRV_DECIMALS = 18;

  // https://polygonscan.com/address/0x3Df8f92b7E798820ddcCA2EBEA7BAbda2c90c4aD
  address internal constant CRV_A_TOKEN = 0x3Df8f92b7E798820ddcCA2EBEA7BAbda2c90c4aD;

  // https://polygonscan.com/address/0x780BbcBCda2cdb0d2c61fd9BC68c9046B18f3229
  address internal constant CRV_V_TOKEN = 0x780BbcBCda2cdb0d2c61fd9BC68c9046B18f3229;

  // https://polygonscan.com/address/0x1CF68C76803c9A415bE301f50E82e44c64B7F1D4
  address internal constant CRV_ORACLE = 0x1CF68C76803c9A415bE301f50E82e44c64B7F1D4;

  // https://polygonscan.com/address/0xe80CDBb7115004064BDD62aEe89666d6b4B75921
  address internal constant CRV_INTEREST_RATE_STRATEGY = 0xe80CDBb7115004064BDD62aEe89666d6b4B75921;

  // https://polygonscan.com/address/0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a
  address internal constant SUSHI_UNDERLYING = 0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a;

  uint8 internal constant SUSHI_DECIMALS = 18;

  // https://polygonscan.com/address/0x21eC9431B5B55c5339Eb1AE7582763087F98FAc2
  address internal constant SUSHI_A_TOKEN = 0x21eC9431B5B55c5339Eb1AE7582763087F98FAc2;

  // https://polygonscan.com/address/0x9CB9fEaFA73bF392C905eEbf5669ad3d073c3DFC
  address internal constant SUSHI_V_TOKEN = 0x9CB9fEaFA73bF392C905eEbf5669ad3d073c3DFC;

  // https://polygonscan.com/address/0x17414Eb5159A082e8d41D243C1601c2944401431
  address internal constant SUSHI_ORACLE = 0x17414Eb5159A082e8d41D243C1601c2944401431;

  // https://polygonscan.com/address/0x835699Bf98f6a7fDe5713c42c118Fb80fA059737
  address internal constant SUSHI_INTEREST_RATE_STRATEGY =
    0x835699Bf98f6a7fDe5713c42c118Fb80fA059737;

  // https://polygonscan.com/address/0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39
  address internal constant LINK_UNDERLYING = 0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39;

  uint8 internal constant LINK_DECIMALS = 18;

  // https://polygonscan.com/address/0x0Ca2e42e8c21954af73Bc9af1213E4e81D6a669A
  address internal constant LINK_A_TOKEN = 0x0Ca2e42e8c21954af73Bc9af1213E4e81D6a669A;

  // https://polygonscan.com/address/0xCC71e4A38c974e19bdBC6C0C19b63b8520b1Bb09
  address internal constant LINK_V_TOKEN = 0xCC71e4A38c974e19bdBC6C0C19b63b8520b1Bb09;

  // https://polygonscan.com/address/0xb77fa460604b9C6435A235D057F7D319AC83cb53
  address internal constant LINK_ORACLE = 0xb77fa460604b9C6435A235D057F7D319AC83cb53;

  // https://polygonscan.com/address/0x01576c429baB8724A11bef844dDa95165D899Fca
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x01576c429baB8724A11bef844dDa95165D899Fca;
}
