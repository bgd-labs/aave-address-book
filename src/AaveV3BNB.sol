// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';
import {ICollector} from './common/ICollector.sol';

library AaveV3BNB {
  // https://bscscan.com/address/0xff75B6da14FfbbfD355Daf7a2731456b3562Ba6D
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xff75B6da14FfbbfD355Daf7a2731456b3562Ba6D);

  // https://bscscan.com/address/0x6807dc923806fE8Fd134338EABCA509979a7e0cB
  IPool internal constant POOL = IPool(0x6807dc923806fE8Fd134338EABCA509979a7e0cB);

  // https://bscscan.com/address/0x67bdF23C7fCE7C65fF7415Ba3F2520B45D6f9584
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x67bdF23C7fCE7C65fF7415Ba3F2520B45D6f9584);

  // https://bscscan.com/address/0x39bc1bfDa2130d6Bb6DBEfd366939b4c7aa7C697
  IAaveOracle internal constant ORACLE = IAaveOracle(0x39bc1bfDa2130d6Bb6DBEfd366939b4c7aa7C697);

  // https://bscscan.com/address/0x9390B1735def18560c509E2d0bc090E9d6BA257a
  address internal constant ACL_ADMIN = 0x9390B1735def18560c509E2d0bc090E9d6BA257a;

  // https://bscscan.com/address/0x2D97F8FA96886Fd923c065F5457F9DDd494e3877
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x2D97F8FA96886Fd923c065F5457F9DDd494e3877);

  // https://bscscan.com/address/0x23dF2a19384231aFD114b036C14b6b03324D79BC
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x23dF2a19384231aFD114b036C14b6b03324D79BC);

  // https://bscscan.com/address/0xE498675A3dd5aB2Cab72986dc7AA9B2AE87Acec4
  address internal constant POOL_IMPL = 0xE498675A3dd5aB2Cab72986dc7AA9B2AE87Acec4;

  // https://bscscan.com/address/0x4816b2C2895f97fB918f1aE7Da403750a0eE372e
  address internal constant POOL_CONFIGURATOR_IMPL = 0x4816b2C2895f97fB918f1aE7Da403750a0eE372e;

  // https://bscscan.com/address/0xC206C2764A9dBF27d599613b8F9A63ACd1160ab4
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xC206C2764A9dBF27d599613b8F9A63ACd1160ab4;

  // https://bscscan.com/address/0x6eD1c70aa357fB8a7e1Eac85aa59e33287Df8f85
  address internal constant EMISSION_MANAGER = 0x6eD1c70aa357fB8a7e1Eac85aa59e33287Df8f85;

  // https://bscscan.com/address/0x25Ec457d1778b0E5316e7f38f3c22baF413F1A8C
  ICollector internal constant COLLECTOR = ICollector(0x25Ec457d1778b0E5316e7f38f3c22baF413F1A8C);

  // https://bscscan.com/address/0x6c23bAF050ec192afc0B967a93b83e6c5405df43
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x6c23bAF050ec192afc0B967a93b83e6c5405df43;

  // https://bscscan.com/address/0x777fBA024bA1228fDa76149A4ff8B23475ed057D
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x777fBA024bA1228fDa76149A4ff8B23475ed057D;

  // https://bscscan.com/address/0x971F1C94b139AdEdedA729DA636e2B0C433Ff595
  address internal constant CAPS_PLUS_RISK_STEWARD = 0x971F1C94b139AdEdedA729DA636e2B0C433Ff595;

  // https://bscscan.com/address/0x45918bB1D3F73904a30Ffc3eD11CdB1c05eBF726
  address internal constant RISK_STEWARD = 0x45918bB1D3F73904a30Ffc3eD11CdB1c05eBF726;

  // https://bscscan.com/address/0x83f15Bc50d1A212576B202f80489502a7cc10412
  address internal constant FREEZING_STEWARD = 0x83f15Bc50d1A212576B202f80489502a7cc10412;

  // https://bscscan.com/address/0x5d4D4007A4c6336550DdAa2a7c0d5e7972eebd16
  address internal constant DEBT_SWAP_ADAPTER = 0x5d4D4007A4c6336550DdAa2a7c0d5e7972eebd16;

  // https://bscscan.com/address/0x2ecC4F6CDbe6ea77107dd131Af81ec82Db330d6b
  address internal constant CONFIG_ENGINE = 0x2ecC4F6CDbe6ea77107dd131Af81ec82Db330d6b;

  // https://bscscan.com/address/0x117684358D990E42Eb1649E7e8C4691951dc1E71
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x117684358D990E42Eb1649E7e8C4691951dc1E71;

  // https://bscscan.com/address/0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9
  address internal constant REPAY_WITH_COLLATERAL_ADAPTER =
    0x5598BbFA2f4fE8151f45bBA0a3edE1b54B51a0a9;

  // https://bscscan.com/address/0x33E0b3fc976DC9C516926BA48CfC0A9E10a2aAA5
  address internal constant SWAP_COLLATERAL_ADAPTER = 0x33E0b3fc976DC9C516926BA48CfC0A9E10a2aAA5;

  // https://bscscan.com/address/0x1236010CECea55998384e795B59815D871f5f94d
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x1236010CECea55998384e795B59815D871f5f94d;

  // https://bscscan.com/address/0x78F8Bd884C3D738B74B420540659c82f392820e0
  address internal constant UI_POOL_DATA_PROVIDER = 0x78F8Bd884C3D738B74B420540659c82f392820e0;

  // https://bscscan.com/address/0x36616cf17557639614c1cdDb356b1B83fc0B2132
  address internal constant WALLET_BALANCE_PROVIDER = 0x36616cf17557639614c1cdDb356b1B83fc0B2132;

  // https://bscscan.com/address/0xe63eAf6DAb1045689BD3a332bC596FfcF54A5C88
  address internal constant WETH_GATEWAY = 0xe63eAf6DAb1045689BD3a332bC596FfcF54A5C88;

  // https://bscscan.com/address/0x5E2d083417D12d4B0824E14Ecd48D26831F4Da7D
  address internal constant WITHDRAW_SWAP_ADAPTER = 0x5E2d083417D12d4B0824E14Ecd48D26831F4Da7D;

  // https://bscscan.com/address/0x326aB0868bD279382Be2DF5E228Cb8AF38649AB4
  address internal constant STATIC_A_TOKEN_FACTORY = 0x326aB0868bD279382Be2DF5E228Cb8AF38649AB4;
}

