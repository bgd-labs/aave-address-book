// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, ILendingRateOracle} from './AaveV2.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV2Avalanche {
  // https://snowtrace.io/address/0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
  ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    ILendingPoolAddressesProvider(0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f);

  // https://snowtrace.io/address/0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C
  ILendingPool internal constant POOL = ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C);

  // https://snowtrace.io/address/0x102Bf2C03c1901AdBA191457A8c4A4eF18b40029
  address internal constant POOL_IMPL = 0x102Bf2C03c1901AdBA191457A8c4A4eF18b40029;

  // https://snowtrace.io/address/0x230B618aD4C475393A7239aE03630042281BD86e
  ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
    ILendingPoolConfigurator(0x230B618aD4C475393A7239aE03630042281BD86e);

  // https://snowtrace.io/address/0x3616f776F2b5fAd02F2478DFd4822Fc70d24399E
  address internal constant POOL_CONFIGURATOR_IMPL = 0x3616f776F2b5fAd02F2478DFd4822Fc70d24399E;

  // https://snowtrace.io/address/0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89
  IAaveOracle internal constant ORACLE = IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89);

  // https://snowtrace.io/address/0xc34254642B504484465F38Cb1CC396d45a9c7c80
  ILendingRateOracle internal constant LENDING_RATE_ORACLE =
    ILendingRateOracle(0xc34254642B504484465F38Cb1CC396d45a9c7c80);

  // https://snowtrace.io/address/0x65285E9dfab318f57051ab2b139ccCf232945451
  IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IAaveProtocolDataProvider(0x65285E9dfab318f57051ab2b139ccCf232945451);

  // https://snowtrace.io/address/0x69A45013F047A65422deFdD0C43f09530D7025c0
  address internal constant LENDING_POOL_COLLATERAL_MANAGER =
    0x69A45013F047A65422deFdD0C43f09530D7025c0;

  // https://snowtrace.io/address/0x3C06dce358add17aAf230f2234bCCC4afd50d090
  address internal constant POOL_ADMIN = 0x3C06dce358add17aAf230f2234bCCC4afd50d090;

  // https://snowtrace.io/address/0x56C1a4b54921DEA9A344967a8693C7E661D72968
  address internal constant EMERGENCY_ADMIN = 0x56C1a4b54921DEA9A344967a8693C7E661D72968;

  // https://snowtrace.io/address/0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0
  ICollector internal constant COLLECTOR = ICollector(0x5ba7fd868c40c16f7aDfAe6CF87121E13FC2F7a0);

  // https://snowtrace.io/address/0x01D83Fe6A10D2f2B7AF17034343746188272cAc9
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x01D83Fe6A10D2f2B7AF17034343746188272cAc9;

  // https://snowtrace.io/address/0x5CfCd7E6D055Ba4f7B998914336254aDE3F69f26
  address internal constant EMISSION_MANAGER = 0x5CfCd7E6D055Ba4f7B998914336254aDE3F69f26;

  // https://snowtrace.io/address/0x63dfa7c09Dc2Ff4030d6B8Dc2ce6262BF898C8A4
  address internal constant DEBT_SWAP_ADAPTER = 0x63dfa7c09Dc2Ff4030d6B8Dc2ce6262BF898C8A4;

  // https://snowtrace.io/address/0x7902F3c60f05b5A6b7e4Ce0Cac11Cb17bC8e607c
  address internal constant CONFIG_ENGINE = 0x7902F3c60f05b5A6b7e4Ce0Cac11Cb17bC8e607c;

  // https://snowtrace.io/address/0xf50a080aC535e531EC33cC05b227E910De2fb1fA
  address internal constant MIGRATION_HELPER = 0xf50a080aC535e531EC33cC05b227E910De2fb1fA;

  // https://snowtrace.io/address/0x4235E22d9C3f28DCDA82b58276cb6370B01265C2
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x4235E22d9C3f28DCDA82b58276cb6370B01265C2;

  // https://snowtrace.io/address/0x7fc3FCb14eF04A48Bb0c12f0c39CD74C249c37d8
  address internal constant PROOF_OF_RESERVE = 0x7fc3FCb14eF04A48Bb0c12f0c39CD74C249c37d8;

  // https://snowtrace.io/address/0x80f2c02224a2E548FC67c0bF705eBFA825dd5439
  address internal constant PROOF_OF_RESERVE_AGGREGATOR =
    0x80f2c02224a2E548FC67c0bF705eBFA825dd5439;

  // https://snowtrace.io/address/0x6e66E50870A93691C1b953788A3219e01fDdeDD7
  address internal constant RATES_FACTORY = 0x6e66E50870A93691C1b953788A3219e01fDdeDD7;

  // https://snowtrace.io/address/0x935b362EE3E1f342cc48118C528AAbee5118F6e6
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x935b362EE3E1f342cc48118C528AAbee5118F6e6;

  // https://snowtrace.io/address/0x2EcF2a2e74B19Aab2a62312167aFF4B78E93B6C5
  address internal constant SWAP_COLLATERAL_ADAPTER = 0x2EcF2a2e74B19Aab2a62312167aFF4B78E93B6C5;

  // https://snowtrace.io/address/0x11979886A6dBAE27D7a72c49fCF3F23240D647bF
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x11979886A6dBAE27D7a72c49fCF3F23240D647bF;

  // https://snowtrace.io/address/0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A
  address internal constant UI_POOL_DATA_PROVIDER = 0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A;

  // https://snowtrace.io/address/0x73e4898a1Bfa9f710B6A6AB516403A6299e01fc6
  address internal constant WALLET_BALANCE_PROVIDER = 0x73e4898a1Bfa9f710B6A6AB516403A6299e01fc6;

  // https://snowtrace.io/address/0x68c815cB8C8390bc3F2CE99265044dEC9D350C49
  address internal constant WETH_GATEWAY = 0x68c815cB8C8390bc3F2CE99265044dEC9D350C49;
}

