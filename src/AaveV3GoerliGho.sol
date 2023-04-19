// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3GoerliGho {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x4dd5ab8Fb385F2e12aDe435ba7AFA812F1d364D0);

  IPool internal constant POOL = IPool(0x617Cf26407193E32a771264fB5e9b8f09715CdfB);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x04eA6B2a9E82Bd58bC95B8eA2b90496356dD969F);

  IAaveOracle internal constant ORACLE = IAaveOracle(0xcb601629B36891c43943e3CDa2eB18FAc38B5c4e);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xB7d8ff9949dB06D8387C28332045b8F734641755);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x9C94757E231AdF6c90f89259DFA0841a1bf8172f);

  address internal constant ACL_ADMIN = 0x2892e37624Ec31CC42502f297821109700270971;

  ICollector internal constant COLLECTOR = 0x1A47958e231848C664863D213bC27b018934477D;

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x8688FEF353f4940061b4893d563de1C487Aa92Fd;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x877880d5E01b483add2f3223B709a26b622F0852;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x46Dbc9aeF756a594a61fcbB35902F24103044cBf;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xAc08Af18C2E9b7B62facacd048d2F89a25024474;

  address internal constant EMISSION_MANAGER = 0xC9f3b10c05a3e2a49F8165AC29b9275f85DE06cD;

  address internal constant WETH_GATEWAY = 0x9c402E3b0D123323F0FCed781b8184Ec7E02Dd31;

  address internal constant FAUCET = 0x1265305F033156bbF8Ba54fE45DD5685BEc4Cc44;

  address internal constant WALLET_BALANCE_PROVIDER = 0x03C8d0c46834921c4468C15A03E5d76Ae5CA3133;

  address internal constant UI_POOL_DATA_PROVIDER = 0x3De59b6901e7Ad0A19621D49C5b52cC9a4977e52;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xF67B25977cEFf3563BF7F24A531D6CEAe6870a9d;
}

library AaveV3GoerliGhoAssets {
  address internal constant AAVE_UNDERLYING = 0xE205181Eb3D7415f15377F79aA7769F846cE56DD;

  address internal constant AAVE_A_TOKEN = 0xAC4D92980562Ac11Af46C6C7CEdD7C819C2028D0;

  address internal constant AAVE_V_TOKEN = 0xCB62E1d181179d1D86D3877e221D1EdE0bDD8841;

  address internal constant AAVE_S_TOKEN = 0x1721dDa383B02ec058Ee7B47596F61246eAD0069;

  address internal constant AAVE_ORACLE = 0xFAa450873a4b162D32f545a85e678C13Ca8d4Ae9;

  address internal constant AAVE_INTEREST_RATE_STRATEGY =
    0x13Bdaf61b68b917114D4A356c2098D703D4C4aB7;

  address internal constant DAI_UNDERLYING = 0xD77b79BE3e85351fF0cbe78f1B58cf8d1064047C;

  address internal constant DAI_A_TOKEN = 0x7402b9625D1712426807952b798e3180dC38876F;

  address internal constant DAI_V_TOKEN = 0x76f5D888234e88599c12D46A2a55Fece923cf48c;

  address internal constant DAI_S_TOKEN = 0x00b5314dcDA79F235a9EDE5dA53e63A9747c3f22;

  address internal constant DAI_ORACLE = 0x3D9069811D8ABFaFBf16Fa07FC875E39D4dd29DA;

  address internal constant DAI_INTEREST_RATE_STRATEGY = 0x4218E9D70F2fc2C44745E33DbfA7f7E90b19C783;

  address internal constant USDC_UNDERLYING = 0x69305b943C6F55743b2Ece5c0b20507300a39FC3;

  address internal constant USDC_A_TOKEN = 0xdC916609281306558E0e8245bFBf90EFd3eCAb96;

  address internal constant USDC_V_TOKEN = 0x908636F60d276a3b30C13F300065E1Cf43bf49cf;

  address internal constant USDC_S_TOKEN = 0x8117853a7Ecf500b27f5e5901c326B3840E58784;

  address internal constant USDC_ORACLE = 0xb56b714beF6892Bb4b1C342557bb6a1dD3Cb8cb7;

  address internal constant USDC_INTEREST_RATE_STRATEGY =
    0xD740CB1d7c48795E32AcbA5c6A6b6E9ACBdD33F0;

  address internal constant WETH_UNDERLYING = 0x84ced17d95F3EC7230bAf4a369F1e624Ae60090d;

  address internal constant WETH_A_TOKEN = 0x49871B521E44cb4a34b2bF2cbCF03C1CF895C48b;

  address internal constant WETH_V_TOKEN = 0x86065184932b2e2E7bC2BC953Cd3d131d2497cDe;

  address internal constant WETH_S_TOKEN = 0xCEa68d3acD31b0d9d5E52f15Ce2662592C24aFc9;

  address internal constant WETH_ORACLE = 0xD54126c116372F2D524eCfc8831E936C999a894B;

  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0xb7a2685Fc117581309cA58dE166BEc2Df6b17a49;

  address internal constant LINK_UNDERLYING = 0x2166903C38B4883B855eA2C77A02430a27Cdfede;

  address internal constant LINK_A_TOKEN = 0x601c61Fc4eEe64a4b1f5201125b788dc1585746b;

  address internal constant LINK_V_TOKEN = 0x91eFc3Ff5fBD2f9b2aE8880Bb1d52Db3e01A261d;

  address internal constant LINK_S_TOKEN = 0x98413Db84158e6f4dEaa0F4d098240a7FdfA7060;

  address internal constant LINK_ORACLE = 0x1445d6061cd1Bf04b8301292f25E1D7d027CdE04;

  address internal constant LINK_INTEREST_RATE_STRATEGY =
    0x13Bdaf61b68b917114D4A356c2098D703D4C4aB7;

  address internal constant GHO_UNDERLYING = 0xcbE9771eD31e761b744D3cB9eF78A1f32DD99211;

  address internal constant GHO_A_TOKEN = 0xdC25729a09241d24c4228f1a0C27137770cF363e;

  address internal constant GHO_V_TOKEN = 0x80aa933EfF12213022Fd3d17c2c59C066cBb91c7;

  address internal constant GHO_S_TOKEN = 0xEe27a567B18ef957dd2BFBE027F09Ea3ecC35722;

  address internal constant GHO_ORACLE = 0xDD714B0A68b9c81C6878688c5dc6238f8AC8eadD;

  address internal constant GHO_INTEREST_RATE_STRATEGY = 0xa0b2a67C9AE5f52201DA9cBe03866D3f5cd725AF;
}
