// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';
library AaveV3ZkSync {
  // https://era.zksync.network/address/0x2A3948BB219D6B2Fa83D64100006391a96bE6cb7
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x2A3948BB219D6B2Fa83D64100006391a96bE6cb7);

  // https://era.zksync.network/address/0x78e30497a3c7527d953c6B1E3541b021A98Ac43c
  IPool internal constant POOL = IPool(0x78e30497a3c7527d953c6B1E3541b021A98Ac43c);

  // https://era.zksync.network/address/0x0207d31b4377C74bEC37356aaD83E3dCc979F40E
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x0207d31b4377C74bEC37356aaD83E3dCc979F40E);

  // https://era.zksync.network/address/0xC7F58Fca663a8d377B6D0c9703C697f56dC40088
  IAaveOracle internal constant ORACLE = IAaveOracle(0xC7F58Fca663a8d377B6D0c9703C697f56dC40088);

  // https://era.zksync.network/address/0x04cE39789e11a49595cD0ECEf6f4Bd54ABF4d020
  address internal constant ACL_ADMIN = 0x04cE39789e11a49595cD0ECEf6f4Bd54ABF4d020;

  // https://era.zksync.network/address/0xc6150b63c2F02528d4A969a248710A4658ed7928
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xc6150b63c2F02528d4A969a248710A4658ed7928);

  // https://era.zksync.network/address/0xf79473ea6ef2C9537027bAe2f6E07d67dD9999E0
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xf79473ea6ef2C9537027bAe2f6E07d67dD9999E0);

  // https://era.zksync.network/address/0xc38b6318C434a362D16B635e2d2C2D58764f7a43
  address internal constant POOL_IMPL = 0xc38b6318C434a362D16B635e2d2C2D58764f7a43;

  // https://era.zksync.network/address/0xf994D6bee2F5F98a068985C008Cf0e5fBa132700
  address internal constant POOL_CONFIGURATOR_IMPL = 0xf994D6bee2F5F98a068985C008Cf0e5fBa132700;

  // https://era.zksync.network/address/0x37c972C9dDfC2138EBe33eC19dba063AB9f8966e
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x37c972C9dDfC2138EBe33eC19dba063AB9f8966e;

  // https://era.zksync.network/address/0x92AA83Ce0CC590E6B0627a9E22e84Ef43F389D1f
  address internal constant EMISSION_MANAGER = 0x92AA83Ce0CC590E6B0627a9E22e84Ef43F389D1f;

  // https://era.zksync.network/address/0xd69Cbda644c6be817AaFb5Fd9174f50C33803B6b
  ICollector internal constant COLLECTOR = ICollector(0xd69Cbda644c6be817AaFb5Fd9174f50C33803B6b);

  // https://era.zksync.network/address/0x34be365Fd01ac224F21490aaC6dFd65D25434bbB
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x34be365Fd01ac224F21490aaC6dFd65D25434bbB;

  // https://era.zksync.network/address/0x52E97425D1Fa6885fAaC9260B711fA5047A88d06
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x52E97425D1Fa6885fAaC9260B711fA5047A88d06;

  // https://era.zksync.network/address/0x54965A9c830DCEEa6BeEa77642C6A78C3df1C957
  address internal constant CONFIG_ENGINE = 0x54965A9c830DCEEa6BeEa77642C6A78C3df1C957;

  // https://era.zksync.network/address/0x0753E3637ddC6efc40759D9c347251046644F25F
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x0753E3637ddC6efc40759D9c347251046644F25F;

  // https://era.zksync.network/address/0x430Ef10d29237a0f061f9F7753fCe1cd1F5cF0e1
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x430Ef10d29237a0f061f9F7753fCe1cd1F5cF0e1;

  // https://era.zksync.network/address/0x6fCDa2646d6E4a42b1663d219811fC96AE3A0ec8
  address internal constant UI_POOL_DATA_PROVIDER = 0x6fCDa2646d6E4a42b1663d219811fC96AE3A0ec8;

  // https://era.zksync.network/address/0xcb8Dc3C135e59B1252F057da44A8f43EE6B0dAB0
  address internal constant WALLET_BALANCE_PROVIDER = 0xcb8Dc3C135e59B1252F057da44A8f43EE6B0dAB0;

  // https://era.zksync.network/address/0xAE2b00D676130Bdf22582781BbBA8f4F21e8B0ff
  address internal constant WETH_GATEWAY = 0xAE2b00D676130Bdf22582781BbBA8f4F21e8B0ff;

  // https://era.zksync.network/address/0x05c77Cf62346329a157d7A6F874464D049CECb26
  address internal constant RISK_STEWARD = 0x05c77Cf62346329a157d7A6F874464D049CECb26;

  // https://era.zksync.network/address/0x452E8E84bF852513585f893931CBD9A409Cd3459
  address internal constant DUST_BIN = 0x452E8E84bF852513585f893931CBD9A409Cd3459;

  // https://era.zksync.network/address/0x2a549daDfe66AcFf25Bb0Cf0C989AAD0Dc547ceb
  address internal constant CLINIC_STEWARD = 0x2a549daDfe66AcFf25Bb0Cf0C989AAD0Dc547ceb;
}
library AaveV3ZkSyncAssets {
  // https://era.zksync.network/address/0x1d17CBcF0D6D143135aE902365D2E5e2A16538D4
  address internal constant USDC_UNDERLYING = 0x1d17CBcF0D6D143135aE902365D2E5e2A16538D4;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://era.zksync.network/address/0xE977F9B2a5ccf0457870a67231F23BE4DaecfbDb
  address internal constant USDC_A_TOKEN = 0xE977F9B2a5ccf0457870a67231F23BE4DaecfbDb;

  // https://era.zksync.network/address/0x0049250D15A8550c5a14Baa5AF5B662a93a525B9
  address internal constant USDC_V_TOKEN = 0x0049250D15A8550c5a14Baa5AF5B662a93a525B9;

  // https://era.zksync.network/address/0x22A46593A7f93Aaec788bE3e27C1838E15781222
  address internal constant USDC_ORACLE = 0x22A46593A7f93Aaec788bE3e27C1838E15781222;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x57815Ab06D846d7dECd326Ee541CD06144FED237;

  // https://era.zksync.network/address/0x493257fD37EDB34451f62EDf8D2a0C418852bA4C
  address internal constant USDT_UNDERLYING = 0x493257fD37EDB34451f62EDf8D2a0C418852bA4C;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://era.zksync.network/address/0xC48574bc5358c967d9447e7Df70230Fdb469e4E7
  address internal constant USDT_A_TOKEN = 0xC48574bc5358c967d9447e7Df70230Fdb469e4E7;

  // https://era.zksync.network/address/0x8992DB58077fe8C7B80c1B3a738eAe8A7BdDbA34
  address internal constant USDT_V_TOKEN = 0x8992DB58077fe8C7B80c1B3a738eAe8A7BdDbA34;

  // https://era.zksync.network/address/0xE8D6d2dffCFfFc6b1f3606b7552e80319D01A8E9
  address internal constant USDT_ORACLE = 0xE8D6d2dffCFfFc6b1f3606b7552e80319D01A8E9;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x57815Ab06D846d7dECd326Ee541CD06144FED237;

  // https://era.zksync.network/address/0x5AEa5775959fBC2557Cc8789bC1bf90A239D9a91
  address internal constant WETH_UNDERLYING = 0x5AEa5775959fBC2557Cc8789bC1bf90A239D9a91;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://era.zksync.network/address/0xb7b93bCf82519bB757Fd18b23A389245Dbd8ca64
  address internal constant WETH_A_TOKEN = 0xb7b93bCf82519bB757Fd18b23A389245Dbd8ca64;

  // https://era.zksync.network/address/0x98dC737eA0E9bCb254c3F98510a71c5E11F74238
  address internal constant WETH_V_TOKEN = 0x98dC737eA0E9bCb254c3F98510a71c5E11F74238;

  // https://era.zksync.network/address/0x6D41d1dc818112880b40e26BD6FD347E41008eDA
  address internal constant WETH_ORACLE = 0x6D41d1dc818112880b40e26BD6FD347E41008eDA;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x57815Ab06D846d7dECd326Ee541CD06144FED237;

  // https://era.zksync.network/address/0x703b52F2b28fEbcB60E1372858AF5b18849FE867
  address internal constant wstETH_UNDERLYING = 0x703b52F2b28fEbcB60E1372858AF5b18849FE867;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://era.zksync.network/address/0xd4e607633F3d984633E946aEA4eb71f92564c1c9
  address internal constant wstETH_A_TOKEN = 0xd4e607633F3d984633E946aEA4eb71f92564c1c9;

  // https://era.zksync.network/address/0x6aD279F6523f6421fD5B0324a97D8F62eeCD80c8
  address internal constant wstETH_V_TOKEN = 0x6aD279F6523f6421fD5B0324a97D8F62eeCD80c8;

  // https://era.zksync.network/address/0xdea7DE07B8275564Af6135F7E9340411246EB7A2
  address internal constant wstETH_ORACLE = 0xdea7DE07B8275564Af6135F7E9340411246EB7A2;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0x57815Ab06D846d7dECd326Ee541CD06144FED237;

  // https://era.zksync.network/address/0x5A7d6b2F92C77FAD6CCaBd7EE0624E64907Eaf3E
  address internal constant ZK_UNDERLYING = 0x5A7d6b2F92C77FAD6CCaBd7EE0624E64907Eaf3E;

  uint8 internal constant ZK_DECIMALS = 18;

  // https://era.zksync.network/address/0xd6cD2c0fC55936498726CacC497832052A9B2D1B
  address internal constant ZK_A_TOKEN = 0xd6cD2c0fC55936498726CacC497832052A9B2D1B;

  // https://era.zksync.network/address/0x6450fd7F877B5bB726F7Bc6Bf0e6ffAbd48d72ad
  address internal constant ZK_V_TOKEN = 0x6450fd7F877B5bB726F7Bc6Bf0e6ffAbd48d72ad;

  // https://era.zksync.network/address/0xD1ce60dc8AE060DDD17cA8716C96f193bC88DD13
  address internal constant ZK_ORACLE = 0xD1ce60dc8AE060DDD17cA8716C96f193bC88DD13;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant ZK_INTEREST_RATE_STRATEGY = 0x57815Ab06D846d7dECd326Ee541CD06144FED237;

  // https://era.zksync.network/address/0xc1Fa6E2E8667d9bE0Ca938a54c7E0285E9Df924a
  address internal constant weETH_UNDERLYING = 0xc1Fa6E2E8667d9bE0Ca938a54c7E0285E9Df924a;

  uint8 internal constant weETH_DECIMALS = 18;

  // https://era.zksync.network/address/0xE818A67EE5c0531AFaa31Aa6e20bcAC36227A641
  address internal constant weETH_A_TOKEN = 0xE818A67EE5c0531AFaa31Aa6e20bcAC36227A641;

  // https://era.zksync.network/address/0xf31E1599b4480d07Fa96a7248c4f05cA84DA7fa8
  address internal constant weETH_V_TOKEN = 0xf31E1599b4480d07Fa96a7248c4f05cA84DA7fa8;

  // https://era.zksync.network/address/0x32aF9A0a47B332761c8C90E9eC9f53e46e852b2B
  address internal constant weETH_ORACLE = 0x32aF9A0a47B332761c8C90E9eC9f53e46e852b2B;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant weETH_INTEREST_RATE_STRATEGY =
    0x57815Ab06D846d7dECd326Ee541CD06144FED237;

  // https://era.zksync.network/address/0xAD17Da2f6Ac76746EF261E835C50b2651ce36DA8
  address internal constant sUSDe_UNDERLYING = 0xAD17Da2f6Ac76746EF261E835C50b2651ce36DA8;

  uint8 internal constant sUSDe_DECIMALS = 18;

  // https://era.zksync.network/address/0xF3c9d58B76AC6Ee6811520021e9A9318c49E4CFa
  address internal constant sUSDe_A_TOKEN = 0xF3c9d58B76AC6Ee6811520021e9A9318c49E4CFa;

  // https://era.zksync.network/address/0xDeBb4ddaaaB1676775214552a7a05D6A13f905Da
  address internal constant sUSDe_V_TOKEN = 0xDeBb4ddaaaB1676775214552a7a05D6A13f905Da;

  // https://era.zksync.network/address/0x9172A80ed668D3097D45350ffF71F4421ff572e1
  address internal constant sUSDe_ORACLE = 0x9172A80ed668D3097D45350ffF71F4421ff572e1;

  // https://era.zksync.network/address/0x57815Ab06D846d7dECd326Ee541CD06144FED237
  address internal constant sUSDe_INTEREST_RATE_STRATEGY =
    0x57815Ab06D846d7dECd326Ee541CD06144FED237;
}
library AaveV3ZkSyncEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant ETH_CORRELATED = 1;

  uint8 internal constant WEETH_CORRELATED = 2;
}
library AaveV3ZkSyncExternalLibraries {
  // https://era.zksync.network/address/0x4DFc5c694D5186De1616E207618e0464023a10A4
  address internal constant FLASHLOAN_LOGIC = 0x4DFc5c694D5186De1616E207618e0464023a10A4;

  // https://era.zksync.network/address/0x5140E3B094704C400dE13D8d7fa06535e711955f
  address internal constant BORROW_LOGIC = 0x5140E3B094704C400dE13D8d7fa06535e711955f;

  // https://era.zksync.network/address/0xA3fE5b3543cBD4418AcB5a0Ddf3C2513Aa778e60
  address internal constant BRIDGE_LOGIC = 0xA3fE5b3543cBD4418AcB5a0Ddf3C2513Aa778e60;

  // https://era.zksync.network/address/0x6877DEF1aD0f25dCec4F61FB60f5BB1682552412
  address internal constant E_MODE_LOGIC = 0x6877DEF1aD0f25dCec4F61FB60f5BB1682552412;

  // https://era.zksync.network/address/0xd5Fa63B509811Af4B66b51da0cB391598556690A
  address internal constant LIQUIDATION_LOGIC = 0xd5Fa63B509811Af4B66b51da0cB391598556690A;

  // https://era.zksync.network/address/0xD8F86743881b374b1ac2F680381D164a96e3ae01
  address internal constant POOL_LOGIC = 0xD8F86743881b374b1ac2F680381D164a96e3ae01;

  // https://era.zksync.network/address/0x431Ed010Df744d6D9912B4315AEa5f14a11b7a3e
  address internal constant SUPPLY_LOGIC = 0x431Ed010Df744d6D9912B4315AEa5f14a11b7a3e;
}