library AaveV2AvalancheAssets {
  // https://snowtrace.io/address/0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB
  address internal constant WETHe_UNDERLYING = 0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB;

  uint8 internal constant WETHe_DECIMALS = 18;

  // https://snowtrace.io/address/0x53f7c5869a859F0AeC3D334ee8B4Cf01E3492f21
  address internal constant WETHe_A_TOKEN = 0x53f7c5869a859F0AeC3D334ee8B4Cf01E3492f21;

  // https://snowtrace.io/address/0x4e575CacB37bc1b5afEc68a0462c4165A5268983
  address internal constant WETHe_V_TOKEN = 0x4e575CacB37bc1b5afEc68a0462c4165A5268983;

  // https://snowtrace.io/address/0x976B3D034E162d8bD72D6b9C989d545b839003b0
  address internal constant WETHe_ORACLE = 0x976B3D034E162d8bD72D6b9C989d545b839003b0;

  // https://snowtrace.io/address/0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647
  address internal constant WETHe_INTEREST_RATE_STRATEGY =
    0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647;

  // https://snowtrace.io/address/0xd586E7F844cEa2F87f50152665BCbc2C279D8d70
  address internal constant DAIe_UNDERLYING = 0xd586E7F844cEa2F87f50152665BCbc2C279D8d70;

  uint8 internal constant DAIe_DECIMALS = 18;

  // https://snowtrace.io/address/0x47AFa96Cdc9fAb46904A55a6ad4bf6660B53c38a
  address internal constant DAIe_A_TOKEN = 0x47AFa96Cdc9fAb46904A55a6ad4bf6660B53c38a;

  // https://snowtrace.io/address/0x1852DC24d1a8956a0B356AA18eDe954c7a0Ca5ae
  address internal constant DAIe_V_TOKEN = 0x1852DC24d1a8956a0B356AA18eDe954c7a0Ca5ae;

  // https://snowtrace.io/address/0xf82da795727633aFA9BB0f1B08A87c0F6A38723f
  address internal constant DAIe_ORACLE = 0xf82da795727633aFA9BB0f1B08A87c0F6A38723f;

  // https://snowtrace.io/address/0xd814D29bBd27b97d58255632C498c34b25DC72bD
  address internal constant DAIe_INTEREST_RATE_STRATEGY =
    0xd814D29bBd27b97d58255632C498c34b25DC72bD;

  // https://snowtrace.io/address/0xc7198437980c041c805A1EDcbA50c1Ce5db95118
  address internal constant USDTe_UNDERLYING = 0xc7198437980c041c805A1EDcbA50c1Ce5db95118;

  uint8 internal constant USDTe_DECIMALS = 6;

  // https://snowtrace.io/address/0x532E6537FEA298397212F09A61e03311686f548e
  address internal constant USDTe_A_TOKEN = 0x532E6537FEA298397212F09A61e03311686f548e;

  // https://snowtrace.io/address/0xfc1AdA7A288d6fCe0d29CcfAAa57Bc9114bb2DbE
  address internal constant USDTe_V_TOKEN = 0xfc1AdA7A288d6fCe0d29CcfAAa57Bc9114bb2DbE;

  // https://snowtrace.io/address/0x39185f2236A6022b682e8BB93C040d125DA093CF
  address internal constant USDTe_ORACLE = 0x39185f2236A6022b682e8BB93C040d125DA093CF;

  // https://snowtrace.io/address/0xd814D29bBd27b97d58255632C498c34b25DC72bD
  address internal constant USDTe_INTEREST_RATE_STRATEGY =
    0xd814D29bBd27b97d58255632C498c34b25DC72bD;

  // https://snowtrace.io/address/0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664
  address internal constant USDCe_UNDERLYING = 0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664;

  uint8 internal constant USDCe_DECIMALS = 6;

  // https://snowtrace.io/address/0x46A51127C3ce23fb7AB1DE06226147F446e4a857
  address internal constant USDCe_A_TOKEN = 0x46A51127C3ce23fb7AB1DE06226147F446e4a857;

  // https://snowtrace.io/address/0x848c080d2700CBE1B894a3374AD5E887E5cCb89c
  address internal constant USDCe_V_TOKEN = 0x848c080d2700CBE1B894a3374AD5E887E5cCb89c;

  // https://snowtrace.io/address/0xD8277249e871BE9A402fa286C2C5ec16046dC512
  address internal constant USDCe_ORACLE = 0xD8277249e871BE9A402fa286C2C5ec16046dC512;

  // https://snowtrace.io/address/0x6b410D0d53Efc7d4cAF23b9df2F38558998A1716
  address internal constant USDCe_INTEREST_RATE_STRATEGY =
    0x6b410D0d53Efc7d4cAF23b9df2F38558998A1716;

  // https://snowtrace.io/address/0x63a72806098Bd3D9520cC43356dD78afe5D386D9
  address internal constant AAVEe_UNDERLYING = 0x63a72806098Bd3D9520cC43356dD78afe5D386D9;

  uint8 internal constant AAVEe_DECIMALS = 18;

  // https://snowtrace.io/address/0xD45B7c061016102f9FA220502908f2c0f1add1D7
  address internal constant AAVEe_A_TOKEN = 0xD45B7c061016102f9FA220502908f2c0f1add1D7;

  // https://snowtrace.io/address/0x8352E3fd18B8d84D3c8a1b538d788899073c7A8E
  address internal constant AAVEe_V_TOKEN = 0x8352E3fd18B8d84D3c8a1b538d788899073c7A8E;

  // https://snowtrace.io/address/0x3CA13391E9fb38a75330fb28f8cc2eB3D9ceceED
  address internal constant AAVEe_ORACLE = 0x3CA13391E9fb38a75330fb28f8cc2eB3D9ceceED;

  // https://snowtrace.io/address/0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647
  address internal constant AAVEe_INTEREST_RATE_STRATEGY =
    0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647;

  // https://snowtrace.io/address/0x50b7545627a5162F82A992c33b87aDc75187B218
  address internal constant WBTCe_UNDERLYING = 0x50b7545627a5162F82A992c33b87aDc75187B218;

  uint8 internal constant WBTCe_DECIMALS = 8;

  // https://snowtrace.io/address/0x686bEF2417b6Dc32C50a3cBfbCC3bb60E1e9a15D
  address internal constant WBTCe_A_TOKEN = 0x686bEF2417b6Dc32C50a3cBfbCC3bb60E1e9a15D;

  // https://snowtrace.io/address/0x2dc0E35eC3Ab070B8a175C829e23650Ee604a9eB
  address internal constant WBTCe_V_TOKEN = 0x2dc0E35eC3Ab070B8a175C829e23650Ee604a9eB;

  // https://snowtrace.io/address/0x2779D32d5166BAaa2B2b658333bA7e6Ec0C65743
  address internal constant WBTCe_ORACLE = 0x2779D32d5166BAaa2B2b658333bA7e6Ec0C65743;

  // https://snowtrace.io/address/0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647
  address internal constant WBTCe_INTEREST_RATE_STRATEGY =
    0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647;

  // https://snowtrace.io/address/0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7
  address internal constant WAVAX_UNDERLYING = 0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7;

  uint8 internal constant WAVAX_DECIMALS = 18;

  // https://snowtrace.io/address/0xDFE521292EcE2A4f44242efBcD66Bc594CA9714B
  address internal constant WAVAX_A_TOKEN = 0xDFE521292EcE2A4f44242efBcD66Bc594CA9714B;

  // https://snowtrace.io/address/0x66A0FE52Fb629a6cB4D10B8580AFDffE888F5Fd4
  address internal constant WAVAX_V_TOKEN = 0x66A0FE52Fb629a6cB4D10B8580AFDffE888F5Fd4;

  // https://snowtrace.io/address/0x0A77230d17318075983913bC2145DB16C7366156
  address internal constant WAVAX_ORACLE = 0x0A77230d17318075983913bC2145DB16C7366156;

  // https://snowtrace.io/address/0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647
  address internal constant WAVAX_INTEREST_RATE_STRATEGY =
    0x6724e923E4bb58fCdF7CEe7A5E7bBb47b99C2647;
}
