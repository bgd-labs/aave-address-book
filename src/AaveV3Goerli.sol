// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3Goerli {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xC911B590248d127aD18546B186cC6B324e99F02c);

  IPool internal constant POOL = IPool(0x7b5C526B7F8dfdff278b4a3e045083FBA4028790);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x3b35da485b4daceFf52d499aa6C14dFE233a51CD);

  IAaveOracle internal constant ORACLE = IAaveOracle(0x9F616c65b5298E24e155E4486e114516BC635b63);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xa41E284482F9923E265832bE59627d91432da76C);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0x30417E3105a111c4e8C697Df66d26fC68d43656F);

  address internal constant ACL_ADMIN = 0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00;

  address internal constant COLLECTOR = 0xF45122b5fcfA72550B8Ed2D48f3aEeFcA1167415;

  ICollector internal constant COLLECTOR_CONTROLLER =
    ICollector(0x2DA49A23658d231b129F43bea4903C3682ab0Ed6);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0xbE540b86E7b61624458ca928e9065e2133dBCA3a;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x1a80eF9C6a2eAD07E8F42FB1CBb426587EEe0D7D;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xB5024bED4fb5ca8D9ea5E8b016FC4dbe50e94a32;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xB8A83A393F08F35A65dF96B3Ca6b1B8841765c8A;

  address internal constant EMISSION_MANAGER = 0xF2F4146c7478f0B0285AdbcB4AcC1EfcAc7564C7;

  address internal constant WETH_GATEWAY = 0x2A498323aCaD2971a8b1936fD7540596dC9BBacD;

  address internal constant FAUCET = 0xA70D8aD6d26931d0188c642A66de3B6202cDc5FA;

  address internal constant WALLET_BALANCE_PROVIDER = 0xe0bb4593f74B804B9aBd9a2Ec6C71663cEE64E29;

  address internal constant UI_POOL_DATA_PROVIDER = 0xb00A75686293Fea5DA122E8361f6815A0B0AF48E;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xf4Ce3624c8D047aF8b069D044f00bF6774B4dEc0;
}
