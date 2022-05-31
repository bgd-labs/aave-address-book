// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, Token} from "./AaveV3.sol";


library AaveV3Harmony {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(
            0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb
        );

    IPool internal constant POOL =
        IPool(0x794a61358D6845594F94dc1DB02A252b5b4814aD);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x8145eddDf43f50276641b55bd3AD95944510021E);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x3C90887Ede8D65ccb2777A5d577beAb2548280AD);

    address internal constant POOL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;

    address internal constant ACL_ADMIN =
        0xb2f0C5f37f4beD2cB51C44653cD5D84866BDcd2D;

    function getToken(string calldata token) public pure returns(Token memory m) {
              if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("1DAI"))) {
                  return Token(
                    0xEf977d2f931C1978Db5F6747666fa1eACB0d0339,
                    0x0000000000000000000000000000000000000000,
                    0x82E64f49Ed5EC1bC6e43DAD4FC8Af9bb3A2312EE,
                    0xd94112B5B62d53C9402e7A60289c6810dEF1dC9B
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("LINK"))) {
                  return Token(
                    0x218532a12a389a4a92fC0C5Fb22901D1c19198aA,
                    0x0000000000000000000000000000000000000001,
                    0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530,
                    0x89D976629b7055ff1ca02b927BA3e020F22A44e4
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("1USDC"))) {
                  return Token(
                    0x985458E523dB3d53125813eD68c274899e9DfAb4,
                    0x0000000000000000000000000000000000000002,
                    0x625E7708f30cA75bfd92586e17077590C60eb4cD,
                    0x307ffe186F84a3bc2613D1eA417A5737D69A7007
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("1WBTC"))) {
                  return Token(
                    0x3095c7557bCb296ccc6e363DE01b760bA031F2d9,
                    0x0000000000000000000000000000000000000003,
                    0x078f358208685046a11C85e8ad32895DED33A249,
                    0x633b207Dd676331c413D4C013a6294B0FE47cD0e
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("1ETH"))) {
                  return Token(
                    0x6983D1E6DEf3690C4d616b13597A09e6193EA013,
                    0x0000000000000000000000000000000000000004,
                    0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8,
                    0xD8Ad37849950903571df17049516a5CD4cbE55F6
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("1USDT"))) {
                  return Token(
                    0x3C2B8Be99c50593081EAA2A724F0B8285F5aba8f,
                    0x0000000000000000000000000000000000000005,
                    0x6ab707Aca953eDAeFBc4fD23bA73294241490620,
                    0x70eFfc565DB6EEf7B927610155602d31b670e802
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("1AAVE"))) {
                  return Token(
                    0xcF323Aad9E522B93F11c352CaA519Ad0E14eB40F,
                    0x0000000000000000000000000000000000000006,
                    0xf329e36C7bF6E5E86ce2150875a84Ce77f477375,
                    0xfAeF6A702D15428E588d4C0614AEFb4348D83D48
                  );
              } else if (keccak256(abi.encodePacked(token)) == keccak256(abi.encodePacked("WONE"))) {
                  return Token(
                    0xcF664087a5bB0237a0BAd6742852ec6c8d69A27a,
                    0x0000000000000000000000000000000000000007,
                    0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97,
                    0xF15F26710c827DDe8ACBA678682F3Ce24f2Fb56E
                  );
              } else revert('Token does not exist');
    }
}
