// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';
library AaveV3Mantle {
  // https://mantlescan.xyz/address/0x2aB3580a805fB10CbAd567212C70e26C1B6769eC
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x2aB3580a805fB10CbAd567212C70e26C1B6769eC);

  // https://mantlescan.xyz/address/0x2e770EF8AbdEcA83D9310E2d3B3c2FdfFF5fd85A
  IPool internal constant POOL = IPool(0x2e770EF8AbdEcA83D9310E2d3B3c2FdfFF5fd85A);

  // https://mantlescan.xyz/address/0x4fDE7000ac23033B0FD420098B8a83A9Ff52c33C
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x4fDE7000ac23033B0FD420098B8a83A9Ff52c33C);

  // https://mantlescan.xyz/address/0x6c23bAF050ec192afc0B967a93b83e6c5405df43
  IAaveOracle internal constant ORACLE = IAaveOracle(0x6c23bAF050ec192afc0B967a93b83e6c5405df43);

  // https://mantlescan.xyz/address/0x70884634D0098782592111A2A6B8d223be31CB7b
  address internal constant ACL_ADMIN = 0x70884634D0098782592111A2A6B8d223be31CB7b;

  // https://mantlescan.xyz/address/0x3e652E97ff339B73421f824F5b03d75b62F1Fb51
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x3e652E97ff339B73421f824F5b03d75b62F1Fb51);

  // https://mantlescan.xyz/address/0x9138E2cAdFEB23AFFdc0419F2912CaB8F135dba9
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x9138E2cAdFEB23AFFdc0419F2912CaB8F135dba9);

  // https://mantlescan.xyz/address/0x589750BA8aF186cE5B55391B0b7148cAD43a1619
  address internal constant POOL_IMPL = 0x589750BA8aF186cE5B55391B0b7148cAD43a1619;

  // https://mantlescan.xyz/address/0xBeC519531F0E78BcDdB295242fA4EC5251B38574
  address internal constant POOL_CONFIGURATOR_IMPL = 0xBeC519531F0E78BcDdB295242fA4EC5251B38574;

  // https://mantlescan.xyz/address/0xe875feF12DF97D763038F0Eac53962Ca36249eA6
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xe875feF12DF97D763038F0Eac53962Ca36249eA6;

  // https://mantlescan.xyz/address/0x9D6aB154437A28CF202954e1176449c75e6D6c4B
  address internal constant EMISSION_MANAGER = 0x9D6aB154437A28CF202954e1176449c75e6D6c4B;

  // https://mantlescan.xyz/address/0x29B8Edc8a5158e8eBD7Dea3473517AB079260a0b
  ICollector internal constant COLLECTOR = ICollector(0x29B8Edc8a5158e8eBD7Dea3473517AB079260a0b);

  // https://mantlescan.xyz/address/0xd8247C7926841337E8adf9fD9E87026992C45062
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0xd8247C7926841337E8adf9fD9E87026992C45062;

  // https://mantlescan.xyz/address/0x294daB91f3539f5a74Ed995a59235eE62A14A345
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x294daB91f3539f5a74Ed995a59235eE62A14A345;

  // https://mantlescan.xyz/address/0xea9989569Cf2D860597b4d649c9A963c15ab84fa
  address internal constant CONFIG_ENGINE = 0xea9989569Cf2D860597b4d649c9A963c15ab84fa;

  // https://mantlescan.xyz/address/0xe892E40C92c2E4D281Be59b2E6300F271d824E75
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0xe892E40C92c2E4D281Be59b2E6300F271d824E75;

  // https://mantlescan.xyz/address/0x01d678F1bbE148C96e7501F1Ac41661904F84F61
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x01d678F1bbE148C96e7501F1Ac41661904F84F61;

  // https://mantlescan.xyz/address/0x4F6f44325828D2A40724A0a966F33d75cD1DF7c1
  address internal constant UI_POOL_DATA_PROVIDER = 0x4F6f44325828D2A40724A0a966F33d75cD1DF7c1;

  // https://mantlescan.xyz/address/0x4758213271BFdC72224A7a8742dC865fC97756e1
  address internal constant WALLET_BALANCE_PROVIDER = 0x4758213271BFdC72224A7a8742dC865fC97756e1;

  // https://mantlescan.xyz/address/0xde35f7711295Dfd0CD8bd94d46f65b8Acb182520
  address internal constant WETH_GATEWAY = 0xde35f7711295Dfd0CD8bd94d46f65b8Acb182520;

  // https://mantlescan.xyz/address/0x4A49351ED179b23af08523Af98a8ca95C712b9d9
  address internal constant L2_ENCODER = 0x4A49351ED179b23af08523Af98a8ca95C712b9d9;

  // https://mantlescan.xyz/address/0x7cCC8a3DF66a2cDEa6c0629412378752Db5014EA
  address internal constant STATA_FACTORY = 0x7cCC8a3DF66a2cDEa6c0629412378752Db5014EA;

  // https://mantlescan.xyz/address/0xCCCcf90C363Eaf09dD89DD5330C1287Ff6a945Ee
  address internal constant RISK_STEWARD = 0xCCCcf90C363Eaf09dD89DD5330C1287Ff6a945Ee;
}
library AaveV3MantleAssets {}
library AaveV3MantleEModes {
  uint8 internal constant NONE = 0;
}
library AaveV3MantleExternalLibraries {
  // https://mantlescan.xyz/address/0x34039100cc9584Ae5D741d322e16d0d18CEE8770
  address internal constant FLASHLOAN_LOGIC = 0x34039100cc9584Ae5D741d322e16d0d18CEE8770;

  // https://mantlescan.xyz/address/0x62325c94E1c49dcDb5937726aB5D8A4c37bCAd36
  address internal constant BORROW_LOGIC = 0x62325c94E1c49dcDb5937726aB5D8A4c37bCAd36;

  // https://mantlescan.xyz/address/0x621Ef86D8A5C693a06295BC288B95C12D4CE4994
  address internal constant BRIDGE_LOGIC = 0x621Ef86D8A5C693a06295BC288B95C12D4CE4994;

  // https://mantlescan.xyz/address/0xC31d2362fAeD85dF79d0bec99693D0EB0Abd3f74
  address internal constant E_MODE_LOGIC = 0xC31d2362fAeD85dF79d0bec99693D0EB0Abd3f74;

  // https://mantlescan.xyz/address/0x4731bF01583F991278692E8727d0700a00A1fBBf
  address internal constant LIQUIDATION_LOGIC = 0x4731bF01583F991278692E8727d0700a00A1fBBf;

  // https://mantlescan.xyz/address/0xf8C97539934ee66a67C26010e8e027D77E821B0C
  address internal constant POOL_LOGIC = 0xf8C97539934ee66a67C26010e8e027D77E821B0C;

  // https://mantlescan.xyz/address/0x185477906B46D9b8DE0DEB73A1bBfb87b5b51BC3
  address internal constant SUPPLY_LOGIC = 0x185477906B46D9b8DE0DEB73A1bBfb87b5b51BC3;
}
