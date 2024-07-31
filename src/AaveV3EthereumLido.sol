// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3EthereumLido {
  // https://etherscan.io/address/0xcfBf336fe147D643B9Cb705648500e101504B16d
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xcfBf336fe147D643B9Cb705648500e101504B16d);

  // https://etherscan.io/address/0x4e033931ad43597d96D6bcc25c280717730B58B1
  IPool internal constant POOL = IPool(0x4e033931ad43597d96D6bcc25c280717730B58B1);

  // https://etherscan.io/address/0xdA8d159352ba3700d37E6e7B6a027E1bf3188C60
  address internal constant POOL_IMPL = 0xdA8d159352ba3700d37E6e7B6a027E1bf3188C60;

  // https://etherscan.io/address/0x342631c6CeFC9cfbf97b2fe4aa242a236e1fd517
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x342631c6CeFC9cfbf97b2fe4aa242a236e1fd517);

  // https://etherscan.io/address/0x5704f0Ed2B5B47f380aAF5993819062D62eDC219
  address internal constant POOL_CONFIGURATOR_IMPL = 0x5704f0Ed2B5B47f380aAF5993819062D62eDC219;

  // https://etherscan.io/address/0xE3C061981870C0C7b1f3C4F4bB36B95f1F260BE6
  IAaveOracle internal constant ORACLE = IAaveOracle(0xE3C061981870C0C7b1f3C4F4bB36B95f1F260BE6);

  // https://etherscan.io/address/0xa3206d66cF94AA1e93B21a9D8d409d6375309F4A
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xa3206d66cF94AA1e93B21a9D8d409d6375309F4A);

  // https://etherscan.io/address/0x013E2C7567b6231e865BB9273F8c7656103611c0
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x013E2C7567b6231e865BB9273F8c7656103611c0);

  // https://etherscan.io/address/0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A
  address internal constant ACL_ADMIN = 0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A;

  // https://etherscan.io/address/0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c
  ICollector internal constant COLLECTOR = ICollector(0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c);

  // https://etherscan.io/address/0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb;

  // https://etherscan.io/address/0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2;

  // https://etherscan.io/address/0x3E59212c34588a63350142EFad594a20C88C2CEd
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x3E59212c34588a63350142EFad594a20C88C2CEd;

  // https://etherscan.io/address/0x36284fED68f802c5733432c3306D8e92c504a243
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x36284fED68f802c5733432c3306D8e92c504a243;

  // https://etherscan.io/address/0x223d844fc4B006D67c0cDbd39371A9F73f69d974
  address internal constant EMISSION_MANAGER = 0x223d844fc4B006D67c0cDbd39371A9F73f69d974;

  // https://etherscan.io/address/0xC6cAB8D39D93DC0Bd5986E7Ce5Bb956E30103A43
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0xC6cAB8D39D93DC0Bd5986E7Ce5Bb956E30103A43;

  // https://etherscan.io/address/0xd0EAE3B730AE736614c66Cb40aFd1e0063f74286
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0xd0EAE3B730AE736614c66Cb40aFd1e0063f74286;

  // https://etherscan.io/address/0xD0887AA7fEBC8962c622493646195e7c76D94fCE
  address internal constant SWAP_COLLATERAL_ADAPTER = 0xD0887AA7fEBC8962c622493646195e7c76D94fCE;

  // https://etherscan.io/address/0x43eDB797834151D041619EEF833Edc784B509dAE
  address internal constant WITHDRAW_SWAP_ADAPTER = 0x43eDB797834151D041619EEF833Edc784B509dAE;

  // https://etherscan.io/address/0xB3a0fA312853A8E24C7756e6857cD56592b24c99
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xB3a0fA312853A8E24C7756e6857cD56592b24c99;

  // https://etherscan.io/address/0x07060168141ab016AbB8933B86D2541D66B4F74A
  address internal constant UI_POOL_DATA_PROVIDER = 0x07060168141ab016AbB8933B86D2541D66B4F74A;

  // https://etherscan.io/address/0xC7be5307ba715ce89b152f3Df0658295b3dbA8E2
  address internal constant WALLET_BALANCE_PROVIDER = 0xC7be5307ba715ce89b152f3Df0658295b3dbA8E2;

  // https://etherscan.io/address/0x702B6770A81f75964cA5D479F369eFB31dfa7C32
  address internal constant WETH_GATEWAY = 0x702B6770A81f75964cA5D479F369eFB31dfa7C32;

  // https://etherscan.io/address/0xC80f057d40Fc7f0A01ad4a634f35520Df8079707
  address internal constant CONFIG_ENGINE = 0xC80f057d40Fc7f0A01ad4a634f35520Df8079707;

  // https://etherscan.io/address/0x3843b29118fFC18d5d12EE079d0324E1bF115e69
  address internal constant CAPS_PLUS_RISK_STEWARD = 0x3843b29118fFC18d5d12EE079d0324E1bF115e69;
}

