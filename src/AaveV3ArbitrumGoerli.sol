// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';

library AaveV3ArbitrumGoerli {
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0x4EEE0BB72C2717310318f27628B3c8a708E4951C);

  IPool internal constant POOL = IPool(0xeAA2F46aeFd7BDe8fB91Df1B277193079b727655);

  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x8bf6ed3FDa90c4111E491D2BDdd57589Ffb0c161);

  IAaveOracle internal constant ORACLE = IAaveOracle(0xaEA17ddD7cEDD233f851e1cFd2cBca42F488772d);

  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0x2Fc0604AE02FA8AB833f135B0C01dFa45f88DAa2);

  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xb8141857d82eC821141c17FA74dfeF062EB8594D);

  address internal constant ACL_ADMIN = 0xfA0e305E0f46AB04f00ae6b5f4560d61a2183E00;

  address internal constant COLLECTOR = 0x0b6d37C5dCC56c50EA13991C8B95f9c898aA2172;

  ICollector internal constant COLLECTOR_CONTROLLER =
    ICollector(0xe7999aBDF90cD4b040C1107C14F2F430E818FE45);

  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x82F8904357Ba2fb7e7Cf6dcAA277289bF4481D7D;

  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x0aAFea73B7099a3C612dEDAACeB861FAE15fd207;

  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x9734b9BE76885FF2806963cE49c6a74dBF166EE3;

  address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
    0x0D1CB66809dC0044f91816065eF45B6CbCF70a11;

  address internal constant EMISSION_MANAGER = 0x9BDf15A56a03A542eA588137233013aBC5A4B98a;

  address internal constant WETH_GATEWAY = 0xBCca2fc5F30A65cE2155d739364f3fc8F57E6999;

  address internal constant FAUCET = 0x0E0effeEFD42C108288b0EcDDc901222a4149e08;

  address internal constant WALLET_BALANCE_PROVIDER = 0x39fDBFDBF1127F31F485a1228D44010F5130cCAC;

  address internal constant UI_POOL_DATA_PROVIDER = 0x583F04c0C4BDE3D7706e939F3Ea890Be9A20A5CF;

  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xB9107870a2e22b9cd4B51ED5483212Cb9eAE0329;
}
