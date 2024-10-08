// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3Avalanche {
  // https://snowtrace.io/address/0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb);

  // https://snowtrace.io/address/0x794a61358D6845594F94dc1DB02A252b5b4814aD
  IPool internal constant POOL = IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

  // https://snowtrace.io/address/0x1f69d4700B34A1D9F92E55235df414FcC02A8306
  address internal constant POOL_IMPL = 0x1f69d4700B34A1D9F92E55235df414FcC02A8306;

  // https://snowtrace.io/address/0x8145eddDf43f50276641b55bd3AD95944510021E
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

  // https://snowtrace.io/address/0x4816b2C2895f97fB918f1aE7Da403750a0eE372e
  address internal constant POOL_CONFIGURATOR_IMPL = 0x4816b2C2895f97fB918f1aE7Da403750a0eE372e;

  // https://snowtrace.io/address/0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C
  IAaveOracle internal constant ORACLE = IAaveOracle(0xEBd36016B3eD09D4693Ed4251c67Bd858c3c7C9C);

  // https://snowtrace.io/address/0x7F23D86Ee20D869112572136221e173428DD740B
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x7F23D86Ee20D869112572136221e173428DD740B);

  // https://snowtrace.io/address/0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xa72636CbcAa8F5FF95B2cc47F3CDEe83F3294a0B);

  // https://snowtrace.io/address/0x3C06dce358add17aAf230f2234bCCC4afd50d090
  address internal constant ACL_ADMIN = 0x3C06dce358add17aAf230f2234bCCC4afd50d090;

  // https://snowtrace.io/address/0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0
  ICollector internal constant COLLECTOR = ICollector(0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0);

  // https://snowtrace.io/address/0x929EC64c34a17401F460460D4B9390518E5B473e
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x929EC64c34a17401F460460D4B9390518E5B473e;

  // https://snowtrace.io/address/0x1E81af09001aD208BDa68FF022544dB2102A752d
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_2 = 0x1E81af09001aD208BDa68FF022544dB2102A752d;

  // https://snowtrace.io/address/0xa0d9C1E9E48Ca30c8d8C3B5D69FF5dc1f6DFfC24
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_2 =
    0xa0d9C1E9E48Ca30c8d8C3B5D69FF5dc1f6DFfC24;

  // https://snowtrace.io/address/0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73
  address internal constant EMISSION_MANAGER = 0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;

  // https://snowtrace.io/address/0xD2C92b5A793e196aB11dBefBe3Af6BddeD6c3DD5
  address internal constant CAPS_PLUS_RISK_STEWARD = 0xD2C92b5A793e196aB11dBefBe3Af6BddeD6c3DD5;

  // https://snowtrace.io/address/0x5d7e9a32E0c3db609089186bEBC4B9d8Eb86ad2c
  address internal constant RISK_STEWARD = 0x5d7e9a32E0c3db609089186bEBC4B9d8Eb86ad2c;

  // https://snowtrace.io/address/0x6d4F341d8Bb3Dc5ABe822Aa940F1884508C13f99
  address internal constant FREEZING_STEWARD = 0x6d4F341d8Bb3Dc5ABe822Aa940F1884508C13f99;

  // https://snowtrace.io/address/0xE28E2c8d240dd5eBd0adcab86fbD79df7a052034
  address internal constant DEBT_SWAP_ADAPTER = 0xE28E2c8d240dd5eBd0adcab86fbD79df7a052034;

  // https://snowtrace.io/address/0x5fF5c392C5D397926364789E22f74043f7E42f2b
  address internal constant CONFIG_ENGINE = 0x5fF5c392C5D397926364789E22f74043f7E42f2b;

  // https://snowtrace.io/address/0x770ef9f4fe897e59daCc474EF11238303F9552b6
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x770ef9f4fe897e59daCc474EF11238303F9552b6;

  // https://snowtrace.io/address/0xab22988D93d5F942fC6B6c6Ea285744809D1d9Cc
  address internal constant PROOF_OF_RESERVE = 0xab22988D93d5F942fC6B6c6Ea285744809D1d9Cc;

  // https://snowtrace.io/address/0x80f2c02224a2E548FC67c0bF705eBFA825dd5439
  address internal constant PROOF_OF_RESERVE_AGGREGATOR =
    0x80f2c02224a2E548FC67c0bF705eBFA825dd5439;

  // https://snowtrace.io/address/0x5d4D4007A4c6336550DdAa2a7c0d5e7972eebd16
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x5d4D4007A4c6336550DdAa2a7c0d5e7972eebd16;

  // https://snowtrace.io/address/0x691C316b2Eec7e64d17e7E3E01f3dB44c9CcEf19
  address internal constant STATIC_A_TOKEN_FACTORY = 0x691C316b2Eec7e64d17e7E3E01f3dB44c9CcEf19;

  // https://snowtrace.io/address/0x2Cf641F7C0eac2788A7924B82d6Ca8EB7bAa4E3A
  address internal constant SWAP_COLLATERAL_ADAPTER = 0x2Cf641F7C0eac2788A7924B82d6Ca8EB7bAa4E3A;

  // https://snowtrace.io/address/0x265d414f80b0fca9505710e6F16dB4b67555D365
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x265d414f80b0fca9505710e6F16dB4b67555D365;

  // https://snowtrace.io/address/0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9
  address internal constant UI_POOL_DATA_PROVIDER = 0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9;

  // https://snowtrace.io/address/0xBc790382B3686abffE4be14A030A96aC6154023a
  address internal constant WALLET_BALANCE_PROVIDER = 0xBc790382B3686abffE4be14A030A96aC6154023a;

  // https://snowtrace.io/address/0xCf3045a03F83ADfBCbA1f19Cb2cF4E19075F8668
  address internal constant WETH_GATEWAY = 0xCf3045a03F83ADfBCbA1f19Cb2cF4E19075F8668;

  // https://snowtrace.io/address/0x78F8Bd884C3D738B74B420540659c82f392820e0
  address internal constant WITHDRAW_SWAP_ADAPTER = 0x78F8Bd884C3D738B74B420540659c82f392820e0;
}