library AaveV3EthereumLidoAssets {
  // https://etherscan.io/address/0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0
  address internal constant wstETH_UNDERLYING = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://etherscan.io/address/0xC035a7cf15375cE2706766804551791aD035E0C2
  address internal constant wstETH_A_TOKEN = 0xC035a7cf15375cE2706766804551791aD035E0C2;

  // https://etherscan.io/address/0xE439edd2625772AA635B437C099C607B6eb7d35f
  address internal constant wstETH_V_TOKEN = 0xE439edd2625772AA635B437C099C607B6eb7d35f;

  // https://etherscan.io/address/0x3d0Fd161363b327C704b013a9E63a8Cc03Bec1c4
  address internal constant wstETH_S_TOKEN = 0x3d0Fd161363b327C704b013a9E63a8Cc03Bec1c4;

  // https://etherscan.io/address/0xB4aB0c94159bc2d8C133946E7241368fc2F2a010
  address internal constant wstETH_ORACLE = 0xB4aB0c94159bc2d8C133946E7241368fc2F2a010;

  // https://etherscan.io/address/0x6642dcAaBc80807DD083c66a301d308568CBcA3D
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0x6642dcAaBc80807DD083c66a301d308568CBcA3D;

  // https://etherscan.io/address/0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
  address internal constant WETH_UNDERLYING = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xfA1fDbBD71B0aA16162D76914d69cD8CB3Ef92da
  address internal constant WETH_A_TOKEN = 0xfA1fDbBD71B0aA16162D76914d69cD8CB3Ef92da;

  // https://etherscan.io/address/0x91b7d78BF92db564221f6B5AeE744D1727d1Dd1e
  address internal constant WETH_V_TOKEN = 0x91b7d78BF92db564221f6B5AeE744D1727d1Dd1e;

  // https://etherscan.io/address/0x97D5Cd1a26243647ddEac87183236Cf215974d30
  address internal constant WETH_S_TOKEN = 0x97D5Cd1a26243647ddEac87183236Cf215974d30;

  // https://etherscan.io/address/0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
  address internal constant WETH_ORACLE = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;

  // https://etherscan.io/address/0x6642dcAaBc80807DD083c66a301d308568CBcA3D
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x6642dcAaBc80807DD083c66a301d308568CBcA3D;
}

library AaveV3EthereumLidoEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant ETH_CORRELATED = 1;
}

library AaveV3EthereumLidoExternalLibraries {
  // https://etherscan.io/address/0x6DA8d7EF0625e965dafc393793C048096392d4a5
  address internal constant FLASHLOAN_LOGIC = 0x6DA8d7EF0625e965dafc393793C048096392d4a5;

  // https://etherscan.io/address/0x41717de714Db8630F02Dea8f6A39C73A5b5C7df1
  address internal constant BORROW_LOGIC = 0x41717de714Db8630F02Dea8f6A39C73A5b5C7df1;

  // https://etherscan.io/address/0xca2385754bCa5d632F5160B560352aBd12029685
  address internal constant BRIDGE_LOGIC = 0xca2385754bCa5d632F5160B560352aBd12029685;

  // https://etherscan.io/address/0x12959a64470Dd003590Bb1EcFC436dddE7608724
  address internal constant E_MODE_LOGIC = 0x12959a64470Dd003590Bb1EcFC436dddE7608724;

  // https://etherscan.io/address/0x72c272aE914EC11AFe1e74A0016e0A91c1A6014e
  address internal constant LIQUIDATION_LOGIC = 0x72c272aE914EC11AFe1e74A0016e0A91c1A6014e;

  // https://etherscan.io/address/0x55D552EFbc8aEB87AffCEa8630B43a33BA24D975
  address internal constant POOL_LOGIC = 0x55D552EFbc8aEB87AffCEa8630B43a33BA24D975;

  // https://etherscan.io/address/0x9336943ecd91C201D9ED5A21562b34Aef710052f
  address internal constant SUPPLY_LOGIC = 0x9336943ecd91C201D9ED5A21562b34Aef710052f;
}
