// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';
library AaveV3EthereumLido {
  // https://etherscan.io/address/0xcfBf336fe147D643B9Cb705648500e101504B16d
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xcfBf336fe147D643B9Cb705648500e101504B16d);

  // https://etherscan.io/address/0x4e033931ad43597d96D6bcc25c280717730B58B1
  IPool internal constant POOL = IPool(0x4e033931ad43597d96D6bcc25c280717730B58B1);

  // https://etherscan.io/address/0x342631c6CeFC9cfbf97b2fe4aa242a236e1fd517
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x342631c6CeFC9cfbf97b2fe4aa242a236e1fd517);

  // https://etherscan.io/address/0xE3C061981870C0C7b1f3C4F4bB36B95f1F260BE6
  IAaveOracle internal constant ORACLE = IAaveOracle(0xE3C061981870C0C7b1f3C4F4bB36B95f1F260BE6);

  // https://etherscan.io/address/0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A
  address internal constant ACL_ADMIN = 0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A;

  // https://etherscan.io/address/0x013E2C7567b6231e865BB9273F8c7656103611c0
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x013E2C7567b6231e865BB9273F8c7656103611c0);

  // https://etherscan.io/address/0x66FeAe868EBEd74A34A7043e88742AAE00D2bC53
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x66FeAe868EBEd74A34A7043e88742AAE00D2bC53);

  // https://etherscan.io/address/0xc405a0eAB071a085A832F876D8e5be7cFEAfb624
  address internal constant POOL_IMPL = 0xc405a0eAB071a085A832F876D8e5be7cFEAfb624;

  // https://etherscan.io/address/0xE5e48Ad1F9D1A894188b483DcF91f4FaD6AbA43b
  address internal constant POOL_CONFIGURATOR_IMPL = 0xE5e48Ad1F9D1A894188b483DcF91f4FaD6AbA43b;

  // https://etherscan.io/address/0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb;

  // https://etherscan.io/address/0x223d844fc4B006D67c0cDbd39371A9F73f69d974
  address internal constant EMISSION_MANAGER = 0x223d844fc4B006D67c0cDbd39371A9F73f69d974;

  // https://etherscan.io/address/0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c
  ICollector internal constant COLLECTOR = ICollector(0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c);

  // https://etherscan.io/address/0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2;

  // https://etherscan.io/address/0x3E59212c34588a63350142EFad594a20C88C2CEd
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x3E59212c34588a63350142EFad594a20C88C2CEd;

  // https://etherscan.io/address/0xC6cAB8D39D93DC0Bd5986E7Ce5Bb956E30103A43
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0xC6cAB8D39D93DC0Bd5986E7Ce5Bb956E30103A43;

  // https://etherscan.io/address/0x66E1aBdb06e7363a618D65a910c540dfED23754f
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x66E1aBdb06e7363a618D65a910c540dfED23754f;

  // https://etherscan.io/address/0xD0887AA7fEBC8962c622493646195e7c76D94fCE
  address internal constant SWAP_COLLATERAL_ADAPTER = 0xD0887AA7fEBC8962c622493646195e7c76D94fCE;

  // https://etherscan.io/address/0x43eDB797834151D041619EEF833Edc784B509dAE
  address internal constant WITHDRAW_SWAP_ADAPTER = 0x43eDB797834151D041619EEF833Edc784B509dAE;

  // https://etherscan.io/address/0xe3dFf4052F0bF6134ACb73bEaE8fe2317d71F047
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xe3dFf4052F0bF6134ACb73bEaE8fe2317d71F047;

  // https://etherscan.io/address/0x3F78BBD206e4D3c504Eb854232EdA7e47E9Fd8FC
  address internal constant UI_POOL_DATA_PROVIDER = 0x3F78BBD206e4D3c504Eb854232EdA7e47E9Fd8FC;

  // https://etherscan.io/address/0xC7be5307ba715ce89b152f3Df0658295b3dbA8E2
  address internal constant WALLET_BALANCE_PROVIDER = 0xC7be5307ba715ce89b152f3Df0658295b3dbA8E2;

  // https://etherscan.io/address/0x3167C452fA3fa1e5C16bB83Bc0fde4519C464299
  address internal constant WETH_GATEWAY = 0x3167C452fA3fa1e5C16bB83Bc0fde4519C464299;

  // https://etherscan.io/address/0x1097eDb85392932b7dCB630baDDC8A6D73585218
  address internal constant CONFIG_ENGINE = 0x1097eDb85392932b7dCB630baDDC8A6D73585218;

  // https://etherscan.io/address/0x3843b29118fFC18d5d12EE079d0324E1bF115e69
  address internal constant CAPS_PLUS_RISK_STEWARD = 0x3843b29118fFC18d5d12EE079d0324E1bF115e69;

  // https://etherscan.io/address/0x30adC2f98ff78fDde12F191Acb82699f640694FB
  address internal constant RISK_STEWARD = 0x30adC2f98ff78fDde12F191Acb82699f640694FB;

  // https://etherscan.io/address/0xd1B2dec98A95B773C4909B5CD8FB455F467A527f
  address internal constant DEBT_SWAP_ADAPTER = 0xd1B2dec98A95B773C4909B5CD8FB455F467A527f;

  // https://etherscan.io/address/0x81aFd0F99c2Afa2f2DD7E387c2Ef9CD2a29b6E1A
  address internal constant EDGE_RISK_STEWARD = 0x81aFd0F99c2Afa2f2DD7E387c2Ef9CD2a29b6E1A;

  // https://etherscan.io/address/0x834a5aC6e9D05b92F599A031941262F761c34859
  address internal constant EDGE_STEWARD_INJECTOR = 0x834a5aC6e9D05b92F599A031941262F761c34859;

  // https://etherscan.io/address/0x7ABB46C690C52E919687D19ebF89C81A6136C1F2
  address internal constant RISK_ORACLE = 0x7ABB46C690C52E919687D19ebF89C81A6136C1F2;

  // https://etherscan.io/address/0x347C75d19718a05148687E13dca259aD016aB411
  address internal constant STATA_FACTORY = 0x347C75d19718a05148687E13dca259aD016aB411;

  // https://etherscan.io/address/0x2cE01c87Fec1b71A9041c52CaED46Fc5f4807285
  address internal constant GHO_DIRECT_MINTER = 0x2cE01c87Fec1b71A9041c52CaED46Fc5f4807285;

  // https://etherscan.io/address/0x31a0Ba3C2242a095dBF58A7C53751eCBd27dBA9b
  address internal constant DUST_BIN = 0x31a0Ba3C2242a095dBF58A7C53751eCBd27dBA9b;
}
library AaveV3EthereumLidoAssets {
  // https://etherscan.io/address/0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0
  address internal constant wstETH_UNDERLYING = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;

  uint8 internal constant wstETH_DECIMALS = 18;

  // https://etherscan.io/address/0xC035a7cf15375cE2706766804551791aD035E0C2
  address internal constant wstETH_A_TOKEN = 0xC035a7cf15375cE2706766804551791aD035E0C2;

  // https://etherscan.io/address/0xE439edd2625772AA635B437C099C607B6eb7d35f
  address internal constant wstETH_V_TOKEN = 0xE439edd2625772AA635B437C099C607B6eb7d35f;

  // https://etherscan.io/address/0xB4aB0c94159bc2d8C133946E7241368fc2F2a010
  address internal constant wstETH_ORACLE = 0xB4aB0c94159bc2d8C133946E7241368fc2F2a010;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant wstETH_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0x775F661b0bD1739349b9A2A3EF60be277c5d2D29
  address internal constant wstETH_STATA_TOKEN = 0x775F661b0bD1739349b9A2A3EF60be277c5d2D29;

  // https://etherscan.io/address/0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
  address internal constant WETH_UNDERLYING = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://etherscan.io/address/0xfA1fDbBD71B0aA16162D76914d69cD8CB3Ef92da
  address internal constant WETH_A_TOKEN = 0xfA1fDbBD71B0aA16162D76914d69cD8CB3Ef92da;

  // https://etherscan.io/address/0x91b7d78BF92db564221f6B5AeE744D1727d1Dd1e
  address internal constant WETH_V_TOKEN = 0x91b7d78BF92db564221f6B5AeE744D1727d1Dd1e;

  // https://etherscan.io/address/0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
  address internal constant WETH_ORACLE = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0x0FE906e030a44eF24CA8c7dC7B7c53A6C4F00ce9
  address internal constant WETH_STATA_TOKEN = 0x0FE906e030a44eF24CA8c7dC7B7c53A6C4F00ce9;

  // https://etherscan.io/address/0xdC035D45d973E3EC169d2276DDab16f1e407384F
  address internal constant USDS_UNDERLYING = 0xdC035D45d973E3EC169d2276DDab16f1e407384F;

  uint8 internal constant USDS_DECIMALS = 18;

  // https://etherscan.io/address/0x09AA30b182488f769a9824F15E6Ce58591Da4781
  address internal constant USDS_A_TOKEN = 0x09AA30b182488f769a9824F15E6Ce58591Da4781;

  // https://etherscan.io/address/0x2D9fe18b6c35FE439cC15D932cc5C943bf2d901E
  address internal constant USDS_V_TOKEN = 0x2D9fe18b6c35FE439cC15D932cc5C943bf2d901E;

  // https://etherscan.io/address/0x4F01b76391A05d32B20FA2d05dD5963eE8db20E6
  address internal constant USDS_ORACLE = 0x4F01b76391A05d32B20FA2d05dD5963eE8db20E6;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant USDS_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
  address internal constant USDC_UNDERLYING = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://etherscan.io/address/0x2A1FBcb52Ed4d9b23daD17E1E8Aed4BB0E6079b8
  address internal constant USDC_A_TOKEN = 0x2A1FBcb52Ed4d9b23daD17E1E8Aed4BB0E6079b8;

  // https://etherscan.io/address/0xeD90dE2D824Ee766c6Fd22E90b12e598f681dc9F
  address internal constant USDC_V_TOKEN = 0xeD90dE2D824Ee766c6Fd22E90b12e598f681dc9F;

  // https://etherscan.io/address/0x736bF902680e68989886e9807CD7Db4B3E015d3C
  address internal constant USDC_ORACLE = 0x736bF902680e68989886e9807CD7Db4B3E015d3C;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0xbf5495Efe5DB9ce00f80364C8B423567e58d2110
  address internal constant ezETH_UNDERLYING = 0xbf5495Efe5DB9ce00f80364C8B423567e58d2110;

  uint8 internal constant ezETH_DECIMALS = 18;

  // https://etherscan.io/address/0x74e5664394998f13B07aF42446380ACef637969f
  address internal constant ezETH_A_TOKEN = 0x74e5664394998f13B07aF42446380ACef637969f;

  // https://etherscan.io/address/0x08e1bba76D27841dD91FAb4b3a636A0D5CF8c3E9
  address internal constant ezETH_V_TOKEN = 0x08e1bba76D27841dD91FAb4b3a636A0D5CF8c3E9;

  // https://etherscan.io/address/0x68C9c7Bf43DBd0EBab102116bc7C3C9f7d9297Ee
  address internal constant ezETH_ORACLE = 0x68C9c7Bf43DBd0EBab102116bc7C3C9f7d9297Ee;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant ezETH_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0x9D39A5DE30e57443BfF2A8307A4256c8797A3497
  address internal constant sUSDe_UNDERLYING = 0x9D39A5DE30e57443BfF2A8307A4256c8797A3497;

  uint8 internal constant sUSDe_DECIMALS = 18;

  // https://etherscan.io/address/0xc2015641564a5914A17CB9A92eC8d8feCfa8f2D0
  address internal constant sUSDe_A_TOKEN = 0xc2015641564a5914A17CB9A92eC8d8feCfa8f2D0;

  // https://etherscan.io/address/0x2ABbAab3EF4e4A899d39e7EC996b5715E76b399a
  address internal constant sUSDe_V_TOKEN = 0x2ABbAab3EF4e4A899d39e7EC996b5715E76b399a;

  // https://etherscan.io/address/0xb37aE8aBa6C0C1Bf2c509fc06E11aa4AF29B665A
  address internal constant sUSDe_ORACLE = 0xb37aE8aBa6C0C1Bf2c509fc06E11aa4AF29B665A;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant sUSDe_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0x40D16FC0246aD3160Ccc09B8D0D3A2cD28aE6C2f
  address internal constant GHO_UNDERLYING = 0x40D16FC0246aD3160Ccc09B8D0D3A2cD28aE6C2f;

  uint8 internal constant GHO_DECIMALS = 18;

  // https://etherscan.io/address/0x18eFE565A5373f430e2F809b97De30335B3ad96A
  address internal constant GHO_A_TOKEN = 0x18eFE565A5373f430e2F809b97De30335B3ad96A;

  // https://etherscan.io/address/0x18577F0f4A0B2Ee6F4048dB51c7acd8699F97DB8
  address internal constant GHO_V_TOKEN = 0x18577F0f4A0B2Ee6F4048dB51c7acd8699F97DB8;

  // https://etherscan.io/address/0xD110cac5d8682A3b045D5524a9903E031d70FCCd
  address internal constant GHO_ORACLE = 0xD110cac5d8682A3b045D5524a9903E031d70FCCd;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant GHO_INTEREST_RATE_STRATEGY = 0x8958b1C39269167527821f8c276Ef7504883f2fa;

  // https://etherscan.io/address/0xC71Ea051a5F82c67ADcF634c36FFE6334793D24C
  address internal constant GHO_STATA_TOKEN = 0xC71Ea051a5F82c67ADcF634c36FFE6334793D24C;

  // https://etherscan.io/address/0xA1290d69c65A6Fe4DF752f95823fae25cB99e5A7
  address internal constant rsETH_UNDERLYING = 0xA1290d69c65A6Fe4DF752f95823fae25cB99e5A7;

  uint8 internal constant rsETH_DECIMALS = 18;

  // https://etherscan.io/address/0x56D919E7B25aA42F3F8a4BC77b8982048F2E84B4
  address internal constant rsETH_A_TOKEN = 0x56D919E7B25aA42F3F8a4BC77b8982048F2E84B4;

  // https://etherscan.io/address/0x2c2163f120cf58631368981BC16e90190Bc6C644
  address internal constant rsETH_V_TOKEN = 0x2c2163f120cf58631368981BC16e90190Bc6C644;

  // https://etherscan.io/address/0x47F52B2e43D0386cF161e001835b03Ad49889e3b
  address internal constant rsETH_ORACLE = 0x47F52B2e43D0386cF161e001835b03Ad49889e3b;

  // https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa
  address internal constant rsETH_INTEREST_RATE_STRATEGY =
    0x8958b1C39269167527821f8c276Ef7504883f2fa;
}
library AaveV3EthereumLidoEModes {
  uint8 internal constant NONE = 0;

  uint8 internal constant ETH_CORRELATED = 1;

  uint8 internal constant LRT_STABLECOINS_MAIN = 2;

  uint8 internal constant LRT_WSTETH_MAIN = 3;

  uint8 internal constant SUSDE_STABLECOINS = 4;

  uint8 internal constant RSETH_LST_MAIN = 5;
}
library AaveV3EthereumLidoExternalLibraries {
  // https://etherscan.io/address/0x34039100cc9584Ae5D741d322e16d0d18CEE8770
  address internal constant FLASHLOAN_LOGIC = 0x34039100cc9584Ae5D741d322e16d0d18CEE8770;

  // https://etherscan.io/address/0x62325c94E1c49dcDb5937726aB5D8A4c37bCAd36
  address internal constant BORROW_LOGIC = 0x62325c94E1c49dcDb5937726aB5D8A4c37bCAd36;

  // https://etherscan.io/address/0x621Ef86D8A5C693a06295BC288B95C12D4CE4994
  address internal constant BRIDGE_LOGIC = 0x621Ef86D8A5C693a06295BC288B95C12D4CE4994;

  // https://etherscan.io/address/0xC31d2362fAeD85dF79d0bec99693D0EB0Abd3f74
  address internal constant E_MODE_LOGIC = 0xC31d2362fAeD85dF79d0bec99693D0EB0Abd3f74;

  // https://etherscan.io/address/0x4731bF01583F991278692E8727d0700a00A1fBBf
  address internal constant LIQUIDATION_LOGIC = 0x4731bF01583F991278692E8727d0700a00A1fBBf;

  // https://etherscan.io/address/0xf8C97539934ee66a67C26010e8e027D77E821B0C
  address internal constant POOL_LOGIC = 0xf8C97539934ee66a67C26010e8e027D77E821B0C;

  // https://etherscan.io/address/0x185477906B46D9b8DE0DEB73A1bBfb87b5b51BC3
  address internal constant SUPPLY_LOGIC = 0x185477906B46D9b8DE0DEB73A1bBfb87b5b51BC3;
}