library AaveV3BNBAssets {
  // https://bscscan.com/address/0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82
  address internal constant Cake_UNDERLYING = 0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82;

  uint8 internal constant Cake_DECIMALS = 18;

  // https://bscscan.com/address/0x4199CC1F5ed0d796563d7CcB2e036253E2C18281
  address internal constant Cake_A_TOKEN = 0x4199CC1F5ed0d796563d7CcB2e036253E2C18281;

  // https://bscscan.com/address/0xE20dBC7119c635B1B51462f844861258770e0699
  address internal constant Cake_V_TOKEN = 0xE20dBC7119c635B1B51462f844861258770e0699;

  // https://bscscan.com/address/0xB6064eD41d4f67e353768aA239cA86f4F73665a1
  address internal constant Cake_ORACLE = 0xB6064eD41d4f67e353768aA239cA86f4F73665a1;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant Cake_INTEREST_RATE_STRATEGY =
    0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x3854354CE3681da1D7F550073061E92a4a7d1B27
  address internal constant Cake_STATIC_A_TOKEN = 0x3854354CE3681da1D7F550073061E92a4a7d1B27;

  // https://bscscan.com/address/0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
  address internal constant WBNB_UNDERLYING = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;

  uint8 internal constant WBNB_DECIMALS = 18;

  // https://bscscan.com/address/0x9B00a09492a626678E5A3009982191586C444Df9
  address internal constant WBNB_A_TOKEN = 0x9B00a09492a626678E5A3009982191586C444Df9;

  // https://bscscan.com/address/0x0E76414d433ddfe8004d2A7505d218874875a996
  address internal constant WBNB_V_TOKEN = 0x0E76414d433ddfe8004d2A7505d218874875a996;

  // https://bscscan.com/address/0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE
  address internal constant WBNB_ORACLE = 0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant WBNB_INTEREST_RATE_STRATEGY =
    0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x436baCb4C66583de4Cb16e13a1A0D9A3075DE425
  address internal constant WBNB_STATIC_A_TOKEN = 0x436baCb4C66583de4Cb16e13a1A0D9A3075DE425;

  // https://bscscan.com/address/0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c
  address internal constant BTCB_UNDERLYING = 0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c;

  uint8 internal constant BTCB_DECIMALS = 18;

  // https://bscscan.com/address/0x56a7ddc4e848EbF43845854205ad71D5D5F72d3D
  address internal constant BTCB_A_TOKEN = 0x56a7ddc4e848EbF43845854205ad71D5D5F72d3D;

  // https://bscscan.com/address/0x7b1E82F4f542fbB25D64c5523Fe3e44aBe4F2702
  address internal constant BTCB_V_TOKEN = 0x7b1E82F4f542fbB25D64c5523Fe3e44aBe4F2702;

  // https://bscscan.com/address/0x264990fbd0A4796A3E3d8E37C4d5F87a3aCa5Ebf
  address internal constant BTCB_ORACLE = 0x264990fbd0A4796A3E3d8E37C4d5F87a3aCa5Ebf;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant BTCB_INTEREST_RATE_STRATEGY =
    0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x1F66b530084079d35478A069d9c4424F9c9C320c
  address internal constant BTCB_STATIC_A_TOKEN = 0x1F66b530084079d35478A069d9c4424F9c9C320c;

  // https://bscscan.com/address/0x2170Ed0880ac9A755fd29B2688956BD959F933F8
  address internal constant ETH_UNDERLYING = 0x2170Ed0880ac9A755fd29B2688956BD959F933F8;

  uint8 internal constant ETH_DECIMALS = 18;

  // https://bscscan.com/address/0x2E94171493fAbE316b6205f1585779C887771E2F
  address internal constant ETH_A_TOKEN = 0x2E94171493fAbE316b6205f1585779C887771E2F;

  // https://bscscan.com/address/0x8FDea7891b4D6dbdc746309245B316aF691A636C
  address internal constant ETH_V_TOKEN = 0x8FDea7891b4D6dbdc746309245B316aF691A636C;

  // https://bscscan.com/address/0x9ef1B8c0E4F7dc8bF5719Ea496883DC6401d5b2e
  address internal constant ETH_ORACLE = 0x9ef1B8c0E4F7dc8bF5719Ea496883DC6401d5b2e;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant ETH_INTEREST_RATE_STRATEGY = 0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x52077433fB7053D747E2846aD0C18ff5015C368E
  address internal constant ETH_STATIC_A_TOKEN = 0x52077433fB7053D747E2846aD0C18ff5015C368E;

  // https://bscscan.com/address/0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d
  address internal constant USDC_UNDERLYING = 0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d;

  uint8 internal constant USDC_DECIMALS = 18;

  // https://bscscan.com/address/0x00901a076785e0906d1028c7d6372d247bec7d61
  address internal constant USDC_A_TOKEN = 0x00901a076785e0906d1028c7d6372d247bec7d61;

  // https://bscscan.com/address/0xcDBBEd5606d9c5C98eEedd67933991dC17F0c68d
  address internal constant USDC_V_TOKEN = 0xcDBBEd5606d9c5C98eEedd67933991dC17F0c68d;

  // https://bscscan.com/address/0xaFcFF74AE956f4c23c27Db49659D4a7F350415C1
  address internal constant USDC_ORACLE = 0xaFcFF74AE956f4c23c27Db49659D4a7F350415C1;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x3906cDdfb781f02B21f21BD81ed7Fd8DC37075E1
  address internal constant USDC_STATIC_A_TOKEN = 0x3906cDdfb781f02B21f21BD81ed7Fd8DC37075E1;

  // https://bscscan.com/address/0x55d398326f99059fF775485246999027B3197955
  address internal constant USDT_UNDERLYING = 0x55d398326f99059fF775485246999027B3197955;

  uint8 internal constant USDT_DECIMALS = 18;

  // https://bscscan.com/address/0xa9251ca9DE909CB71783723713B21E4233fbf1B1
  address internal constant USDT_A_TOKEN = 0xa9251ca9DE909CB71783723713B21E4233fbf1B1;

  // https://bscscan.com/address/0xF8bb2Be50647447Fb355e3a77b81be4db64107cd
  address internal constant USDT_V_TOKEN = 0xF8bb2Be50647447Fb355e3a77b81be4db64107cd;

  // https://bscscan.com/address/0x0F682319Ed4A240b7a2599A48C965049515D9bC3
  address internal constant USDT_ORACLE = 0x0F682319Ed4A240b7a2599A48C965049515D9bC3;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant USDT_INTEREST_RATE_STRATEGY =
    0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x0471D185cc7Be61E154277cAB2396cD397663da6
  address internal constant USDT_STATIC_A_TOKEN = 0x0471D185cc7Be61E154277cAB2396cD397663da6;

  // https://bscscan.com/address/0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409
  address internal constant FDUSD_UNDERLYING = 0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409;

  uint8 internal constant FDUSD_DECIMALS = 18;

  // https://bscscan.com/address/0x75bd1A659bdC62e4C313950d44A2416faB43E785
  address internal constant FDUSD_A_TOKEN = 0x75bd1A659bdC62e4C313950d44A2416faB43E785;

  // https://bscscan.com/address/0xE628B8a123e6037f1542e662B9F55141a16945C8
  address internal constant FDUSD_V_TOKEN = 0xE628B8a123e6037f1542e662B9F55141a16945C8;

  // https://bscscan.com/address/0x60a117Fa5bAbee4d645884fB11E413Da4F893b6D
  address internal constant FDUSD_ORACLE = 0x60a117Fa5bAbee4d645884fB11E413Da4F893b6D;

  // https://bscscan.com/address/0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5
  address internal constant FDUSD_INTEREST_RATE_STRATEGY =
    0x86AB1C62A8bf868E1b3E1ab87d587Aba6fbCbDC5;

  // https://bscscan.com/address/0x4d074aAa0821073dA827f7bf6a02cF905b394ed0
  address internal constant FDUSD_STATIC_A_TOKEN = 0x4d074aAa0821073dA827f7bf6a02cF905b394ed0;
}

