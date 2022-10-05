// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

library AaveV3ArbitrumGoerli {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0xF8aa90E66B8BAe13f2e4aDe6104abAb8eeDaBfdc);

    IPool internal constant POOL =
        IPool(0x6Cbb4E8eC402E07fDF96DbbC6c752aCfB0eB6075);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x279Dd50e124D45bDeDCF408849937A4985e56dD2);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x86b4D2636EC473AC4A5dD83Fc2BEDa98845249A7);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0xce3Aa85237C075d2102b7B35079d305307D745C8);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xe8599F3cc5D38a9aD6F3684cd5CEa72f10Dbc383);

    address internal constant ACL_ADMIN =
        0x4365F8e70CF38C6cA67DE41448508F2da8825500;

    address internal constant COLLECTOR =
        0xad848879F9Ac276BdB7D38123F381C692FD6D6dE;

    ICollector internal constant COLLECTOR_CONTROLLER =
        ICollector(0xff01517f8811E532900a46e6AdB4484BDB3f2B8a);

    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0xCf9C57744E10495490cB873612Db709417cFe4f4;

    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0x60bD8be38855AAd1459E958dC921ed5bbb5E3292;

    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x0aadeE9418641b5749e872eDEF9844200143865D;

    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x6A83d738fCBaB0c3973234AC7b7b4f7DDa2aD248;
}
