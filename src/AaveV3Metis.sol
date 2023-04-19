// SPDX-License-Identifier: MIT
// TODO: Manually added, need to fix the generator scripts
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';

library AaveV3Metis {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x632bf4054334F263F49a7039Cce25f0294f3f667);

  IPool internal constant POOL = IPool(0xb4bcdE07701494925455967814BFFA7eD5B4d568);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x311ACE634E6AbfFf83480B9Ba328a89503932258);

  IAaveOracle internal constant ORACLE = IAaveOracle(0x5859B57b919035D82ED2Dd3F1f708dB13302614e);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xd530b9cffAaAFA5B3cD835e990942c9FDa10BD18);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x153f7b80b68EB3f296fb420F8Be847b1933854c4);

  address internal constant ACL_ADMIN = 0x8EC77963068474a45016938Deb95E603Ca82a029;

  address internal constant COLLECTOR = 0x90dA620955B942613A6Fae754aE66F0C37a364e0;

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xf33A80b8810bC56D574316ff17B91e1C06D6289D;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x2954c4494B3De43C69a38EfaE076507F31a385C5;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xAF3CcbaA1E30B61235ead8E056E0F2B4B5A73851;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x0B0c10cBD39D449F0FC6522E8eb1Cf734BD8daB7;

  address internal constant EMISSION_MANAGER = 0x06010e7D435C5283467382dA9BdEf26fB6D4fA82;

  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0xb7a29601F1eEe75438D6Aa04969B124f6ED635Be;

  address internal constant RATES_FACTORY = 0x59ED955e3a34479F4a35dCBD794BA70D6319CFcC;

  address internal constant LISTING_ENGINE = 0xb0A73671C97BAC9Ba899CD1a23604Fd2278cD02A;

  address internal constant WALLET_BALANCE_PROVIDER = 0x91b6C4ee40e6819Ea075712DB5A11459ded1b5fC;

  address internal constant UI_POOL_DATA_PROVIDER = 0xFF3a3E8112Da865CA669E61257E6C21AF6D9F586;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xB71eA83ee96246B3221bf7E8eaED737f126fc2AF;

  address internal constant L2_ENCODER = 0x57b1F9Fd95BB068784C10aDF6F0A49CB16c5E8C8;

}

library AaveV3MetisAssets {

}