library AaveV3AvalancheAssets {
  // https://snowtrace.io/address/0xd586E7F844cEa2F87f50152665BCbc2C279D8d70
  address internal constant DAIe_UNDERLYING = 0xd586E7F844cEa2F87f50152665BCbc2C279D8d70;

  uint8 internal constant DAIe_DECIMALS = 18;

  // https://snowtrace.io/address/0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE
  address internal constant DAIe_A_TOKEN = 0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE;

  // https://snowtrace.io/address/0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC
  address internal constant DAIe_V_TOKEN = 0x8619d80FB0141ba7F184CbF22fd724116D9f7ffC;

  // https://snowtrace.io/address/0xf82da795727633aFA9BB0f1B08A87c0F6A38723f
  address internal constant DAIe_ORACLE = 0xf82da795727633aFA9BB0f1B08A87c0F6A38723f;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant DAIe_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x02F3f6c8A432C1e49f3359d7d36887C25d8A5888
  address internal constant DAIe_STATIC_A_TOKEN = 0x02F3f6c8A432C1e49f3359d7d36887C25d8A5888;

  // https://snowtrace.io/address/0x5947BB275c521040051D82396192181b413227A3
  address internal constant LINKe_UNDERLYING = 0x5947BB275c521040051D82396192181b413227A3;

  uint8 internal constant LINKe_DECIMALS = 18;

  // https://snowtrace.io/address/0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530
  address internal constant LINKe_A_TOKEN = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;

  // https://snowtrace.io/address/0x953A573793604aF8d41F306FEb8274190dB4aE0e
  address internal constant LINKe_V_TOKEN = 0x953A573793604aF8d41F306FEb8274190dB4aE0e;

  // https://snowtrace.io/address/0x49ccd9ca821EfEab2b98c60dC60F518E765EDe9a
  address internal constant LINKe_ORACLE = 0x49ccd9ca821EfEab2b98c60dC60F518E765EDe9a;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant LINKe_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x8B773Ab77Dff01985D438961dBCE58382a70cA52
  address internal constant LINKe_STATIC_A_TOKEN = 0x8B773Ab77Dff01985D438961dBCE58382a70cA52;

  // https://snowtrace.io/address/0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E
  address internal constant USDC_UNDERLYING = 0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://snowtrace.io/address/0x625E7708f30cA75bfd92586e17077590C60eb4cD
  address internal constant USDC_A_TOKEN = 0x625E7708f30cA75bfd92586e17077590C60eb4cD;

  // https://snowtrace.io/address/0xFCCf3cAbbe80101232d343252614b6A3eE81C989
  address internal constant USDC_V_TOKEN = 0xFCCf3cAbbe80101232d343252614b6A3eE81C989;

  // https://snowtrace.io/address/0xD8277249e871BE9A402fa286C2C5ec16046dC512
  address internal constant USDC_ORACLE = 0xD8277249e871BE9A402fa286C2C5ec16046dC512;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0xC509aB7bB4eDbF193b82264D499a7Fc526Cd01F4
  address internal constant USDC_STATIC_A_TOKEN = 0xC509aB7bB4eDbF193b82264D499a7Fc526Cd01F4;

  // https://snowtrace.io/address/0x50b7545627a5162F82A992c33b87aDc75187B218
  address internal constant WBTCe_UNDERLYING = 0x50b7545627a5162F82A992c33b87aDc75187B218;

  uint8 internal constant WBTCe_DECIMALS = 8;

  // https://snowtrace.io/address/0x078f358208685046a11C85e8ad32895DED33A249
  address internal constant WBTCe_A_TOKEN = 0x078f358208685046a11C85e8ad32895DED33A249;

  // https://snowtrace.io/address/0x92b42c66840C7AD907b4BF74879FF3eF7c529473
  address internal constant WBTCe_V_TOKEN = 0x92b42c66840C7AD907b4BF74879FF3eF7c529473;

  // https://snowtrace.io/address/0x2779D32d5166BAaa2B2b658333bA7e6Ec0C65743
  address internal constant WBTCe_ORACLE = 0x2779D32d5166BAaa2B2b658333bA7e6Ec0C65743;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant WBTCe_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0xE3C0f42EAF1a4BFe37CbA105e5463564BA7730aE
  address internal constant WBTCe_STATIC_A_TOKEN = 0xE3C0f42EAF1a4BFe37CbA105e5463564BA7730aE;

  // https://snowtrace.io/address/0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB
  address internal constant WETHe_UNDERLYING = 0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB;

  uint8 internal constant WETHe_DECIMALS = 18;

  // https://snowtrace.io/address/0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8
  address internal constant WETHe_A_TOKEN = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;

  // https://snowtrace.io/address/0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351
  address internal constant WETHe_V_TOKEN = 0x0c84331e39d6658Cd6e6b9ba04736cC4c4734351;

  // https://snowtrace.io/address/0x976B3D034E162d8bD72D6b9C989d545b839003b0
  address internal constant WETHe_ORACLE = 0x976B3D034E162d8bD72D6b9C989d545b839003b0;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant WETHe_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0xf8E24175D01653fd6AA203C2C17B1e4Dd1CA2731
  address internal constant WETHe_STATIC_A_TOKEN = 0xf8E24175D01653fd6AA203C2C17B1e4Dd1CA2731;

  // https://snowtrace.io/address/0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7
  address internal constant USDt_UNDERLYING = 0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7;

  uint8 internal constant USDt_DECIMALS = 6;

  // https://snowtrace.io/address/0x6ab707Aca953eDAeFBc4fD23bA73294241490620
  address internal constant USDt_A_TOKEN = 0x6ab707Aca953eDAeFBc4fD23bA73294241490620;

  // https://snowtrace.io/address/0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7
  address internal constant USDt_V_TOKEN = 0xfb00AC187a8Eb5AFAE4eACE434F493Eb62672df7;

  // https://snowtrace.io/address/0x39185f2236A6022b682e8BB93C040d125DA093CF
  address internal constant USDt_ORACLE = 0x39185f2236A6022b682e8BB93C040d125DA093CF;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant USDt_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x5525Ee69BC1e354B356864187De486fab5AD67d7
  address internal constant USDt_STATIC_A_TOKEN = 0x5525Ee69BC1e354B356864187De486fab5AD67d7;

  // https://snowtrace.io/address/0x63a72806098Bd3D9520cC43356dD78afe5D386D9
  address internal constant AAVEe_UNDERLYING = 0x63a72806098Bd3D9520cC43356dD78afe5D386D9;

  uint8 internal constant AAVEe_DECIMALS = 18;

  // https://snowtrace.io/address/0xf329e36C7bF6E5E86ce2150875a84Ce77f477375
  address internal constant AAVEe_A_TOKEN = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;

  // https://snowtrace.io/address/0xE80761Ea617F66F96274eA5e8c37f03960ecC679
  address internal constant AAVEe_V_TOKEN = 0xE80761Ea617F66F96274eA5e8c37f03960ecC679;

  // https://snowtrace.io/address/0x3CA13391E9fb38a75330fb28f8cc2eB3D9ceceED
  address internal constant AAVEe_ORACLE = 0x3CA13391E9fb38a75330fb28f8cc2eB3D9ceceED;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant AAVEe_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0xac0746AfD13DEbe2a43a6c8745Fb83Fd2A2909cA
  address internal constant AAVEe_STATIC_A_TOKEN = 0xac0746AfD13DEbe2a43a6c8745Fb83Fd2A2909cA;

  // https://snowtrace.io/address/0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7
  address internal constant WAVAX_UNDERLYING = 0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7;

  uint8 internal constant WAVAX_DECIMALS = 18;

  // https://snowtrace.io/address/0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97
  address internal constant WAVAX_A_TOKEN = 0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97;

  // https://snowtrace.io/address/0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8
  address internal constant WAVAX_V_TOKEN = 0x4a1c3aD6Ed28a636ee1751C69071f6be75DEb8B8;

  // https://snowtrace.io/address/0x0A77230d17318075983913bC2145DB16C7366156
  address internal constant WAVAX_ORACLE = 0x0A77230d17318075983913bC2145DB16C7366156;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant WAVAX_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x6A02C7a974F1F13A67980C80F774eC1d2eD8f98d
  address internal constant WAVAX_STATIC_A_TOKEN = 0x6A02C7a974F1F13A67980C80F774eC1d2eD8f98d;

  // https://snowtrace.io/address/0x2b2C81e08f1Af8835a78Bb2A90AE924ACE0eA4bE
  address internal constant sAVAX_UNDERLYING = 0x2b2C81e08f1Af8835a78Bb2A90AE924ACE0eA4bE;

  uint8 internal constant sAVAX_DECIMALS = 18;

  // https://snowtrace.io/address/0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf
  address internal constant sAVAX_A_TOKEN = 0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf;

  // https://snowtrace.io/address/0x77CA01483f379E58174739308945f044e1a764dc
  address internal constant sAVAX_V_TOKEN = 0x77CA01483f379E58174739308945f044e1a764dc;

  // https://snowtrace.io/address/0xB2B332f27e4B7305649a228C31Ed9858c5a6bAD9
  address internal constant sAVAX_ORACLE = 0xB2B332f27e4B7305649a228C31Ed9858c5a6bAD9;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant sAVAX_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x4F059cA8a2a5BF8895Ee731f2E901cCB769FB95f
  address internal constant sAVAX_STATIC_A_TOKEN = 0x4F059cA8a2a5BF8895Ee731f2E901cCB769FB95f;

  // https://snowtrace.io/address/0xD24C2Ad096400B6FBcd2ad8B24E7acBc21A1da64
  address internal constant FRAX_UNDERLYING = 0xD24C2Ad096400B6FBcd2ad8B24E7acBc21A1da64;

  uint8 internal constant FRAX_DECIMALS = 18;

  // https://snowtrace.io/address/0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA
  address internal constant FRAX_A_TOKEN = 0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA;

  // https://snowtrace.io/address/0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907
  address internal constant FRAX_V_TOKEN = 0x34e2eD44EF7466D5f9E0b782B5c08b57475e7907;

  // https://snowtrace.io/address/0x6208576378D06ce69A27987b7A524A9B15d499a4
  address internal constant FRAX_ORACLE = 0x6208576378D06ce69A27987b7A524A9B15d499a4;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant FRAX_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0xA3c2ffE702F4cD265B2249AB5f84Fab81FFf6c73
  address internal constant FRAX_STATIC_A_TOKEN = 0xA3c2ffE702F4cD265B2249AB5f84Fab81FFf6c73;

  // https://snowtrace.io/address/0x5c49b268c9841AFF1Cc3B0a418ff5c3442eE3F3b
  address internal constant MAI_UNDERLYING = 0x5c49b268c9841AFF1Cc3B0a418ff5c3442eE3F3b;

  uint8 internal constant MAI_DECIMALS = 18;

  // https://snowtrace.io/address/0x8Eb270e296023E9D92081fdF967dDd7878724424
  address internal constant MAI_A_TOKEN = 0x8Eb270e296023E9D92081fdF967dDd7878724424;

  // https://snowtrace.io/address/0xCE186F6Cccb0c955445bb9d10C59caE488Fea559
  address internal constant MAI_V_TOKEN = 0xCE186F6Cccb0c955445bb9d10C59caE488Fea559;

  // https://snowtrace.io/address/0xCcC55Db26B78a19Dba1beE0066F9c1665575439A
  address internal constant MAI_ORACLE = 0xCcC55Db26B78a19Dba1beE0066F9c1665575439A;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant MAI_INTEREST_RATE_STRATEGY = 0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x08cC59E51BB0Bc322B4D251f7262dB864d6150ce
  address internal constant MAI_STATIC_A_TOKEN = 0x08cC59E51BB0Bc322B4D251f7262dB864d6150ce;

  // https://snowtrace.io/address/0x152b9d0FdC40C096757F570A51E494bd4b943E50
  address internal constant BTCb_UNDERLYING = 0x152b9d0FdC40C096757F570A51E494bd4b943E50;

  uint8 internal constant BTCb_DECIMALS = 8;

  // https://snowtrace.io/address/0x8ffDf2DE812095b1D19CB146E4c004587C0A0692
  address internal constant BTCb_A_TOKEN = 0x8ffDf2DE812095b1D19CB146E4c004587C0A0692;

  // https://snowtrace.io/address/0xA8669021776Bc142DfcA87c21b4A52595bCbB40a
  address internal constant BTCb_V_TOKEN = 0xA8669021776Bc142DfcA87c21b4A52595bCbB40a;

  // https://snowtrace.io/address/0x2779D32d5166BAaa2B2b658333bA7e6Ec0C65743
  address internal constant BTCb_ORACLE = 0x2779D32d5166BAaa2B2b658333bA7e6Ec0C65743;

  // https://snowtrace.io/address/0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da
  address internal constant BTCb_INTEREST_RATE_STRATEGY =
    0xCe1C5509f2f4d755aA64B8D135B15ec6F12a93da;

  // https://snowtrace.io/address/0x34d768cc830c32DcD743321c09A2A702651bF9a2
  address internal constant BTCb_STATIC_A_TOKEN = 0x34d768cc830c32DcD743321c09A2A702651bF9a2;
}

