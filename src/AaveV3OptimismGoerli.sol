// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

library AaveV3OptimismGoerli {
  // https://goerli-optimism.etherscan.io/address/0xf3a4595bD9FBf129DEb80802a4785873F0ceB65c
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xf3a4595bD9FBf129DEb80802a4785873F0ceB65c);

  // https://goerli-optimism.etherscan.io/address/0x52dCE39f4A3823b335732178364f5590bDacb25D
  IPool internal constant POOL = IPool(0x52dCE39f4A3823b335732178364f5590bDacb25D);

  // https://goerli-optimism.etherscan.io/address/0x54Ad998A389A82e4ACf9dC03A92512694EF25035
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x54Ad998A389A82e4ACf9dC03A92512694EF25035);

  // https://goerli-optimism.etherscan.io/address/0xFd8Ec04CeC4B1A734A58E4920f76baFa9a1326D8
  IAaveOracle internal constant ORACLE = IAaveOracle(0xFd8Ec04CeC4B1A734A58E4920f76baFa9a1326D8);

  // https://goerli-optimism.etherscan.io/address/0x0000000000000000000000000000000000000000
  address internal constant PRICE_ORACLE_SENTINEL = 0x0000000000000000000000000000000000000000;

  // https://goerli-optimism.etherscan.io/address/0x586370F91E4a73659989a213C969487Cb2B2E7cD
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x586370F91E4a73659989a213C969487Cb2B2E7cD);

  // https://goerli-optimism.etherscan.io/address/0x00f7fecFAEbEd9499e1f3f9d04E755a21E5fc47C
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x00f7fecFAEbEd9499e1f3f9d04E755a21E5fc47C);

  // https://goerli-optimism.etherscan.io/address/0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00
  address internal constant ACL_ADMIN = 0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00;

  // https://goerli-optimism.etherscan.io/address/0xd06dC54Fcc044A86D33454091b193B7E2104b50D
  ICollector internal constant COLLECTOR = ICollector(0xd06dC54Fcc044A86D33454091b193B7E2104b50D);

  // https://goerli-optimism.etherscan.io/address/0xF76301d2D80FE71314c8448E6FA4F4Ee2583046B
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xF76301d2D80FE71314c8448E6FA4F4Ee2583046B;

  // https://goerli-optimism.etherscan.io/address/0xABa01108c4964731AAc2B6DA8d731A58c1DfA8cF
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0xABa01108c4964731AAc2B6DA8d731A58c1DfA8cF;

  // https://goerli-optimism.etherscan.io/address/0xCAeB08beA60BE1cA547cbD19A5bC9ba372AE9f0e
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xCAeB08beA60BE1cA547cbD19A5bC9ba372AE9f0e;

  // https://goerli-optimism.etherscan.io/address/0xd550780aaD654d03Cd355EAB6bB444BaF764Baae
  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xd550780aaD654d03Cd355EAB6bB444BaF764Baae;

  // https://goerli-optimism.etherscan.io/address/0x69B9843A16a6E9933125EBD97659BA3CCbE2Ef8A
  address internal constant EMISSION_MANAGER = 0x69B9843A16a6E9933125EBD97659BA3CCbE2Ef8A;

  // https://goerli-optimism.etherscan.io/address/0x387d311e47e80b498169e6fb51d3193167d89F7D
  address internal constant FAUCET = 0x387d311e47e80b498169e6fb51d3193167d89F7D;

  // https://goerli-optimism.etherscan.io/address/0x19cdecE64EDE475ba0EB114ff4E319d64Ef8ECCf
  address internal constant L2_ENCODER = 0x19cdecE64EDE475ba0EB114ff4E319d64Ef8ECCf;

  // https://goerli-optimism.etherscan.io/address/0x72A9c57cD5E2Ff20450e409cF6A542f1E6c710fc
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x72A9c57cD5E2Ff20450e409cF6A542f1E6c710fc;

  // https://goerli-optimism.etherscan.io/address/0xD2f5680976c86ADd3978b7ad3422Ee5c7690ddb4
  address internal constant UI_POOL_DATA_PROVIDER = 0xD2f5680976c86ADd3978b7ad3422Ee5c7690ddb4;

  // https://goerli-optimism.etherscan.io/address/0x56033E114c61183590d39BA847400F02022Ebe47
  address internal constant WALLET_BALANCE_PROVIDER = 0x56033E114c61183590d39BA847400F02022Ebe47;

  // https://goerli-optimism.etherscan.io/address/0xf556C102F47d806E21E8E78438E58ac06A14A29E
  address internal constant WETH_GATEWAY = 0xf556C102F47d806E21E8E78438E58ac06A14A29E;
}

