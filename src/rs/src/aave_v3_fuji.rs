// AUTOGENERATED - MANUALLY CHANGES WILL BE REVERTED BY THE GENERATOR
use crate::types::{AssetInfo, EModeConfig};
use alloy_primitives::{address, Address};

// IPoolAddressesProvider https://testnet.snowtrace.io/address/0x07D04EfAAA0Ac69D19d107795aF247C42Eb50F1C
pub const POOL_ADDRESSES_PROVIDER: Address = address!("0x07D04EfAAA0Ac69D19d107795aF247C42Eb50F1C");

// IPool https://testnet.snowtrace.io/address/0x8B9b2AF4afB389b4a70A474dfD4AdCD4a302bb40
pub const POOL: Address = address!("0x8B9b2AF4afB389b4a70A474dfD4AdCD4a302bb40");

// IPoolConfigurator https://testnet.snowtrace.io/address/0xF9f36C15fBddAF0B64E0D16E4D6852B433a86cbE
pub const POOL_CONFIGURATOR: Address = address!("0xF9f36C15fBddAF0B64E0D16E4D6852B433a86cbE");

// IAaveOracle https://testnet.snowtrace.io/address/0xd36338d0F231446b36008310f1DE0812784ADeBC
pub const ORACLE: Address = address!("0xd36338d0F231446b36008310f1DE0812784ADeBC");

// https://testnet.snowtrace.io/address/0x6ec33534BE07d45cc4E02Fbd127F8ed2aE919a6b
pub const ACL_ADMIN: Address = address!("0x6ec33534BE07d45cc4E02Fbd127F8ed2aE919a6b");

// IACLManager https://testnet.snowtrace.io/address/0xa411Accec7000c52feE9bFeDaDc53E1CEF72d6d4
pub const ACL_MANAGER: Address = address!("0xa411Accec7000c52feE9bFeDaDc53E1CEF72d6d4");

// IPoolDataProvider https://testnet.snowtrace.io/address/0xC65cbd1e309Bf0e841Ee6f6E786480598e6a4014
pub const AAVE_PROTOCOL_DATA_PROVIDER: Address =
  address!("0xC65cbd1e309Bf0e841Ee6f6E786480598e6a4014");

// https://testnet.snowtrace.io/address/0xff1DB744F1275f8e04A62A7E5D663575F3a774B6
pub const POOL_IMPL: Address = address!("0xff1DB744F1275f8e04A62A7E5D663575F3a774B6");

// https://testnet.snowtrace.io/address/0x782559e349b084bB7C07c08404aE6E3436cDAE2E
pub const POOL_CONFIGURATOR_IMPL: Address = address!("0x782559e349b084bB7C07c08404aE6E3436cDAE2E");

// https://testnet.snowtrace.io/address/0x03aFC1Dfb53eae8eB7BE0E8CB6524aa79C3F8578
pub const DEFAULT_INCENTIVES_CONTROLLER: Address =
  address!("0x03aFC1Dfb53eae8eB7BE0E8CB6524aa79C3F8578");

// https://testnet.snowtrace.io/address/0xa46F32c76cAE9Fd34afB8029dE9c30b7F86bFA58
pub const EMISSION_MANAGER: Address = address!("0xa46F32c76cAE9Fd34afB8029dE9c30b7F86bFA58");

// ICollector https://testnet.snowtrace.io/address/0xEd5b0b955C70Fd97557EF9Af2c9bA902Ad1F2AA9
pub const COLLECTOR: Address = address!("0xEd5b0b955C70Fd97557EF9Af2c9bA902Ad1F2AA9");

// https://testnet.snowtrace.io/address/0xeF4d1F3F0dCe46C1Ad684F23Ea3aA542592A8cFe
pub const DEFAULT_A_TOKEN_IMPL_REV_1: Address =
  address!("0xeF4d1F3F0dCe46C1Ad684F23Ea3aA542592A8cFe");

// https://testnet.snowtrace.io/address/0x21CcaD436A6c762B919dB7cb07C5082a43DB2589
pub const DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1: Address =
  address!("0x21CcaD436A6c762B919dB7cb07C5082a43DB2589");

// https://testnet.snowtrace.io/address/0x4058FE01Aa090E0841F4E08f79D2607C4861142E
pub const CONFIG_ENGINE: Address = address!("0x4058FE01Aa090E0841F4E08f79D2607C4861142E");

