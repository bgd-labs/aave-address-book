// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3Sepolia {
  // https://sepolia.etherscan.io/address/0x012bAC54348C0E635dCAc9D5FB99f06F24136C9A
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x012bAC54348C0E635dCAc9D5FB99f06F24136C9A);

  // https://sepolia.etherscan.io/address/0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951
  IPool internal constant POOL = IPool(0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951);

  // https://sepolia.etherscan.io/address/0x7Ee60D184C24Ef7AfC1Ec7Be59A0f448A0abd138
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x7Ee60D184C24Ef7AfC1Ec7Be59A0f448A0abd138);

  // https://sepolia.etherscan.io/address/0x2da88497588bf89281816106C7259e31AF45a663
  IAaveOracle internal constant ORACLE = IAaveOracle(0x2da88497588bf89281816106C7259e31AF45a663);

  // https://sepolia.etherscan.io/address/0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00
  address internal constant ACL_ADMIN = 0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00;

  // https://sepolia.etherscan.io/address/0x7F2bE3b178deeFF716CD6Ff03Ef79A1dFf360ddD
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x7F2bE3b178deeFF716CD6Ff03Ef79A1dFf360ddD);

  // https://sepolia.etherscan.io/address/0x3e9708d80f7B3e43118013075F7e95CE3AB31F31
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x3e9708d80f7B3e43118013075F7e95CE3AB31F31);

  // https://sepolia.etherscan.io/address/0x0562453c3DAFBB5e625483af58f4E6D668c44e19
  address internal constant POOL_IMPL = 0x0562453c3DAFBB5e625483af58f4E6D668c44e19;

  // https://sepolia.etherscan.io/address/0x63Dea961A0B2e2dF4F7A4bb61CBc39BF53A6eb32
  address internal constant POOL_CONFIGURATOR_IMPL = 0x63Dea961A0B2e2dF4F7A4bb61CBc39BF53A6eb32;

  // https://sepolia.etherscan.io/address/0x4DA5c4da71C5a167171cC839487536d86e083483
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x4DA5c4da71C5a167171cC839487536d86e083483;

  // https://sepolia.etherscan.io/address/0x098a890BAfDf6FB4ACD24bF107D20EA15D229C62
  address internal constant EMISSION_MANAGER = 0x098a890BAfDf6FB4ACD24bF107D20EA15D229C62;

  // https://sepolia.etherscan.io/address/0x604264f8017fEF3b11B3dD63537CB501560380B5
  ICollector internal constant COLLECTOR = ICollector(0x604264f8017fEF3b11B3dD63537CB501560380B5);

  // https://sepolia.etherscan.io/address/0x48424f2779be0f03cDF6F02E17A591A9BF7AF89f
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x48424f2779be0f03cDF6F02E17A591A9BF7AF89f;

  // https://sepolia.etherscan.io/address/0x54bdE009156053108E73E2401aEA755e38f92098
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x54bdE009156053108E73E2401aEA755e38f92098;

  // https://sepolia.etherscan.io/address/0xC959483DBa39aa9E78757139af0e9a2EDEb3f42D
  address internal constant FAUCET = 0xC959483DBa39aa9E78757139af0e9a2EDEb3f42D;

  // https://sepolia.etherscan.io/address/0xBA25de9a7DC623B30799F33B770d31B44c2C3b77
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xBA25de9a7DC623B30799F33B770d31B44c2C3b77;

  // https://sepolia.etherscan.io/address/0x69529987FA4A075D0C00B0128fa848dc9ebbE9CE
  address internal constant UI_POOL_DATA_PROVIDER = 0x69529987FA4A075D0C00B0128fa848dc9ebbE9CE;

  // https://sepolia.etherscan.io/address/0xCD4e0d6D2b1252E2A709B8aE97DBA31164C5a709
  address internal constant WALLET_BALANCE_PROVIDER = 0xCD4e0d6D2b1252E2A709B8aE97DBA31164C5a709;

  // https://sepolia.etherscan.io/address/0x387d311e47e80b498169e6fb51d3193167d89F7D
  address internal constant WETH_GATEWAY = 0x387d311e47e80b498169e6fb51d3193167d89F7D;

  // https://sepolia.etherscan.io/address/0xd210dFB43B694430B8d31762B5199e30c31266C8
  address internal constant STATIC_A_TOKEN_FACTORY = 0xd210dFB43B694430B8d31762B5199e30c31266C8;

  // https://sepolia.etherscan.io/address/0x69B9843A16a6E9933125EBD97659BA3CCbE2Ef8A
  address internal constant UI_GHO_DATA_PROVIDER = 0x69B9843A16a6E9933125EBD97659BA3CCbE2Ef8A;
}

