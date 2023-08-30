// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3Fuji {
  // https://testnet.snowtrace.io/address/0xfb87056c0587923f15EB0aABc7d0572450Cc8003
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xfb87056c0587923f15EB0aABc7d0572450Cc8003);
  // https://testnet.snowtrace.io/address/0xccEa5C65f6d4F465B71501418b88FBe4e7071283
  IPool internal constant POOL = IPool(0xccEa5C65f6d4F465B71501418b88FBe4e7071283);
  // https://testnet.snowtrace.io/address/0x34b80e82dFa833D65ef7618Cfc22bb1F359adce7
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x34b80e82dFa833D65ef7618Cfc22bb1F359adce7);
  // https://testnet.snowtrace.io/address/0x4DaE2f0f4Db78115eF114F1Dfef426ef2A4fC318
  IAaveOracle internal constant ORACLE = IAaveOracle(0x4DaE2f0f4Db78115eF114F1Dfef426ef2A4fC318);
  // https://testnet.snowtrace.io/address/0x0000000000000000000000000000000000000000
  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;
  // https://testnet.snowtrace.io/address/0x544b4e38fC2E74DAd9a3C2f783A15776C0C25c51
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x544b4e38fC2E74DAd9a3C2f783A15776C0C25c51);
  // https://testnet.snowtrace.io/address/0x4f2344ACBEfAe1aD87F41B84691E2552C719f723
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x4f2344ACBEfAe1aD87F41B84691E2552C719f723);
  // https://testnet.snowtrace.io/address/0x9973Ce75946D56fA3B0C6aa3647d67D440BDAec8
  address internal constant ACL_ADMIN = 0x9973Ce75946D56fA3B0C6aa3647d67D440BDAec8;
  // https://testnet.snowtrace.io/address/0xB847a72802E43dF643ceC66315B58832Af724Efa
  ICollector internal constant COLLECTOR = ICollector(0xB847a72802E43dF643ceC66315B58832Af724Efa);
  // https://testnet.snowtrace.io/address/0x25f130Df328c8c2f2C0270377D0e7a984E96ce56
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x25f130Df328c8c2f2C0270377D0e7a984E96ce56;
  // https://testnet.snowtrace.io/address/0xDB8266d95Bc9E1b4C1440501Fae90838381a9156
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0xDB8266d95Bc9E1b4C1440501Fae90838381a9156;
  // https://testnet.snowtrace.io/address/0x4e38efc0097D11bc2926b02D4d6D8FB7057EA7a2
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x4e38efc0097D11bc2926b02D4d6D8FB7057EA7a2;
  // https://testnet.snowtrace.io/address/0x2Cc2d88880Bbc779bD31eC8c72f8f879f8046a80
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x2Cc2d88880Bbc779bD31eC8c72f8f879f8046a80;
  // https://testnet.snowtrace.io/address/0x94D29389b874E6B5b7190dd891E7360827c0E3B4
  address internal constant EMISSION_MANAGER = 0x94D29389b874E6B5b7190dd891E7360827c0E3B4;
  // https://testnet.snowtrace.io/address/0xBCcD21ae43139bEF545e72e20E78f039A3Ac1b96
  address internal constant FAUCET = 0xBCcD21ae43139bEF545e72e20E78f039A3Ac1b96;
  // https://testnet.snowtrace.io/address/0x1EFf285a4E34217495b5531151bffa222A94A4F9
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x1EFf285a4E34217495b5531151bffa222A94A4F9;
  // https://testnet.snowtrace.io/address/0x279c790Afcd547e2f20d896c5DDEe3846b9790B5
  address internal constant UI_POOL_DATA_PROVIDER = 0x279c790Afcd547e2f20d896c5DDEe3846b9790B5;
  // https://testnet.snowtrace.io/address/0xfFE3778c51e93EBf68f5d0a83c794E7f623024dd
  address internal constant WALLET_BALANCE_PROVIDER = 0xfFE3778c51e93EBf68f5d0a83c794E7f623024dd;
  // https://testnet.snowtrace.io/address/0x8A007E495449ffeda4C2d65f14eE31f8Bcb022CF
  address internal constant WETH_GATEWAY = 0x8A007E495449ffeda4C2d65f14eE31f8Bcb022CF;
}

