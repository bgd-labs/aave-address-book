// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

library AaveV3Ethereum {
  // https://etherscan.io/address/0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2
  address internal constant pool = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;

  // https://etherscan.io/address/0x64b761D848206f447Fe2dd461b0c635Ec39EbB27
  address internal constant poolConfigurator = 0x64b761D848206f447Fe2dd461b0c635Ec39EbB27;

  // https://etherscan.io/address/0x54586bE62E3c3580375aE3723C145253060Ca0C2
  address internal constant oracle = 0x54586bE62E3c3580375aE3723C145253060Ca0C2;

  // https://etherscan.io/address/0x0000000000000000000000000000000000000000
  address internal constant oracleSentinel = 0x0000000000000000000000000000000000000000;

  // https://etherscan.io/address/0xEE56e2B3D491590B5b31738cC34d5232F378a8D5
  address internal constant aclAdmin = 0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

  // https://etherscan.io/address/0xc2aaCf6553D20d1e9d78E365AAba8032af9c85b0
  address internal constant aclManager = 0xc2aaCf6553D20d1e9d78E365AAba8032af9c85b0;

  // https://etherscan.io/address/0x7B4EB56E7CD4b454BA8ff71E4518426369a138a3
  address internal constant poolDataProvider = 0x7B4EB56E7CD4b454BA8ff71E4518426369a138a3;

  // https://etherscan.io/address/0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c
  address internal constant collector = 0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c;

  // https://etherscan.io/address/0x7EfFD7b47Bfd17e52fB7559d3f924201b9DbfF3d
  address internal constant defaultATokenImplementation =
    0x7EfFD7b47Bfd17e52fB7559d3f924201b9DbfF3d;

  uint256 internal constant aTokenRevision = 1;

  // https://etherscan.io/address/0xaC725CB59D16C81061BDeA61041a8A5e73DA9EC6
  address internal constant defaultVariableDebtTokenImplementation =
    0xaC725CB59D16C81061BDeA61041a8A5e73DA9EC6;

  uint256 internal constant variableDebtTokenRevision = 1;

  // https://etherscan.io/address/0x15C5620dfFaC7c7366EED66C20Ad222DDbB1eD57
  address internal constant defaultStableDebtTokenImplementation =
    0x15C5620dfFaC7c7366EED66C20Ad222DDbB1eD57;

  uint256 internal constant stableDebtTokenRevision = 1;

  // https://etherscan.io/address/0x223d844fc4B006D67c0cDbd39371A9F73f69d974
  address internal constant emissionManager = 0x223d844fc4B006D67c0cDbd39371A9F73f69d974;

  // https://etherscan.io/address/0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb
  address internal constant defaultIncentivesController =
    0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb;
}