library AaveV3AvalancheEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant STABLECOINS = 1;

  uint8 internal constant AVAX_CORRELATED = 2;
}

library AaveV3AvalancheExternalLibraries {
  // https://snowtrace.io/address/0xb32381feFFF45eE9F47fD2f2cF83C832637d6EF0
  address internal constant FLASHLOAN_LOGIC = 0xb32381feFFF45eE9F47fD2f2cF83C832637d6EF0;

  // https://snowtrace.io/address/0x4c52FE2162200bf26c314d7bbd8611699139d553
  address internal constant BORROW_LOGIC = 0x4c52FE2162200bf26c314d7bbd8611699139d553;

  // https://snowtrace.io/address/0x97dCbFaE5372A63128F141E8C0BC2c871Ca5F604
  address internal constant BRIDGE_LOGIC = 0x97dCbFaE5372A63128F141E8C0BC2c871Ca5F604;

  // https://snowtrace.io/address/0x88F864670De467aA73CD45325F9652C578C8AB85
  address internal constant E_MODE_LOGIC = 0x88F864670De467aA73CD45325F9652C578C8AB85;

  // https://snowtrace.io/address/0x80d16970B31243Fe67DaB028115f3E4c3E3510Ad
  address internal constant LIQUIDATION_LOGIC = 0x80d16970B31243Fe67DaB028115f3E4c3E3510Ad;

  // https://snowtrace.io/address/0xA58FB47bE9074828215A173564C0CD10f6F249bf
  address internal constant POOL_LOGIC = 0xA58FB47bE9074828215A173564C0CD10f6F249bf;

  // https://snowtrace.io/address/0x2b22E425C1322fbA0DbF17bb1dA25d71811EE7ba
  address internal constant SUPPLY_LOGIC = 0x2b22E425C1322fbA0DbF17bb1dA25d71811EE7ba;
}
