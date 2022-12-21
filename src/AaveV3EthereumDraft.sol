// SPDX-License-Identifier: MIT
// AUTOGENERATED - DON'T MANUALLY CHANGE
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from "./AaveV3.sol";

library AaveV3EthereumDraft {
    IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        IPoolAddressesProvider(0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e);

    IPool internal constant POOL =
        IPool(0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2);

    IPoolConfigurator internal constant POOL_CONFIGURATOR =
        IPoolConfigurator(0x64b761D848206f447Fe2dd461b0c635Ec39EbB27);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0x54586bE62E3c3580375aE3723C145253060Ca0C2);

    IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IPoolDataProvider(0x7B4EB56E7CD4b454BA8ff71E4518426369a138a3);

    IACLManager internal constant ACL_MANAGER =
        IACLManager(0xc2aaCf6553D20d1e9d78E365AAba8032af9c85b0);

    address internal constant ACL_ADMIN =
        0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

    address internal constant WETH_GATEWAY =
        0x694d4cFdaeE639239df949b6E24Ff8576A00d1f2;
    address internal constant EMISSION_MANAGER =
        0xcAA448c8066f741C3137cEa9758dF3fB377CBF4E;
    address internal constant COLLECTOR_CONTROLLER =
        0x3d569673dAa0575c936c7c67c4E6AedA69CC630C;
    address internal constant COLLECTOR =
        0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c;
    address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x801934c604aBA0C8C46454c67F88A4a45a766a91;
    address internal constant DEFAULT_STABLE_DEBT_TOKEN_IMPL_REV_1 =
        0x2688a209086Ae56e7b3598Ec68A0Cba3B965CD06;
    address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 =
        0xca21517bac12053E7fD6C326EDF89C5cc60d813f;
    address internal constant DEFAULT_INCENTIVES_CONTROLLER =
        0x8164Cc65827dcFe994AB23944CBC90e0aa80bFcb;
}