library AaveV3OptimismGoerliAssets {
  // https://goerli-optimism.etherscan.io/address/0xCD4e0d6D2b1252E2A709B8aE97DBA31164C5a709
  address internal constant DAI_UNDERLYING = 0xCD4e0d6D2b1252E2A709B8aE97DBA31164C5a709;

  uint256 internal constant DAI_DECIMALS = 18;

  // https://goerli-optimism.etherscan.io/address/0x25E84646dF74FB9BCa68Aa8d018F7883ecE4B307
  address internal constant DAI_A_TOKEN = 0x25E84646dF74FB9BCa68Aa8d018F7883ecE4B307;

  // https://goerli-optimism.etherscan.io/address/0x6048286Bd57Fc79b99758348bD0178e189760fe9
  address internal constant DAI_V_TOKEN = 0x6048286Bd57Fc79b99758348bD0178e189760fe9;

  // https://goerli-optimism.etherscan.io/address/0x1A644682E141bC41a9b7dE2fA902D9Dc061F89d3
  address internal constant DAI_S_TOKEN = 0x1A644682E141bC41a9b7dE2fA902D9Dc061F89d3;

  // https://goerli-optimism.etherscan.io/address/0x117B69220bFBA519A3f38a7e9b8529CA92A1A727
  address internal constant DAI_ORACLE = 0x117B69220bFBA519A3f38a7e9b8529CA92A1A727;

  // https://goerli-optimism.etherscan.io/address/0xFf04c1ccF076FDdEb1EE8b80Ef7d9E661A8c65c7
  address internal constant DAI_INTEREST_RATE_STRATEGY = 0xFf04c1ccF076FDdEb1EE8b80Ef7d9E661A8c65c7;

  // https://goerli-optimism.etherscan.io/address/0xBA25de9a7DC623B30799F33B770d31B44c2C3b77
  address internal constant LINK_UNDERLYING = 0xBA25de9a7DC623B30799F33B770d31B44c2C3b77;

  uint256 internal constant LINK_DECIMALS = 18;

  // https://goerli-optimism.etherscan.io/address/0xEf51CEE544Dc4f2046da04656a19a28d5C83BB60
  address internal constant LINK_A_TOKEN = 0xEf51CEE544Dc4f2046da04656a19a28d5C83BB60;

  // https://goerli-optimism.etherscan.io/address/0xCa4f4e3F9CF9bc5E0CBdEd8104CEFee4138b6c23
  address internal constant LINK_V_TOKEN = 0xCa4f4e3F9CF9bc5E0CBdEd8104CEFee4138b6c23;

  // https://goerli-optimism.etherscan.io/address/0xf3642955986AC3D89Fce47e1c4a26923E201f3A0
  address internal constant LINK_S_TOKEN = 0xf3642955986AC3D89Fce47e1c4a26923E201f3A0;

  // https://goerli-optimism.etherscan.io/address/0x08fCD0348C30C80208db530719DF8b9E5AF8F3BA
  address internal constant LINK_ORACLE = 0x08fCD0348C30C80208db530719DF8b9E5AF8F3BA;

  // https://goerli-optimism.etherscan.io/address/0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6
  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6;

  // https://goerli-optimism.etherscan.io/address/0x69529987FA4A075D0C00B0128fa848dc9ebbE9CE
  address internal constant USDC_UNDERLYING = 0x69529987FA4A075D0C00B0128fa848dc9ebbE9CE;

  uint256 internal constant USDC_DECIMALS = 6;

  // https://goerli-optimism.etherscan.io/address/0x99A8acb66c7ED63141b868a603C2337B24f85B22
  address internal constant USDC_A_TOKEN = 0x99A8acb66c7ED63141b868a603C2337B24f85B22;

  // https://goerli-optimism.etherscan.io/address/0x19971adbB2F5d68aE3E7e09C9dF89751d9590ACC
  address internal constant USDC_V_TOKEN = 0x19971adbB2F5d68aE3E7e09C9dF89751d9590ACC;

  // https://goerli-optimism.etherscan.io/address/0x13FCf508A004f069ce43FA66367EdE8b0c666014
  address internal constant USDC_S_TOKEN = 0x13FCf508A004f069ce43FA66367EdE8b0c666014;

  // https://goerli-optimism.etherscan.io/address/0x33D8f262F4EaCf4124A06F0AE30Af5CFb3378f72
  address internal constant USDC_ORACLE = 0x33D8f262F4EaCf4124A06F0AE30Af5CFb3378f72;

  // https://goerli-optimism.etherscan.io/address/0xc2e90fd19999E7Bd8558Af9A96B88af2f320aBB6
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0xc2e90fd19999E7Bd8558Af9A96B88af2f320aBB6;

  // https://goerli-optimism.etherscan.io/address/0x099E6dA9FFF9F0D8873AaD3FB4C9F7eDA5742692
  address internal constant WBTC_UNDERLYING = 0x099E6dA9FFF9F0D8873AaD3FB4C9F7eDA5742692;

  uint256 internal constant WBTC_DECIMALS = 8;

  // https://goerli-optimism.etherscan.io/address/0xa821B2BD2364194d24d3Cd92e0F450B0AD5823d0
  address internal constant WBTC_A_TOKEN = 0xa821B2BD2364194d24d3Cd92e0F450B0AD5823d0;

  // https://goerli-optimism.etherscan.io/address/0x8D420406187Dd7A6A82A07BE17da1f5894177736
  address internal constant WBTC_V_TOKEN = 0x8D420406187Dd7A6A82A07BE17da1f5894177736;

  // https://goerli-optimism.etherscan.io/address/0x53a2F2Ea5768Df4bB45b442F125AC4c52875D2bc
  address internal constant WBTC_S_TOKEN = 0x53a2F2Ea5768Df4bB45b442F125AC4c52875D2bc;

  // https://goerli-optimism.etherscan.io/address/0x774956E09C6725DB04a3C9742bC832cB390e3964
  address internal constant WBTC_ORACLE = 0x774956E09C6725DB04a3C9742bC832cB390e3964;

  // https://goerli-optimism.etherscan.io/address/0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6
  address internal constant WBTC_INTEREST_RATE_STRATEGY =
    0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6;

  // https://goerli-optimism.etherscan.io/address/0x4778caf7b5DBD3934c3906c2909653eB1e0E601f
  address internal constant WETH_UNDERLYING = 0x4778caf7b5DBD3934c3906c2909653eB1e0E601f;

  uint256 internal constant WETH_DECIMALS = 18;

  // https://goerli-optimism.etherscan.io/address/0x18c9297E82dEf404a9472e7F208840Ae8261DFe8
  address internal constant WETH_A_TOKEN = 0x18c9297E82dEf404a9472e7F208840Ae8261DFe8;

  // https://goerli-optimism.etherscan.io/address/0x3d40D0f10E1eC8f313b5D86D0bB6F362d39c16fC
  address internal constant WETH_V_TOKEN = 0x3d40D0f10E1eC8f313b5D86D0bB6F362d39c16fC;

  // https://goerli-optimism.etherscan.io/address/0xeF1494966E5694ba0e8Ce942fC2323D58F1dFb58
  address internal constant WETH_S_TOKEN = 0xeF1494966E5694ba0e8Ce942fC2323D58F1dFb58;

  // https://goerli-optimism.etherscan.io/address/0x59261Da4c82197D7D5EF10De6b6669d6F7AA11b7
  address internal constant WETH_ORACLE = 0x59261Da4c82197D7D5EF10De6b6669d6F7AA11b7;

  // https://goerli-optimism.etherscan.io/address/0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6;

  // https://goerli-optimism.etherscan.io/address/0xf79129ae303764D79287FfF0c857003E95fC1506
  address internal constant USDT_UNDERLYING = 0xf79129ae303764D79287FfF0c857003E95fC1506;

  uint256 internal constant USDT_DECIMALS = 6;

  // https://goerli-optimism.etherscan.io/address/0x053Ac73bCD255525123872E2248a06C9794f29c7
  address internal constant USDT_A_TOKEN = 0x053Ac73bCD255525123872E2248a06C9794f29c7;

  // https://goerli-optimism.etherscan.io/address/0x9299Ae681F85cC9238542dD6445021A8cf6FE9D6
  address internal constant USDT_V_TOKEN = 0x9299Ae681F85cC9238542dD6445021A8cf6FE9D6;

  // https://goerli-optimism.etherscan.io/address/0xa1Ba2438620B24D2CEa57ee6b99045c083B1AcD9
  address internal constant USDT_S_TOKEN = 0xa1Ba2438620B24D2CEa57ee6b99045c083B1AcD9;

  // https://goerli-optimism.etherscan.io/address/0x96CE8a757B79509e9DCF934477E3E3e09Dbc104e
  address internal constant USDT_ORACLE = 0x96CE8a757B79509e9DCF934477E3E3e09Dbc104e;

  // https://goerli-optimism.etherscan.io/address/0xc2e90fd19999E7Bd8558Af9A96B88af2f320aBB6
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0xc2e90fd19999E7Bd8558Af9A96B88af2f320aBB6;

  // https://goerli-optimism.etherscan.io/address/0x20288ac1Ef7711448DF03283E6B580710E73393a
  address internal constant AAVE_UNDERLYING = 0x20288ac1Ef7711448DF03283E6B580710E73393a;

  uint256 internal constant AAVE_DECIMALS = 18;

  // https://goerli-optimism.etherscan.io/address/0x79655b4d49d52fEDB9503A20a55ef5762dA17B18
  address internal constant AAVE_A_TOKEN = 0x79655b4d49d52fEDB9503A20a55ef5762dA17B18;

  // https://goerli-optimism.etherscan.io/address/0x5ba1a19f22f8fDC3B35Cc7435f1615215B19956A
  address internal constant AAVE_V_TOKEN = 0x5ba1a19f22f8fDC3B35Cc7435f1615215B19956A;

  // https://goerli-optimism.etherscan.io/address/0x3144b11E02eBD9f2843186d2c36f9c1C3606134B
  address internal constant AAVE_S_TOKEN = 0x3144b11E02eBD9f2843186d2c36f9c1C3606134B;

  // https://goerli-optimism.etherscan.io/address/0xB054425E0Eda0Fd52d08f0C817034Bc48B6d35EC
  address internal constant AAVE_ORACLE = 0xB054425E0Eda0Fd52d08f0C817034Bc48B6d35EC;

  // https://goerli-optimism.etherscan.io/address/0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6
  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x3A2609560Deb92EAb6340DEad35CE6567F9C67B6;

  // https://goerli-optimism.etherscan.io/address/0xC21D17E8E839C1286BBaa297d932AE9b33d7985b
  address internal constant SUSD_UNDERLYING = 0xC21D17E8E839C1286BBaa297d932AE9b33d7985b;

  uint256 internal constant SUSD_DECIMALS = 18;

  // https://goerli-optimism.etherscan.io/address/0xaf68aDbd3d8BBaC6c59c32490c01Cf8F6dB1adAE
  address internal constant SUSD_A_TOKEN = 0xaf68aDbd3d8BBaC6c59c32490c01Cf8F6dB1adAE;

  // https://goerli-optimism.etherscan.io/address/0xd9811Fd06C3b086314927272b72DbDd98AA9E6A5
  address internal constant SUSD_V_TOKEN = 0xd9811Fd06C3b086314927272b72DbDd98AA9E6A5;

  // https://goerli-optimism.etherscan.io/address/0xfb30ADd5184b79fDCF6f56a70d5A7899a3C77385
  address internal constant SUSD_S_TOKEN = 0xfb30ADd5184b79fDCF6f56a70d5A7899a3C77385;

  // https://goerli-optimism.etherscan.io/address/0x34A3919db9CFB2eD29Da9E76747e70449e138A69
  address internal constant SUSD_ORACLE = 0x34A3919db9CFB2eD29Da9E76747e70449e138A69;

  // https://goerli-optimism.etherscan.io/address/0xc2e90fd19999E7Bd8558Af9A96B88af2f320aBB6
  address internal constant SUSD_INTEREST_RATE_STRATEGY =
    0xc2e90fd19999E7Bd8558Af9A96B88af2f320aBB6;
}