library AaveV3FujiAssets {
  // https://testnet.snowtrace.io/address/0x676bD5B5d0955925aeCe653C50426940c58036c8
  address internal constant DAI_UNDERLYING = 0x676bD5B5d0955925aeCe653C50426940c58036c8;
  uint256 internal constant DAI_DECIMALS = 18;
  // https://testnet.snowtrace.io/address/0xc2E0542ae75DF6ceC02fea12972918a5D18Eb956
  address internal constant DAI_A_TOKEN = 0xc2E0542ae75DF6ceC02fea12972918a5D18Eb956;
  // https://testnet.snowtrace.io/address/0x070fF79b060C14284754e8d575d2B96eCd2Fb15F
  address internal constant DAI_V_TOKEN = 0x070fF79b060C14284754e8d575d2B96eCd2Fb15F;
  // https://testnet.snowtrace.io/address/0x713106F071747aa337F40A52dc66D5aF0caB4510
  address internal constant DAI_S_TOKEN = 0x713106F071747aa337F40A52dc66D5aF0caB4510;
  // https://testnet.snowtrace.io/address/0xA99a7aCefb0a5Cc5152f27814A95c2D914e2f6e5
  address internal constant DAI_ORACLE = 0xA99a7aCefb0a5Cc5152f27814A95c2D914e2f6e5;
  // https://testnet.snowtrace.io/address/0x056e5A5ad84607fa7d9abaAe8464adE9D2020a7c
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0x056e5A5ad84607fa7d9abaAe8464adE9D2020a7c;
  // https://testnet.snowtrace.io/address/0x3A38c4d0444b5fFcc5323b2e86A21aBaaf5FbF26
  address internal constant LINK_UNDERLYING = 0x3A38c4d0444b5fFcc5323b2e86A21aBaaf5FbF26;
  uint256 internal constant LINK_DECIMALS = 18;
  // https://testnet.snowtrace.io/address/0x6cC4457C7547E6995ba7bA000851182F94658A51
  address internal constant LINK_A_TOKEN = 0x6cC4457C7547E6995ba7bA000851182F94658A51;
  // https://testnet.snowtrace.io/address/0x03578922eD24B3B07525D12464e69646551fd58E
  address internal constant LINK_V_TOKEN = 0x03578922eD24B3B07525D12464e69646551fd58E;
  // https://testnet.snowtrace.io/address/0xD79D85ce953266ef3c7f218c4b9F081b663566fC
  address internal constant LINK_S_TOKEN = 0xD79D85ce953266ef3c7f218c4b9F081b663566fC;
  // https://testnet.snowtrace.io/address/0x97cd7dc7DAA77E577C544Da7131e466952a72e9D
  address internal constant LINK_ORACLE = 0x97cd7dc7DAA77E577C544Da7131e466952a72e9D;
  // https://testnet.snowtrace.io/address/0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9;
  // https://testnet.snowtrace.io/address/0xCaC7Ffa82c0f43EBB0FC11FCd32123EcA46626cf
  address internal constant USDC_UNDERLYING = 0xCaC7Ffa82c0f43EBB0FC11FCd32123EcA46626cf;
  uint256 internal constant USDC_DECIMALS = 6;
  // https://testnet.snowtrace.io/address/0xb1c85310a1b809C70fA6806d27Da425C1261F801
  address internal constant USDC_A_TOKEN = 0xb1c85310a1b809C70fA6806d27Da425C1261F801;
  // https://testnet.snowtrace.io/address/0xaEF614b7ab1e50A919A181623E0888452c5139e5
  address internal constant USDC_V_TOKEN = 0xaEF614b7ab1e50A919A181623E0888452c5139e5;
  // https://testnet.snowtrace.io/address/0x37258ee15dE91909Ff2EF9e17ED3568196a6B62F
  address internal constant USDC_S_TOKEN = 0x37258ee15dE91909Ff2EF9e17ED3568196a6B62F;
  // https://testnet.snowtrace.io/address/0x5Ce12885EFe9fc9E3D710F4e729D53BEBBf32a8E
  address internal constant USDC_ORACLE = 0x5Ce12885EFe9fc9E3D710F4e729D53BEBBf32a8E;
  // https://testnet.snowtrace.io/address/0x58f262FBAE3a3F91db894E726ee35394b5649593
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x58f262FBAE3a3F91db894E726ee35394b5649593;
  // https://testnet.snowtrace.io/address/0x0EFD8Ad2231c0B9C4d63F892E0a0a59a626Ce88d
  address internal constant WBTC_UNDERLYING = 0x0EFD8Ad2231c0B9C4d63F892E0a0a59a626Ce88d;
  uint256 internal constant WBTC_DECIMALS = 8;
  // https://testnet.snowtrace.io/address/0x3d1F7da320eFDE834Cb7974d68591ca65de92FDC
  address internal constant WBTC_A_TOKEN = 0x3d1F7da320eFDE834Cb7974d68591ca65de92FDC;
  // https://testnet.snowtrace.io/address/0xbbBe736E39FC0a74C110869f837089fA5e57Ec04
  address internal constant WBTC_V_TOKEN = 0xbbBe736E39FC0a74C110869f837089fA5e57Ec04;
  // https://testnet.snowtrace.io/address/0xA782143aBAC80aA3fB265c10dA31eaeCD84f82c4
  address internal constant WBTC_S_TOKEN = 0xA782143aBAC80aA3fB265c10dA31eaeCD84f82c4;
  // https://testnet.snowtrace.io/address/0xBc251DE443F7Db3921e0cBC0d55c45336c646F7c
  address internal constant WBTC_ORACLE = 0xBc251DE443F7Db3921e0cBC0d55c45336c646F7c;
  // https://testnet.snowtrace.io/address/0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9;
  // https://testnet.snowtrace.io/address/0xf97b6C636167B529B6f1D729Bd9bC0e2Bd491848
  address internal constant WETH_UNDERLYING = 0xf97b6C636167B529B6f1D729Bd9bC0e2Bd491848;
  uint256 internal constant WETH_DECIMALS = 18;
  // https://testnet.snowtrace.io/address/0x812664237ad3DfdaA697B77b7919bBde7486D90E
  address internal constant WETH_A_TOKEN = 0x812664237ad3DfdaA697B77b7919bBde7486D90E;
  // https://testnet.snowtrace.io/address/0xEBaC3ae7bFC81C4e05Ad65a69aD69673B1b53a0f
  address internal constant WETH_V_TOKEN = 0xEBaC3ae7bFC81C4e05Ad65a69aD69673B1b53a0f;
  // https://testnet.snowtrace.io/address/0x4921c29cb9f79eB7Bf1e7B16836F2984ef569B38
  address internal constant WETH_S_TOKEN = 0x4921c29cb9f79eB7Bf1e7B16836F2984ef569B38;
  // https://testnet.snowtrace.io/address/0x3A19706EC161e02917f056F0c2a91961d2Cf32a0
  address internal constant WETH_ORACLE = 0x3A19706EC161e02917f056F0c2a91961d2Cf32a0;
  // https://testnet.snowtrace.io/address/0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9;
  // https://testnet.snowtrace.io/address/0xBDE7fbbb1DC89E74B73C54Ad911A1C9685caCD83
  address internal constant USDT_UNDERLYING = 0xBDE7fbbb1DC89E74B73C54Ad911A1C9685caCD83;
  uint256 internal constant USDT_DECIMALS = 6;
  // https://testnet.snowtrace.io/address/0x13f2B2AFCbe58e72b3d275aC197c3f602CC57735
  address internal constant USDT_A_TOKEN = 0x13f2B2AFCbe58e72b3d275aC197c3f602CC57735;
  // https://testnet.snowtrace.io/address/0xa09275Af89b16036944a48F82D9980C55B950162
  address internal constant USDT_V_TOKEN = 0xa09275Af89b16036944a48F82D9980C55B950162;
  // https://testnet.snowtrace.io/address/0x663Fe6EF3Ce8330c9f9494f933FBb426553F4F12
  address internal constant USDT_S_TOKEN = 0x663Fe6EF3Ce8330c9f9494f933FBb426553F4F12;
  // https://testnet.snowtrace.io/address/0x58D19E04fAfC6aC17c01B5667aF137431d9CaAF4
  address internal constant USDT_ORACLE = 0x58D19E04fAfC6aC17c01B5667aF137431d9CaAF4;
  // https://testnet.snowtrace.io/address/0x58f262FBAE3a3F91db894E726ee35394b5649593
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x58f262FBAE3a3F91db894E726ee35394b5649593;
  // https://testnet.snowtrace.io/address/0xfB4CeA030Fa61FC435E922CFDc4bF9C80456E19b
  address internal constant AAVE_UNDERLYING = 0xfB4CeA030Fa61FC435E922CFDc4bF9C80456E19b;
  uint256 internal constant AAVE_DECIMALS = 18;
  // https://testnet.snowtrace.io/address/0x8419b35fA4AE8105d3241687a6421abA7303E642
  address internal constant AAVE_A_TOKEN = 0x8419b35fA4AE8105d3241687a6421abA7303E642;
  // https://testnet.snowtrace.io/address/0x202AB06b46b0b37804753CF8B2bC0C750b6d6A35
  address internal constant AAVE_V_TOKEN = 0x202AB06b46b0b37804753CF8B2bC0C750b6d6A35;
  // https://testnet.snowtrace.io/address/0x38BcB6c581EEF8F6Ec545989B04973dC31252fA2
  address internal constant AAVE_S_TOKEN = 0x38BcB6c581EEF8F6Ec545989B04973dC31252fA2;
  // https://testnet.snowtrace.io/address/0xe19ee4B292a3c52A5089e0f84b5874ee29005895
  address internal constant AAVE_ORACLE = 0xe19ee4B292a3c52A5089e0f84b5874ee29005895;
  // https://testnet.snowtrace.io/address/0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9;
  // https://testnet.snowtrace.io/address/0x2f6179f64FFe203899600Ba26d10979B314eA13D
  address internal constant WAVAX_UNDERLYING = 0x2f6179f64FFe203899600Ba26d10979B314eA13D;
  uint256 internal constant WAVAX_DECIMALS = 18;
  // https://testnet.snowtrace.io/address/0x339f50bCbd874A892fb2c6A56Cf8D85Dd215Bf8e
  address internal constant WAVAX_A_TOKEN = 0x339f50bCbd874A892fb2c6A56Cf8D85Dd215Bf8e;
  // https://testnet.snowtrace.io/address/0xDB40902115B5eEBe5810AfB469A32b66c8258c9E
  address internal constant WAVAX_V_TOKEN = 0xDB40902115B5eEBe5810AfB469A32b66c8258c9E;
  // https://testnet.snowtrace.io/address/0xeea401488B4752969cD67E325f818d657a0Ea9a5
  address internal constant WAVAX_S_TOKEN = 0xeea401488B4752969cD67E325f818d657a0Ea9a5;
  // https://testnet.snowtrace.io/address/0xA575a92bdEDe1740eF4De70F304A1288AD6E1fb8
  address internal constant WAVAX_ORACLE = 0xA575a92bdEDe1740eF4De70F304A1288AD6E1fb8;
  // https://testnet.snowtrace.io/address/0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9
  address internal constant WAVAX_INTEREST_RATE_STRATEGY =
    0xeA461FF7c4e89150348b363F886b72c4E4d30Bd9;
}