// https://testnet.snowtrace.io/address/0x9E7DF170E44093d6738057157CA048794B02555d
pub const POOL_ADDRESSES_PROVIDER_REGISTRY: Address =
  address!("0x9E7DF170E44093d6738057157CA048794B02555d");

// https://testnet.snowtrace.io/address/0xc344A904BFd1E11AD58a18847940637C35f28ce4
pub const STATA_FACTORY: Address = address!("0xc344A904BFd1E11AD58a18847940637C35f28ce4");

// https://testnet.snowtrace.io/address/0x9Ba30437Ba63AA2902319DE1B3f0E25a18826842
pub const UI_INCENTIVE_DATA_PROVIDER: Address =
  address!("0x9Ba30437Ba63AA2902319DE1B3f0E25a18826842");

// https://testnet.snowtrace.io/address/0x43fAE24bd7eA952B4000Ea3A2e0D8B50CA64EBbA
pub const WALLET_BALANCE_PROVIDER: Address = address!("0x43fAE24bd7eA952B4000Ea3A2e0D8B50CA64EBbA");

// https://testnet.snowtrace.io/address/0x3d2ee1AB8C3a597cDf80273C684dE0036481bE3a
pub const WETH_GATEWAY: Address = address!("0x3d2ee1AB8C3a597cDf80273C684dE0036481bE3a");

pub const CHAIN_ID: u32 = 43113;

pub const ASSETS: &[AssetInfo] = &[
  AssetInfo {
    name: "USDC",
    decimals: 6,
    id: 0,
    underlying: address!("0x5425890298aed601595a70AB815c96711a31Bc65"),
    a_token: address!("0x9CFcc1B289E59FBe1E769f020C77315DF8473760"),
    v_token: address!("0x92cb483760299e69d31f59050cfD5937B8730E48"),
    interest_rate_strategy: address!("0xd5DDE725b0A2dE43fBDb4E488A7fdA389210d461"),
    oracle: address!("0x97FE42a7E96640D932bbc0e1580c73E705A8EB73"),
    static_a_token: None,
    stata_token: None,
  },
  AssetInfo {
    name: "EURC",
    decimals: 6,
    id: 1,
    underlying: address!("0x5E44db7996c682E92a960b65AC713a54AD815c6B"),
    a_token: address!("0xBb51336dAD7A010Ff32656b53233c2C3670cc5B9"),
    v_token: address!("0x8C776d6d7A6D250Abb1b9Ce22b4E310b95E1ef85"),
    interest_rate_strategy: address!("0xd5DDE725b0A2dE43fBDb4E488A7fdA389210d461"),
    oracle: address!("0x7898AcCC83587C3C55116c5230C17a6Cd9C71bad"),
    static_a_token: None,
    stata_token: None,
  },
  AssetInfo {
    name: "WAVAX",
    decimals: 18,
    id: 2,
    underlying: address!("0xd00ae08403B9bbb9124bB305C09058E32C39A48c"),
    a_token: address!("0x50902e21C8CfB5f2e45127c1Bbcd6B985119b433"),
    v_token: address!("0xe7CF4cE189b3a519EE2A41c18338a3bef0f28a9D"),
    interest_rate_strategy: address!("0xd5DDE725b0A2dE43fBDb4E488A7fdA389210d461"),
    oracle: address!("0x5498BB86BC934c8D34FDA08E81D444153d0D06aD"),
    static_a_token: None,
    stata_token: None,
  },
  AssetInfo {
    name: "USDX",
    decimals: 18,
    id: 3,
    underlying: address!("0x22913D4E21D44EF7662B118A6540450e25fE09a9"),
    a_token: address!("0x687b7a6Ea699E0652552Cd8C86aA764eF33f285d"),
    v_token: address!("0x8ECa241b42f89EcA1F790A1Bd908a0F73F8e1A11"),
    interest_rate_strategy: address!("0xd5DDE725b0A2dE43fBDb4E488A7fdA389210d461"),
    oracle: address!("0x97FE42a7E96640D932bbc0e1580c73E705A8EB73"),
    static_a_token: None,
    stata_token: Some(address!("0x17Bb5B12D6716FC96565dB996DAFC7F7a731731F")),
  },
];

pub const E_MODES: &[EModeConfig] = &[];
