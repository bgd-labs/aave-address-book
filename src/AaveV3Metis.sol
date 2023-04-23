// SPDX-License-Identifier: MIT
// TODO: Manually added, need to fix the generator scripts
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager} from './AaveV3.sol';

library AaveV3Metis {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xB9FABd7500B2C6781c35Dd48d54f81fc2299D7AF);

  IPool internal constant POOL = IPool(0x90df02551bB792286e8D4f13E0e357b4Bf1D6a57);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x69FEE8F261E004453BE0800BC9039717528645A6);

  IAaveOracle internal constant ORACLE = IAaveOracle(0x38D36e85E47eA6ff0d18B0adF12E5fC8984A6f8e);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x99411FC17Ad1B56f49719E3850B2CDcc0f9bBFd8);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xcDCb65fc657B701a5100a12eFB663978E7e8fFB8);

  address internal constant ACL_ADMIN = 0x8EC77963068474a45016938Deb95E603Ca82a029;

  address internal constant COLLECTOR = 0xB5b64c7E00374e766272f8B442Cd261412D4b118;

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x30C1b8F0490fa0908863d6Cbd2E36400b4310A6B;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x246405C70461f93513C74606815615c24c5C8C79;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xE7fA271BD76FC9c6F2F968976E9f4f553256E02f;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x52aC2476Fc6F788B4c5A9B12Cfcb7fDB163955f4;

  address internal constant EMISSION_MANAGER = 0xfDb2580A1ac4CDc67E4236738b28af59e2022Dd2;

  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x9E7B73ffD9D2026F3ff4212c29E209E09C8A91F5;

  address internal constant RATES_FACTORY = 0x87Aaba7cf8e1F319d0E3402d68017171201dEcd5;

  address internal constant LISTING_ENGINE = 0x857720ad258db0ACb180e76A5526c72CFCe6F8A7;

  address internal constant WALLET_BALANCE_PROVIDER = 0x1df710eb1E2FD9C21494aF2BFb1F210a4185885b;

  address internal constant UI_POOL_DATA_PROVIDER = 0x7dd60bd8507fDC3d300d53427b7AE566701a7320;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0x3e7BC5EcE0f22DbB16c3e3EeA288a10A57d68927;

  address internal constant L2_ENCODER = 0x9f3A1B399A9074eBA63Dc4fc274bE2A2b2d80cB9;

}

library AaveV3MetisAssets {

}