library AaveV3BNBEModes {}

library AaveV3BNBExternalLibraries {
  // https://bscscan.com/address/0xb32381feFFF45eE9F47fD2f2cF83C832637d6EF0
  address internal constant FLASHLOAN_LOGIC = 0xb32381feFFF45eE9F47fD2f2cF83C832637d6EF0;

  // https://bscscan.com/address/0x4c52FE2162200bf26c314d7bbd8611699139d553
  address internal constant BORROW_LOGIC = 0x4c52FE2162200bf26c314d7bbd8611699139d553;

  // https://bscscan.com/address/0x97dCbFaE5372A63128F141E8C0BC2c871Ca5F604
  address internal constant BRIDGE_LOGIC = 0x97dCbFaE5372A63128F141E8C0BC2c871Ca5F604;

  // https://bscscan.com/address/0x88F864670De467aA73CD45325F9652C578C8AB85
  address internal constant E_MODE_LOGIC = 0x88F864670De467aA73CD45325F9652C578C8AB85;

  // https://bscscan.com/address/0x80d16970B31243Fe67DaB028115f3E4c3E3510Ad
  address internal constant LIQUIDATION_LOGIC = 0x80d16970B31243Fe67DaB028115f3E4c3E3510Ad;

  // https://bscscan.com/address/0xA58FB47bE9074828215A173564C0CD10f6F249bf
  address internal constant POOL_LOGIC = 0xA58FB47bE9074828215A173564C0CD10f6F249bf;

  // https://bscscan.com/address/0x2b22E425C1322fbA0DbF17bb1dA25d71811EE7ba
  address internal constant SUPPLY_LOGIC = 0x2b22E425C1322fbA0DbF17bb1dA25d71811EE7ba;
}