library AaveV3SepoliaAssets {
  // https://sepolia.etherscan.io/address/0xFF34B3d4Aee8ddCd6F9AFFFB6Fe49bD371b8a357
  address internal constant DAI_UNDERLYING = 0xFF34B3d4Aee8ddCd6F9AFFFB6Fe49bD371b8a357;

  uint8 internal constant DAI_DECIMALS = 18;

  // https://sepolia.etherscan.io/address/0x29598b72eb5CeBd806C5dCD549490FdA35B13cD8
  address internal constant DAI_A_TOKEN = 0x29598b72eb5CeBd806C5dCD549490FdA35B13cD8;

  // https://sepolia.etherscan.io/address/0x22675C506A8FC26447aFFfa33640f6af5d4D4cF0
  address internal constant DAI_V_TOKEN = 0x22675C506A8FC26447aFFfa33640f6af5d4D4cF0;

  // https://sepolia.etherscan.io/address/0x9aF11c35c5d3Ae182C0050438972aac4376f9516
  address internal constant DAI_ORACLE = 0x9aF11c35c5d3Ae182C0050438972aac4376f9516;

  // https://sepolia.etherscan.io/address/0xA813CC4d67821fbAcF24659e414A1Cf6c551373c
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xA813CC4d67821fbAcF24659e414A1Cf6c551373c;

  // https://sepolia.etherscan.io/address/0xDE46e43F46ff74A23a65EBb0580cbe3dFE684a17
  address internal constant DAI_STATIC_A_TOKEN = 0xDE46e43F46ff74A23a65EBb0580cbe3dFE684a17;

  // https://sepolia.etherscan.io/address/0xf8Fb3713D459D7C1018BD0A49D19b4C44290EBE5
  address internal constant LINK_UNDERLYING = 0xf8Fb3713D459D7C1018BD0A49D19b4C44290EBE5;

  uint8 internal constant LINK_DECIMALS = 18;

  // https://sepolia.etherscan.io/address/0x3FfAf50D4F4E96eB78f2407c090b72e86eCaed24
  address internal constant LINK_A_TOKEN = 0x3FfAf50D4F4E96eB78f2407c090b72e86eCaed24;

  // https://sepolia.etherscan.io/address/0x34a4d932E722b9dFb492B9D8131127690CE2430B
  address internal constant LINK_V_TOKEN = 0x34a4d932E722b9dFb492B9D8131127690CE2430B;

  // https://sepolia.etherscan.io/address/0x14fC51b7df22b4D393cD45504B9f0A3002A63F3F
  address internal constant LINK_ORACLE = 0x14fC51b7df22b4D393cD45504B9f0A3002A63F3F;

  // https://sepolia.etherscan.io/address/0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB;

  // https://sepolia.etherscan.io/address/0x8227a989709a757f25dF251C3C3e71CA38627836
  address internal constant LINK_STATIC_A_TOKEN = 0x8227a989709a757f25dF251C3C3e71CA38627836;

  // https://sepolia.etherscan.io/address/0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8
  address internal constant USDC_UNDERLYING = 0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8;

  uint8 internal constant USDC_DECIMALS = 6;

  // https://sepolia.etherscan.io/address/0x16dA4541aD1807f4443d92D26044C1147406EB80
  address internal constant USDC_A_TOKEN = 0x16dA4541aD1807f4443d92D26044C1147406EB80;

  // https://sepolia.etherscan.io/address/0x36B5dE936eF1710E1d22EabE5231b28581a92ECc
  address internal constant USDC_V_TOKEN = 0x36B5dE936eF1710E1d22EabE5231b28581a92ECc;

  // https://sepolia.etherscan.io/address/0x98458D6A99489F15e6eB5aFa67ACFAcf6F211051
  address internal constant USDC_ORACLE = 0x98458D6A99489F15e6eB5aFa67ACFAcf6F211051;

  // https://sepolia.etherscan.io/address/0x5CB1008969a2d5FAcE8eF32732e6A306d0D0EF2A
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x5CB1008969a2d5FAcE8eF32732e6A306d0D0EF2A;

  // https://sepolia.etherscan.io/address/0x8A88124522dbBF1E56352ba3DE1d9F78C143751e
  address internal constant USDC_STATIC_A_TOKEN = 0x8A88124522dbBF1E56352ba3DE1d9F78C143751e;

  // https://sepolia.etherscan.io/address/0x29f2D40B0605204364af54EC677bD022dA425d03
  address internal constant WBTC_UNDERLYING = 0x29f2D40B0605204364af54EC677bD022dA425d03;

  uint8 internal constant WBTC_DECIMALS = 8;

  // https://sepolia.etherscan.io/address/0x1804Bf30507dc2EB3bDEbbbdd859991EAeF6EefF
  address internal constant WBTC_A_TOKEN = 0x1804Bf30507dc2EB3bDEbbbdd859991EAeF6EefF;

  // https://sepolia.etherscan.io/address/0xEB016dFd303F19fbDdFb6300eB4AeB2DA7Ceac37
  address internal constant WBTC_V_TOKEN = 0xEB016dFd303F19fbDdFb6300eB4AeB2DA7Ceac37;

  // https://sepolia.etherscan.io/address/0x784B90bA1E9a8cf3C9939c2e072F058B024C4b8a
  address internal constant WBTC_ORACLE = 0x784B90bA1E9a8cf3C9939c2e072F058B024C4b8a;

  // https://sepolia.etherscan.io/address/0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB;

  // https://sepolia.etherscan.io/address/0x131a121bda71ED810bCAf2aC9079214925e59C18
  address internal constant WBTC_STATIC_A_TOKEN = 0x131a121bda71ED810bCAf2aC9079214925e59C18;

  // https://sepolia.etherscan.io/address/0xC558DBdd856501FCd9aaF1E62eae57A9F0629a3c
  address internal constant WETH_UNDERLYING = 0xC558DBdd856501FCd9aaF1E62eae57A9F0629a3c;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://sepolia.etherscan.io/address/0x5b071b590a59395fE4025A0Ccc1FcC931AAc1830
  address internal constant WETH_A_TOKEN = 0x5b071b590a59395fE4025A0Ccc1FcC931AAc1830;

  // https://sepolia.etherscan.io/address/0x22a35DB253f4F6D0029025D6312A3BdAb20C2c6A
  address internal constant WETH_V_TOKEN = 0x22a35DB253f4F6D0029025D6312A3BdAb20C2c6A;

  // https://sepolia.etherscan.io/address/0xDde0E8E6d3653614878Bf5009EDC317BC129fE2F
  address internal constant WETH_ORACLE = 0xDde0E8E6d3653614878Bf5009EDC317BC129fE2F;

  // https://sepolia.etherscan.io/address/0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB;

  // https://sepolia.etherscan.io/address/0x162B500569F42D9eCe937e6a61EDfef660A12E98
  address internal constant WETH_STATIC_A_TOKEN = 0x162B500569F42D9eCe937e6a61EDfef660A12E98;

  // https://sepolia.etherscan.io/address/0xaA8E23Fb1079EA71e0a56F48a2aA51851D8433D0
  address internal constant USDT_UNDERLYING = 0xaA8E23Fb1079EA71e0a56F48a2aA51851D8433D0;

  uint8 internal constant USDT_DECIMALS = 6;

  // https://sepolia.etherscan.io/address/0xAF0F6e8b0Dc5c913bbF4d14c22B4E78Dd14310B6
  address internal constant USDT_A_TOKEN = 0xAF0F6e8b0Dc5c913bbF4d14c22B4E78Dd14310B6;

  // https://sepolia.etherscan.io/address/0x9844386d29EEd970B9F6a2B9a676083b0478210e
  address internal constant USDT_V_TOKEN = 0x9844386d29EEd970B9F6a2B9a676083b0478210e;

  // https://sepolia.etherscan.io/address/0x4e86D3Aa271Fa418F38D7262fdBa2989C94aa5Ba
  address internal constant USDT_ORACLE = 0x4e86D3Aa271Fa418F38D7262fdBa2989C94aa5Ba;

  // https://sepolia.etherscan.io/address/0x5CB1008969a2d5FAcE8eF32732e6A306d0D0EF2A
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x5CB1008969a2d5FAcE8eF32732e6A306d0D0EF2A;

  // https://sepolia.etherscan.io/address/0x978206fAe13faF5a8d293FB614326B237684B750
  address internal constant USDT_STATIC_A_TOKEN = 0x978206fAe13faF5a8d293FB614326B237684B750;

  // https://sepolia.etherscan.io/address/0x88541670E55cC00bEEFD87eB59EDd1b7C511AC9a
  address internal constant AAVE_UNDERLYING = 0x88541670E55cC00bEEFD87eB59EDd1b7C511AC9a;

  uint8 internal constant AAVE_DECIMALS = 18;

  // https://sepolia.etherscan.io/address/0x6b8558764d3b7572136F17174Cb9aB1DDc7E1259
  address internal constant AAVE_A_TOKEN = 0x6b8558764d3b7572136F17174Cb9aB1DDc7E1259;

  // https://sepolia.etherscan.io/address/0xf12fdFc4c631F6D361b48723c2F2800b84B519e6
  address internal constant AAVE_V_TOKEN = 0xf12fdFc4c631F6D361b48723c2F2800b84B519e6;

  // https://sepolia.etherscan.io/address/0xda678Ef100c13504edDb8a228A1e8e4CB139f189
  address internal constant AAVE_ORACLE = 0xda678Ef100c13504edDb8a228A1e8e4CB139f189;

  // https://sepolia.etherscan.io/address/0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0xCA30c502d52F905FB3D04eE60cA48F5A1A89f8dB;

  // https://sepolia.etherscan.io/address/0x56771cEF0cb422e125564CcCC98BB05fdc718E77
  address internal constant AAVE_STATIC_A_TOKEN = 0x56771cEF0cb422e125564CcCC98BB05fdc718E77;

  // https://sepolia.etherscan.io/address/0x6d906e526a4e2Ca02097BA9d0caA3c382F52278E
  address internal constant EURS_UNDERLYING = 0x6d906e526a4e2Ca02097BA9d0caA3c382F52278E;

  uint8 internal constant EURS_DECIMALS = 2;

  // https://sepolia.etherscan.io/address/0xB20691021F9AcED8631eDaa3c0Cd2949EB45662D
  address internal constant EURS_A_TOKEN = 0xB20691021F9AcED8631eDaa3c0Cd2949EB45662D;

  // https://sepolia.etherscan.io/address/0x94482C7A7477196259D8a0f74fB853277Fa5a75b
  address internal constant EURS_V_TOKEN = 0x94482C7A7477196259D8a0f74fB853277Fa5a75b;

  // https://sepolia.etherscan.io/address/0xCbE15C1f40f1D7eE1De3756D1557d5Fdc2A50bBD
  address internal constant EURS_ORACLE = 0xCbE15C1f40f1D7eE1De3756D1557d5Fdc2A50bBD;

  // https://sepolia.etherscan.io/address/0x5CB1008969a2d5FAcE8eF32732e6A306d0D0EF2A
  address internal constant EURS_INTEREST_RATE_STRATEGY =
    0x5CB1008969a2d5FAcE8eF32732e6A306d0D0EF2A;

  // https://sepolia.etherscan.io/address/0x72B49a461900e11632C95dfa563e7173438D4e3E
  address internal constant EURS_STATIC_A_TOKEN = 0x72B49a461900e11632C95dfa563e7173438D4e3E;

  // https://sepolia.etherscan.io/address/0xc4bF5CbDaBE595361438F8c6a187bDc330539c60
  address internal constant GHO_UNDERLYING = 0xc4bF5CbDaBE595361438F8c6a187bDc330539c60;

  uint8 internal constant GHO_DECIMALS = 18;

  // https://sepolia.etherscan.io/address/0xd190eF37dB51Bb955A680fF1A85763CC72d083D4
  address internal constant GHO_A_TOKEN = 0xd190eF37dB51Bb955A680fF1A85763CC72d083D4;

  // https://sepolia.etherscan.io/address/0x67ae46EF043F7A4508BD1d6B94DB6c33F0915844
  address internal constant GHO_V_TOKEN = 0x67ae46EF043F7A4508BD1d6B94DB6c33F0915844;

  // https://sepolia.etherscan.io/address/0x00f7fecFAEbEd9499e1f3f9d04E755a21E5fc47C
  address internal constant GHO_ORACLE = 0x00f7fecFAEbEd9499e1f3f9d04E755a21E5fc47C;

  // https://sepolia.etherscan.io/address/0x521247B4d0a51E71DE580dA2cBF99EB40a44b3Bf
  address internal constant GHO_INTEREST_RATE_STRATEGY = 0x521247B4d0a51E71DE580dA2cBF99EB40a44b3Bf;
}
