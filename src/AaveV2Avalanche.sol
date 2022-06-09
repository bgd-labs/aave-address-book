// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider, Token} from "./AaveV2.sol";

library AaveV2Avalanche {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xb6A86025F0FE1862B372cb0ca18CE3EDe02A318f
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x4F01AeD16D97E3aB5ab2B501154DC9bb0F1A5A2C);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x230B618aD4C475393A7239aE03630042281BD86e);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xdC336Cd4769f4cC7E9d726DA53e6d3fC710cEB89);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x65285E9dfab318f57051ab2b139ccCf232945451);

    address internal constant POOL_ADMIN =
        0x01244E7842254e3FD229CD263472076B1439D1Cd;

    address internal constant EMERGENCY_ADMIN =
        0x01244E7842254e3FD229CD263472076B1439D1Cd;

    function getToken(string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WETH.e")))
        ) {
            return
                Token(
                    0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB,
                    0x53f7c5869a859F0AeC3D334ee8B4Cf01E3492f21,
                    0x60F6A45006323B97d97cB0a42ac39e2b757ADA63,
                    0x4e575CacB37bc1b5afEc68a0462c4165A5268983
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("DAI.e")))
        ) {
            return
                Token(
                    0xd586E7F844cEa2F87f50152665BCbc2C279D8d70,
                    0x47AFa96Cdc9fAb46904A55a6ad4bf6660B53c38a,
                    0x3676E4EE689D527dDb89812B63fAD0B7501772B3,
                    0x1852DC24d1a8956a0B356AA18eDe954c7a0Ca5ae
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDT.e")))
        ) {
            return
                Token(
                    0xc7198437980c041c805A1EDcbA50c1Ce5db95118,
                    0x532E6537FEA298397212F09A61e03311686f548e,
                    0x9c7B81A867499B7387ed05017a13d4172a0c17bF,
                    0xfc1AdA7A288d6fCe0d29CcfAAa57Bc9114bb2DbE
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDC.e")))
        ) {
            return
                Token(
                    0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664,
                    0x46A51127C3ce23fb7AB1DE06226147F446e4a857,
                    0x5B14679135dbE8B02015ec3Ca4924a12E4C6C85a,
                    0x848c080d2700CBE1B894a3374AD5E887E5cCb89c
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("AAVE.e")))
        ) {
            return
                Token(
                    0x63a72806098Bd3D9520cC43356dD78afe5D386D9,
                    0xD45B7c061016102f9FA220502908f2c0f1add1D7,
                    0x66904E4F3f44e3925D22ceca401b6F2DA085c98f,
                    0x8352E3fd18B8d84D3c8a1b538d788899073c7A8E
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WBTC.e")))
        ) {
            return
                Token(
                    0x50b7545627a5162F82A992c33b87aDc75187B218,
                    0x686bEF2417b6Dc32C50a3cBfbCC3bb60E1e9a15D,
                    0x3484408989985d68C9700dc1CFDFeAe6d2f658CF,
                    0x2dc0E35eC3Ab070B8a175C829e23650Ee604a9eB
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WAVAX")))
        ) {
            return
                Token(
                    0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7,
                    0xDFE521292EcE2A4f44242efBcD66Bc594CA9714B,
                    0x2920CD5b8A160b2Addb00Ec5d5f4112255d4ae75,
                    0x66A0FE52Fb629a6cB4D10B8580AFDffE888F5Fd4
                );
        } else revert("Token does not exist");
    }
}
