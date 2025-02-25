// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import {IPoolAddressesProvider, IPool, IPoolConfigurator, IAaveOracle, IPoolDataProvider, IACLManager, ICollector} from './AaveV3.sol';
library AaveV3Metis {
  // https://explorer.metis.io/address/0xB9FABd7500B2C6781c35Dd48d54f81fc2299D7AF
  IPoolAddressesProvider internal constant POOL_ADDRESSES_PROVIDER =
    IPoolAddressesProvider(0xB9FABd7500B2C6781c35Dd48d54f81fc2299D7AF);

  // https://explorer.metis.io/address/0x90df02551bB792286e8D4f13E0e357b4Bf1D6a57
  IPool internal constant POOL = IPool(0x90df02551bB792286e8D4f13E0e357b4Bf1D6a57);

  // https://explorer.metis.io/address/0x69FEE8F261E004453BE0800BC9039717528645A6
  IPoolConfigurator internal constant POOL_CONFIGURATOR =
    IPoolConfigurator(0x69FEE8F261E004453BE0800BC9039717528645A6);

  // https://explorer.metis.io/address/0x38D36e85E47eA6ff0d18B0adF12E5fC8984A6f8e
  IAaveOracle internal constant ORACLE = IAaveOracle(0x38D36e85E47eA6ff0d18B0adF12E5fC8984A6f8e);

  // https://explorer.metis.io/address/0x2B5EA1604BAbb7B730120950Cb13951f3525828A
  address internal constant PRICE_ORACLE_SENTINEL = 0x2B5EA1604BAbb7B730120950Cb13951f3525828A;

  // https://explorer.metis.io/address/0x6fD45D32375d5aDB8D76275A3932c740F03a8718
  address internal constant ACL_ADMIN = 0x6fD45D32375d5aDB8D76275A3932c740F03a8718;

  // https://explorer.metis.io/address/0xcDCb65fc657B701a5100a12eFB663978E7e8fFB8
  IACLManager internal constant ACL_MANAGER =
    IACLManager(0xcDCb65fc657B701a5100a12eFB663978E7e8fFB8);

  // https://explorer.metis.io/address/0xbb4a3B6781be3650B252552dFF6332EfB1162152
  IPoolDataProvider internal constant AAVE_PROTOCOL_DATA_PROVIDER =
    IPoolDataProvider(0xbb4a3B6781be3650B252552dFF6332EfB1162152);

  // https://explorer.metis.io/address/0xAD6A01bAde8e5ffeD933e342F58a53768422e96A
  address internal constant POOL_IMPL = 0xAD6A01bAde8e5ffeD933e342F58a53768422e96A;

  // https://explorer.metis.io/address/0xE5e48Ad1F9D1A894188b483DcF91f4FaD6AbA43b
  address internal constant POOL_CONFIGURATOR_IMPL = 0xE5e48Ad1F9D1A894188b483DcF91f4FaD6AbA43b;

  // https://explorer.metis.io/address/0x30C1b8F0490fa0908863d6Cbd2E36400b4310A6B
  address internal constant DEFAULT_INCENTIVES_CONTROLLER =
    0x30C1b8F0490fa0908863d6Cbd2E36400b4310A6B;

  // https://explorer.metis.io/address/0xfDb2580A1ac4CDc67E4236738b28af59e2022Dd2
  address internal constant EMISSION_MANAGER = 0xfDb2580A1ac4CDc67E4236738b28af59e2022Dd2;

  // https://explorer.metis.io/address/0xB5b64c7E00374e766272f8B442Cd261412D4b118
  ICollector internal constant COLLECTOR = ICollector(0xB5b64c7E00374e766272f8B442Cd261412D4b118);

  // https://explorer.metis.io/address/0x246405C70461f93513C74606815615c24c5C8C79
  address internal constant DEFAULT_A_TOKEN_IMPL_REV_1 = 0x246405C70461f93513C74606815615c24c5C8C79;

  // https://explorer.metis.io/address/0xE7fA271BD76FC9c6F2F968976E9f4f553256E02f
  address internal constant DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1 =
    0xE7fA271BD76FC9c6F2F968976E9f4f553256E02f;

  // https://explorer.metis.io/address/0x5f4d15d761528c57a5C30c43c1DAb26Fc5452731
  address internal constant CAPS_PLUS_RISK_STEWARD = 0x5f4d15d761528c57a5C30c43c1DAb26Fc5452731;

  // https://explorer.metis.io/address/0x58226D26658F19724cB881E9F747EeDC846BB1c9
  address internal constant RISK_STEWARD = 0x58226D26658F19724cB881E9F747EeDC846BB1c9;

  // https://explorer.metis.io/address/0x2C77153fF4a1e83A8d8D750735FB101ECB55949f
  address internal constant FREEZING_STEWARD = 0x2C77153fF4a1e83A8d8D750735FB101ECB55949f;

  // https://explorer.metis.io/address/0x9f3A1B399A9074eBA63Dc4fc274bE2A2b2d80cB9
  address internal constant L2_ENCODER = 0x9f3A1B399A9074eBA63Dc4fc274bE2A2b2d80cB9;

  // https://explorer.metis.io/address/0x45918bB1D3F73904a30Ffc3eD11CdB1c05eBF726
  address internal constant CONFIG_ENGINE = 0x45918bB1D3F73904a30Ffc3eD11CdB1c05eBF726;

  // https://explorer.metis.io/address/0x9E7B73ffD9D2026F3ff4212c29E209E09C8A91F5
  address internal constant POOL_ADDRESSES_PROVIDER_REGISTRY =
    0x9E7B73ffD9D2026F3ff4212c29E209E09C8A91F5;

  // https://explorer.metis.io/address/0xE92cd6164CE7DC68e740765BC1f2a091B6CBc3e4
  address internal constant UI_INCENTIVE_DATA_PROVIDER = 0xE92cd6164CE7DC68e740765BC1f2a091B6CBc3e4;

  // https://explorer.metis.io/address/0xc0179321f0825c3e0F59Fe7Ca4E40557b97797a3
  address internal constant UI_POOL_DATA_PROVIDER = 0xc0179321f0825c3e0F59Fe7Ca4E40557b97797a3;

  // https://explorer.metis.io/address/0x1df710eb1E2FD9C21494aF2BFb1F210a4185885b
  address internal constant WALLET_BALANCE_PROVIDER = 0x1df710eb1E2FD9C21494aF2BFb1F210a4185885b;

  // https://explorer.metis.io/address/0x9C62AdC332888F56998542415c38D7CDf3Ff7619
  address internal constant LEGACY_STATIC_A_TOKEN_FACTORY =
    0x9C62AdC332888F56998542415c38D7CDf3Ff7619;
}
library AaveV3MetisAssets {
  // https://explorer.metis.io/address/0x4c078361FC9BbB78DF910800A991C7c3DD2F6ce0
  address internal constant mDAI_UNDERLYING = 0x4c078361FC9BbB78DF910800A991C7c3DD2F6ce0;

  uint8 internal constant mDAI_DECIMALS = 18;

  // https://explorer.metis.io/address/0x85ABAdDcae06efee2CB5F75f33b6471759eFDE24
  address internal constant mDAI_A_TOKEN = 0x85ABAdDcae06efee2CB5F75f33b6471759eFDE24;

  // https://explorer.metis.io/address/0x13Bd89aF338f3c7eAE9a75852fC2F1ca28B4DDbF
  address internal constant mDAI_V_TOKEN = 0x13Bd89aF338f3c7eAE9a75852fC2F1ca28B4DDbF;

  // https://explorer.metis.io/address/0xB3721282cd62Ba8F7bB02Cb843F3a34f9e109ef8
  address internal constant mDAI_ORACLE = 0xB3721282cd62Ba8F7bB02Cb843F3a34f9e109ef8;

  // https://explorer.metis.io/address/0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a
  address internal constant mDAI_INTEREST_RATE_STRATEGY =
    0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a;

  // https://explorer.metis.io/address/0x66a2E4cff95BDE6403Ed5541B396aA0B171e5509
  address internal constant mDAI_STATIC_A_TOKEN = 0x66a2E4cff95BDE6403Ed5541B396aA0B171e5509;

  // https://explorer.metis.io/address/0xDeadDeAddeAddEAddeadDEaDDEAdDeaDDeAD0000
  address internal constant Metis_UNDERLYING = 0xDeadDeAddeAddEAddeadDEaDDEAdDeaDDeAD0000;

  uint8 internal constant Metis_DECIMALS = 18;

  // https://explorer.metis.io/address/0x7314Ef2CA509490f65F52CC8FC9E0675C66390b8
  address internal constant Metis_A_TOKEN = 0x7314Ef2CA509490f65F52CC8FC9E0675C66390b8;

  // https://explorer.metis.io/address/0x0110174183e13D5Ea59D7512226c5D5A47bA2c40
  address internal constant Metis_V_TOKEN = 0x0110174183e13D5Ea59D7512226c5D5A47bA2c40;

  // https://explorer.metis.io/address/0xD4a5Bb03B5D66d9bf81507379302Ac2C2DFDFa6D
  address internal constant Metis_ORACLE = 0xD4a5Bb03B5D66d9bf81507379302Ac2C2DFDFa6D;

  // https://explorer.metis.io/address/0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a
  address internal constant Metis_INTEREST_RATE_STRATEGY =
    0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a;

  // https://explorer.metis.io/address/0x5DE732A094A0ceF0eBFEcF0A916bDAB29650a784
  address internal constant Metis_STATIC_A_TOKEN = 0x5DE732A094A0ceF0eBFEcF0A916bDAB29650a784;

  // https://explorer.metis.io/address/0xEA32A96608495e54156Ae48931A7c20f0dcc1a21
  address internal constant mUSDC_UNDERLYING = 0xEA32A96608495e54156Ae48931A7c20f0dcc1a21;

  uint8 internal constant mUSDC_DECIMALS = 6;

  // https://explorer.metis.io/address/0x885C8AEC5867571582545F894A5906971dB9bf27
  address internal constant mUSDC_A_TOKEN = 0x885C8AEC5867571582545F894A5906971dB9bf27;

  // https://explorer.metis.io/address/0x571171a7EF1e3c8c83d47EF1a50E225E9c351380
  address internal constant mUSDC_V_TOKEN = 0x571171a7EF1e3c8c83d47EF1a50E225E9c351380;

  // https://explorer.metis.io/address/0xF2acD6aE4fcf662161eA354dA844f224bf91FF8c
  address internal constant mUSDC_ORACLE = 0xF2acD6aE4fcf662161eA354dA844f224bf91FF8c;

  // https://explorer.metis.io/address/0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a
  address internal constant mUSDC_INTEREST_RATE_STRATEGY =
    0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a;

  // https://explorer.metis.io/address/0xb24451C231C6e6A60aC46f45E98a267caae898f4
  address internal constant mUSDC_STATIC_A_TOKEN = 0xb24451C231C6e6A60aC46f45E98a267caae898f4;

  // https://explorer.metis.io/address/0xbB06DCA3AE6887fAbF931640f67cab3e3a16F4dC
  address internal constant mUSDT_UNDERLYING = 0xbB06DCA3AE6887fAbF931640f67cab3e3a16F4dC;

  uint8 internal constant mUSDT_DECIMALS = 6;

  // https://explorer.metis.io/address/0xd9fa75D14c26720d5ce7eE2530793a823e8f07b9
  address internal constant mUSDT_A_TOKEN = 0xd9fa75D14c26720d5ce7eE2530793a823e8f07b9;

  // https://explorer.metis.io/address/0x6B45DcE8aF4fE5Ab3bFCF030d8fB57718eAB54e5
  address internal constant mUSDT_V_TOKEN = 0x6B45DcE8aF4fE5Ab3bFCF030d8fB57718eAB54e5;

  // https://explorer.metis.io/address/0xD1D7DCBDE72916646A7F8AcE6Ad8C5179D8ddFbB
  address internal constant mUSDT_ORACLE = 0xD1D7DCBDE72916646A7F8AcE6Ad8C5179D8ddFbB;

  // https://explorer.metis.io/address/0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a
  address internal constant mUSDT_INTEREST_RATE_STRATEGY =
    0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a;

  // https://explorer.metis.io/address/0xAAea6F041425B813760dA201d08d46487034A266
  address internal constant mUSDT_STATIC_A_TOKEN = 0xAAea6F041425B813760dA201d08d46487034A266;

  // https://explorer.metis.io/address/0x420000000000000000000000000000000000000A
  address internal constant WETH_UNDERLYING = 0x420000000000000000000000000000000000000A;

  uint8 internal constant WETH_DECIMALS = 18;

  // https://explorer.metis.io/address/0x8acAe35059C9aE27709028fF6689386a44c09f3a
  address internal constant WETH_A_TOKEN = 0x8acAe35059C9aE27709028fF6689386a44c09f3a;

  // https://explorer.metis.io/address/0x8Bb19e3DD277a73D4A95EE434F14cE4B92898421
  address internal constant WETH_V_TOKEN = 0x8Bb19e3DD277a73D4A95EE434F14cE4B92898421;

  // https://explorer.metis.io/address/0x3BBe70e2F96c87aEce7F67A2b0178052f62E37fE
  address internal constant WETH_ORACLE = 0x3BBe70e2F96c87aEce7F67A2b0178052f62E37fE;

  // https://explorer.metis.io/address/0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a
  address internal constant WETH_INTEREST_RATE_STRATEGY =
    0x258625AfDe0073f5Bbce50C0305f4C23B16C7F3a;

  // https://explorer.metis.io/address/0x2f1606864d6322c54b50a1762D4a1ca67f42d23d
  address internal constant WETH_STATIC_A_TOKEN = 0x2f1606864d6322c54b50a1762D4a1ca67f42d23d;
}
library AaveV3MetisEModes {
  uint8 internal constant NONE = 0;
}
library AaveV3MetisExternalLibraries {
  // https://explorer.metis.io/address/0x34039100cc9584Ae5D741d322e16d0d18CEE8770
  address internal constant FLASHLOAN_LOGIC = 0x34039100cc9584Ae5D741d322e16d0d18CEE8770;

  // https://explorer.metis.io/address/0x62325c94E1c49dcDb5937726aB5D8A4c37bCAd36
  address internal constant BORROW_LOGIC = 0x62325c94E1c49dcDb5937726aB5D8A4c37bCAd36;

  // https://explorer.metis.io/address/0x621Ef86D8A5C693a06295BC288B95C12D4CE4994
  address internal constant BRIDGE_LOGIC = 0x621Ef86D8A5C693a06295BC288B95C12D4CE4994;

  // https://explorer.metis.io/address/0xC31d2362fAeD85dF79d0bec99693D0EB0Abd3f74
  address internal constant E_MODE_LOGIC = 0xC31d2362fAeD85dF79d0bec99693D0EB0Abd3f74;

  // https://explorer.metis.io/address/0x4731bF01583F991278692E8727d0700a00A1fBBf
  address internal constant LIQUIDATION_LOGIC = 0x4731bF01583F991278692E8727d0700a00A1fBBf;

  // https://explorer.metis.io/address/0xf8C97539934ee66a67C26010e8e027D77E821B0C
  address internal constant POOL_LOGIC = 0xf8C97539934ee66a67C26010e8e027D77E821B0C;

  // https://explorer.metis.io/address/0x185477906B46D9b8DE0DEB73A1bBfb87b5b51BC3
  address internal constant SUPPLY_LOGIC = 0x185477906B46D9b8DE0DEB73A1bBfb87b5b51BC3;
}
