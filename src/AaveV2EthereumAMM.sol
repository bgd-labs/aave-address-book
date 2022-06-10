// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {ILendingPoolAddressesProvider, ILendingPool, ILendingPoolConfigurator, IAaveOracle, IAaveProtocolDataProvider} from "./AaveV2.sol";
import {Token} from "./Common.sol";

library AaveV2EthereumAMM {
    ILendingPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
        ILendingPoolAddressesProvider(
            0xAcc030EF66f9dFEAE9CbB0cd1B25654b82cFA8d5
        );

    ILendingPool internal constant POOL =
        ILendingPool(0x7937D4799803FbBe595ed57278Bc4cA21f3bFfCB);

    ILendingPoolConfigurator internal constant POOL_CONFIGURATOR =
        ILendingPoolConfigurator(0x23A875eDe3F1030138701683e42E9b16A7F87768);

    IAaveOracle internal constant ORACLE =
        IAaveOracle(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9);

    IAaveProtocolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
        IAaveProtocolDataProvider(0x0000000000000000000000000000000000000000);

    address internal constant POOL_ADMIN =
        0xEE56e2B3D491590B5b31738cC34d5232F378a8D5;

    address internal constant EMERGENCY_ADMIN =
        0xB9062896ec3A615a4e4444DF183F0531a77218AE;

    function getToken(string calldata symbol)
        public
        pure
        returns (Token memory m)
    {
        if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WETH")))
        ) {
            return
                Token(
                    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
                    0xf9Fb4AD91812b704Ba883B11d2B576E890a6730A,
                    0x118Ee405c6be8f9BA7cC7a98064EB5DA462235CF,
                    0xA4C273d9A0C1fe2674F0E845160d6232768a3064
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("DAI")))
        ) {
            return
                Token(
                    0x6B175474E89094C44Da98b954EedeAC495271d0F,
                    0x79bE75FFC64DD58e66787E4Eae470c8a1FD08ba4,
                    0x8da51a5a3129343468a63A96ccae1ff1352a3dfE,
                    0x3F4fA4937E72991367DC32687BC3278f095E7EAa
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDC")))
        ) {
            return
                Token(
                    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
                    0xd24946147829DEaA935bE2aD85A3291dbf109c80,
                    0xE5971a8a741892F3b3ac3E9c94d02588190cE220,
                    0xCFDC74b97b69319683fec2A4Ef95c4Ab739F1B12
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("USDT")))
        ) {
            return
                Token(
                    0xdAC17F958D2ee523a2206206994597C13D831ec7,
                    0x17a79792Fe6fE5C95dFE95Fe3fCEE3CAf4fE4Cb7,
                    0x04A0577a89E1b9E8f6c87ee26cCe6a168fFfC5b5,
                    0xDcFE9BfC246b02Da384de757464a35eFCa402797
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("WBTC")))
        ) {
            return
                Token(
                    0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599,
                    0x13B2f6928D7204328b0E8E4BCd0379aA06EA21FA,
                    0x55E575d092c934503D7635A837584E2900e01d2b,
                    0x3b99fdaFdfE70d65101a4ba8cDC35dAFbD26375f
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11,
                    0x9303EabC860a743aABcc3A1629014CaBcc3F8D36,
                    0xE9562bf0A11315A1e39f9182F446eA58002f010E,
                    0x23bcc861b989762275165d08B127911F09c71628
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xBb2b8038a1640196FbE3e38816F3e67Cba72D940,
                    0xc58F53A8adff2fB4eb16ED56635772075E2EE123,
                    0xeef7d082D9bE2F5eC73C072228706286dea1f492,
                    0x02aAeB4C7736177242Ee0f71f6f6A0F057Aba87d
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xDFC14d2Af169B0D36C4EFF567Ada9b2E0CAE044f,
                    0xe59d2FF6995a926A574390824a657eEd36801E55,
                    0x997b26eFf106f138e71160022CaAb0AFC5814643,
                    0x859ED7D9E92d1fe42fF95C3BC3a62F7cB59C373E
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xB6909B960DbbE7392D405429eB2b3649752b4838,
                    0xA1B0edF4460CC4d8bFAA18Ed871bFF15E5b57Eb4,
                    0x27c67541a4ea26a436e311b2E6fFeC82083a6983,
                    0x3Fbef89A21Dc836275bC912849627b33c61b09b4
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xAE461cA67B15dc8dc81CE7615e0320dA1A9aB8D5,
                    0xE340B25fE32B1011616bb8EC495A4d503e322177,
                    0x6Bb2BdD21920FcB2Ad855AB5d523222F31709d1f,
                    0x925E3FDd927E20e33C3177C4ff6fb72aD1133C87
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0x3dA1313aE46132A397D90d95B1424A9A7e3e0fCE,
                    0x0ea20e7fFB006d4Cfe84df2F72d8c7bD89247DB0,
                    0xd6035f8803eE9f173b1D3EBc3BDE0Ea6B5165636,
                    0xF3f1a76cA6356a908CdCdE6b2AC2eaace3739Cd0
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xa2107FA5B38d9bbd2C461D6EDf11B11A50F6b974,
                    0xb8db81B84d30E2387de0FF330420A4AAA6688134,
                    0xeb32b3A1De9a1915D2b452B673C53883b9Fa6a97,
                    0xeDe4052ed8e1F422F4E5062c679f6B18693fEcdc
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xC2aDdA861F89bBB333c90c492cB837741916A225,
                    0x370adc71f67f581158Dc56f539dF5F399128Ddf9,
                    0x6E7E38bB73E19b62AB5567940Caaa514e9d85982,
                    0xf36C394775285F89bBBDF09533421E3e81e8447c
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0x8Bd1661Da98EBDd3BD080F0bE4e6d9bE8cE9858c,
                    0xA9e201A4e269d6cd5E9F0FcbcB78520cf815878B,
                    0x312edeADf68E69A0f53518bF27EAcD1AbcC2897e,
                    0x2A8d5B1c1de15bfcd5EC41368C0295c60D8Da83c
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0x43AE24960e5534731Fc831386c07755A2dc33D47,
                    0x38E491A71291CD43E8DE63b7253E482622184894,
                    0xef62A0C391D89381ddf8A8C90Ba772081107D287,
                    0xfd15008efA339A2390B48d2E0Ca8Abd523b406d3
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xd3d2E2692501A5c9Ca623199D38826e513033a17,
                    0x3D26dcd840fCC8e4B2193AcE8A092e4a65832F9f,
                    0x6febCE732191Dc915D6fB7Dc5FE3AEFDDb85Bd1B,
                    0x0D878FbB01fbEEa7ddEFb896d56f1D3167af919F
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc,
                    0x391E86e2C002C70dEe155eAceB88F7A3c38f5976,
                    0xfAB4C9775A4316Ec67a8223ecD0F70F87fF532Fc,
                    0x26625d1dDf520fC8D975cc68eC6E0391D9d3Df61
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0x004375Dff511095CC5A197A54140a24eFEF3A416,
                    0x2365a4890eD8965E564B7E2D27C38Ba67Fec4C6F,
                    0xc66bfA05cCe646f05F71DeE333e3229cE24Bbb7e,
                    0x36dA0C5dC23397CBf9D13BbD74E93C04f99633Af
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("UNI-V2")))
        ) {
            return
                Token(
                    0x2fDbAdf3C4D5A8666Bc06645B8358ab803996E28,
                    0x5394794Be8b6eD5572FCd6b27103F46b5F390E8f,
                    0x9B054B76d6DE1c4892ba025456A9c4F9be5B1766,
                    0xDf70Bdf01a3eBcd0D918FF97390852A914a92Df7
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("BPT")))
        ) {
            return
                Token(
                    0x1efF8aF5D577060BA4ac8A29A13525bb0Ee2A3D5,
                    0x358bD0d980E031E23ebA9AA793926857703783BD,
                    0x46406eCd20FDE1DF4d80F15F07c434fa95CB6b33,
                    0xF655DF3832859cfB0AcfD88eDff3452b9Aa6Db24
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("BPT")))
        ) {
            return
                Token(
                    0x59A19D8c652FA0284f44113D0ff9aBa70bd46fB4,
                    0xd109b2A304587569c84308c55465cd9fF0317bFB,
                    0x6474d116476b8eDa1B21472a599Ff76A829AbCbb,
                    0xF41A5Cc7a61519B08056176d7B4b87AB34dF55AD
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("G-UNI")))
        ) {
            return
                Token(
                    0x50379f632ca68D36E50cfBC8F78fe16bd1499d1e,
                    0xd145c6ae8931ed5Bca9b5f5B7dA5991F5aB63B5c,
                    0x460Fd61bBDe7235C3F345901ad677854c9330c86,
                    0x40533CC601Ec5b79B00D76348ADc0c81d93d926D
                );
        } else if (
            keccak256(abi.encodePacked((symbol))) ==
            keccak256(abi.encodePacked(("G-UNI")))
        ) {
            return
                Token(
                    0xD2eeC91055F07fE24C9cCB25828ecfEFd4be0c41,
                    0xCa5DFDABBfFD58cfD49A9f78Ca52eC8e0591a3C5,
                    0xFEaeCde9Eb0cd43FDE13427C6C7ef406780a8136,
                    0x0B7c7d9c5548A23D0455d1edeC541cc2AD955a9d
                );
        } else revert("Token does not exist");
    }
}
