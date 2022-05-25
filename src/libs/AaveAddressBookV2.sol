// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle} from "./AaveV2.sol";

library AaveAddressBookV2 {
    string public constant AaveV2Kovan = 'AaveV2Kovan';
    string public constant AaveV2Eth = 'AaveV2Eth';
    string public constant AaveV2KovanAMM = 'AaveV2KovanAMM';
    string public constant AaveV2EthAMM = 'AaveV2EthAMM';
    string public constant AaveV2Mumbai = 'AaveV2Mumbai';
    string public constant AaveV2Polygon = 'AaveV2Polygon';
    string public constant AaveV2Fuji = 'AaveV2Fuji';
    string public constant AaveV2Avalanche = 'AaveV2Avalanche';


    struct Market {
        ILendingPoolAddressesProvider POOL_ADDRESSES_PROVIDER;
        ILendingPool POOL;
        ILendingPoolConfigurator POOL_CONFIGURATOR;
        IAaveOracle ORACLE;
        address POOL_ADMIN;
        address EMERGENCY_ADMIN;
    }

    function getMarket(string calldata market) public pure returns(Market memory m) {
        if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2Kovan)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0x88757f2f99175387aB4C6a4b3067c77A695b0349
                ),
                ILendingPool(0xE0fBa4Fc209b4948668006B2bE61711b7f465bAe),
                ILendingPoolConfigurator(0x25D0106aaB3F906F00C1E59716Bb5F749dB12ccE),
                IAaveOracle(0xB8bE51E6563BB312Cbb2aa26e352516c25c26ac1),
                0x85e4A467343c0dc4aDAB74Af84448D9c45D8ae6F,
                0xc6cfB8bCA4691f661773fACc64E47A4eBaEd712f
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2Eth)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5
                ),
                ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9),
                ILendingPoolConfigurator(0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756),
                IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9),
                0xEE56e2B3D491590B5b31738cC34d5232F378a8D5,
                0xCA76Ebd8617a03126B6FB84F9b1c1A0fB71C2633
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2KovanAMM)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0x67FB118A780fD740C8936511947cC4bE7bb7730c
                ),
                ILendingPool(0x762E2a3BBe729240ea44D31D5a81EAB44d34ef01),
                ILendingPoolConfigurator(0x94837E841d9D792a11658e113e4ffBFCeb4CFf4b),
                IAaveOracle(0x8FB777d67e9945E2c01936E319057F9d41D559e6),
                0x85e4A467343c0dc4aDAB74Af84448D9c45D8ae6F,
                0xc6cfB8bCA4691f661773fACc64E47A4eBaEd712f
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2EthAMM)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5
                ),
                ILendingPool(0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB),
                ILendingPoolConfigurator(0x23A875eDe3F1030138701683e42E9b16A7F87768),
                IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9),
                0xEE56e2B3D491590B5b31738cC34d5232F378a8D5,
                0xB9062896ec3A615a4e4444DF183F0531a77218AE
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2Mumbai)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0x178113104fEcbcD7fF8669a0150721e231F0FD4B
                ),
                ILendingPool(0x9198F13B08E299d85E096929fA9781A1E3d5d827),
                ILendingPoolConfigurator(0xc3c37E2aA3dc66464fa3C29ce2a6EC85beFC45e1),
                IAaveOracle(0xC365C653f7229894F93994CD0b30947Ab69Ff1D5),
                0x943E44157dC0302a5CEb172374d1749018a00994,
                0x943E44157dC0302a5CEb172374d1749018a00994
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2Polygon)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0xd05e3E715d945B59290df0ae8eF85c1BdB684744
                ),
                ILendingPool(0x8dFf5E27EA6b7AC08EbFdf9eB090F32ee9a30fcf),
                ILendingPoolConfigurator(0x26db2B833021583566323E3b8985999981b9F1F3),
                IAaveOracle(0x0229F777B0fAb107F9591a41d5F02E4e98dB6f2d),
                0xdc9A35B16DB4e126cFeDC41322b3a36454B1F772,
                0x1450F2898D6bA2710C98BE9CAF3041330eD5ae58
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2Fuji)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0x7fdC1FdF79BE3309bf82f4abdAD9f111A6590C0f
                ),
                ILendingPool(0x76cc67FF2CC77821A70ED14321111Ce381C2594D),
                ILendingPoolConfigurator(0x4ceBAFAAcc6Cb26FD90E4cDe138Eb812442bb5f3),
                IAaveOracle(0xfa4f5B081632c4709667D467F817C09d9008A46A),
                0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e,
                0x1128d177BdaA74Ae68EB06e693f4CbA6BF427a5e
            );
        } else if (keccak256(abi.encodePacked((market))) == keccak256(abi.encodePacked((AaveV2Avalanche)))) {
            return Market(
                ILendingPoolAddressesProvider(
                    0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
                ),
                ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C),
                ILendingPoolConfigurator(0x230B618aD4C475393A7239aE03630042281BD86e),
                IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89),
                0x01244E7842254e3FD229CD263472076B1439D1Cd,
                0x01244E7842254e3FD229CD263472076B1439D1Cd
            );
        } else revert('Market does not exist');
    }
}
