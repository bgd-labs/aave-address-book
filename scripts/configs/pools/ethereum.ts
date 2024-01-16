import {ChainId} from '@bgd-labs/js-utils';
import {PoolConfig} from '../types';

export const goerliProtoV2Pool: PoolConfig = {
  name: 'Goerli',
  chainId: ChainId.goerli,
  POOL_ADDRESSES_PROVIDER: '0x5E52dEc931FFb32f609681B8438A51c675cc232d',
  additionalAddresses: {
    FAUCET: '0x681860075529352da2C94082Eb66c59dF958e89C',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x3465454D658019f8A0eABD3bC61d2d1Dd3a0735F',
    UI_INCENTIVE_DATA_PROVIDER: '0xA2E05bE2090b3658A264bdf1C39387f5Dba367Ec',
    UI_POOL_DATA_PROVIDER: '0xaaa2872d1F7f5ceb630Cb736BcA34Ff1e121992b',
    WALLET_BALANCE_PROVIDER: '0xf1E4A6E7FA07421FD5139Ba0848290A27e22db7f',
    WETH_GATEWAY: '0x3bd3a20Ac9Ff1dda1D99C0dFCE6D65C4960B3627',
  },
};

export const goerliGHOV3Pool: PoolConfig = {
  name: 'GoerliGho',
  chainId: ChainId.goerli,
  POOL_ADDRESSES_PROVIDER: '0x4dd5ab8Fb385F2e12aDe435ba7AFA812F1d364D0',
  additionalAddresses: {
    FAUCET: '0x1265305F033156bbF8Ba54fE45DD5685BEc4Cc44',
    UI_INCENTIVE_DATA_PROVIDER: '0xF67B25977cEFf3563BF7F24A531D6CEAe6870a9d',
    UI_POOL_DATA_PROVIDER: '0x3De59b6901e7Ad0A19621D49C5b52cC9a4977e52',
    WALLET_BALANCE_PROVIDER: '0x03C8d0c46834921c4468C15A03E5d76Ae5CA3133',
    WETH_GATEWAY: '0x9c402E3b0D123323F0FCed781b8184Ec7E02Dd31',
  },
};

export const sepoliaProtoV3: PoolConfig = {
  name: 'Sepolia',
  chainId: ChainId.sepolia,
  POOL_ADDRESSES_PROVIDER: '0x012bAC54348C0E635dCAc9D5FB99f06F24136C9A',
  additionalAddresses: {
    FAUCET: '0xC959483DBa39aa9E78757139af0e9a2EDEb3f42D',
    UI_INCENTIVE_DATA_PROVIDER: '0xBA25de9a7DC623B30799F33B770d31B44c2C3b77',
    UI_POOL_DATA_PROVIDER: '0x69529987FA4A075D0C00B0128fa848dc9ebbE9CE',
    WALLET_BALANCE_PROVIDER: '0xCD4e0d6D2b1252E2A709B8aE97DBA31164C5a709',
    WETH_GATEWAY: '0x387d311e47e80b498169e6fb51d3193167d89F7D',
    STATIC_A_TOKEN_FACTORY: '0xd210dFB43B694430B8d31762B5199e30c31266C8',
    UI_GHO_DATA_PROVIDER: '0x69B9843A16a6E9933125EBD97659BA3CCbE2Ef8A',
    GHO_TOKEN: '0xc4bF5CbDaBE595361438F8c6a187bDc330539c60',
  },
};

export const mainnetProtoV2Pool: PoolConfig = {
  name: 'Ethereum',
  chainId: ChainId.mainnet,
  POOL_ADDRESSES_PROVIDER: '0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5',
  additionalAddresses: {
    DEBT_SWAP_ADAPTER: '0x6A6FA664D4Fa49a6a780a1D6143f079f8dd7C33d',
    CONFIG_ENGINE: '0x9eCed0293e7B73CFf4a2b4F9C82aAc8346158bd9',
    MIGRATION_HELPER: '0xb748952c7bc638f31775245964707bcc5ddfabfc',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x52D306e36E3B6B02c153d0266ff0f85d18BCD413',
    RATES_FACTORY: '0xbD37610BBB1ddc2a22797F7e3f531B59902b7bA7',
    REPAY_WITH_COLLATERAL_ADAPTER: '0x80Aca0C645fEdABaa20fd2Bf0Daf57885A309FE6',
    SWAP_COLLATERAL_ADAPTER: '0x135896DE8421be2ec868E0b811006171D9df802A',
    UI_INCENTIVE_DATA_PROVIDER: '0xD01ab9a6577E1D84F142e44D49380e23A340387d',
    UI_POOL_DATA_PROVIDER: '0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A',
    WALLET_BALANCE_PROVIDER: '0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922',
    WETH_GATEWAY: '0xa0d9C1E9E48Ca30c8d8C3B5D69FF5dc1f6DFfC24',
  },
};

export const mainnetAmmV2Pool: PoolConfig = {
  name: 'EthereumAMM',
  chainId: ChainId.mainnet,
  POOL_ADDRESSES_PROVIDER: '0xacc030ef66f9dfeae9cbb0cd1b25654b82cfa8d5',
  additionalAddresses: {
    CONFIG_ENGINE: '0xcfC26009618ec2Ca8787180116a37Caa354a465C',
    MIGRATION_HELPER: '0x3cd1dFB81C50A5300C60a181ED145a7286d81e0a',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0x52D306e36E3B6B02c153d0266ff0f85d18BCD413',
    RATES_FACTORY: '0x6e4D068105052C3877116DCF86f5FF36B7eCa2B8',
    UI_INCENTIVE_DATA_PROVIDER: '0xD01ab9a6577E1D84F142e44D49380e23A340387d',
    UI_POOL_DATA_PROVIDER: '0x00e50FAB64eBB37b87df06Aa46b8B35d5f1A4e1A',
    WALLET_BALANCE_PROVIDER: '0x8E8dAd5409E0263a51C0aB5055dA66Be28cFF922',
    WETH_GATEWAY: '0xbe9a7B3F2f54E18D7C0a17B03ad84Ac2D1D28eAC',
  },
};

export const mainnetArcV2Pool: PoolConfig = {
  name: 'EthereumArc',
  chainId: ChainId.mainnet,
  POOL_ADDRESSES_PROVIDER: '0x6FdfafB66d39cD72CFE7984D3Bbcc76632faAb00',
  additionalAddresses: {
    PERMISSION_MANAGER: '0xF4a1F5fEA79C3609514A417425971FadC10eCfBE',
  },
};

export const mainnetProtoV3Pool: PoolConfig = {
  name: 'Ethereum',
  chainId: ChainId.mainnet,
  POOL_ADDRESSES_PROVIDER: '0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e',
  additionalAddresses: {
    CAPS_PLUS_RISK_STEWARD: '0x82dcCF206Ae2Ab46E2099e663F70DeE77caE7778',
    FREEZING_STEWARD: '0x2eE68ACb6A1319de1b49DC139894644E424fefD6',
    DEBT_SWAP_ADAPTER: '0x8761e0370f94f68Db8EaA731f4fC581f6AD0Bd68',
    DELEGATION_AWARE_A_TOKEN_IMPL_REV_1: '0x21714092D90c7265F52fdfDae068EC11a23C6248',
    GHO_TOKEN: '0x40D16FC0246aD3160Ccc09B8D0D3A2cD28aE6C2f',
    CONFIG_ENGINE: '0xA3e44d830440dF5098520F62Ebec285B1198c51E',
    POOL_ADDRESSES_PROVIDER_REGISTRY: '0xbaA999AC55EAce41CcAE355c77809e68Bb345170',
    RATES_FACTORY: '0xcC47c4Fe1F7f29ff31A8b62197023aC8553C7896',
    REPAY_WITH_COLLATERAL_ADAPTER: '0x02e7B8511831B1b02d9018215a0f8f500Ea5c6B3',
    STATIC_A_TOKEN_FACTORY: '0x411D79b8cC43384FDE66CaBf9b6a17180c842511',
    SWAP_COLLATERAL_ADAPTER: '0xADC0A53095A0af87F3aa29FE0715B5c28016364e',
    UI_GHO_DATA_PROVIDER: '0x379c1EDD1A41218bdbFf960a9d5AD2818Bf61aE8',
    UI_INCENTIVE_DATA_PROVIDER: '0x162A7AC02f547ad796CA549f757e2b8d1D9b10a6',
    UI_POOL_DATA_PROVIDER: '0x91c0eA31b49B69Ea18607702c5d9aC360bf3dE7d',
    WALLET_BALANCE_PROVIDER: '0xC7be5307ba715ce89b152f3Df0658295b3dbA8E2',
    WETH_GATEWAY: '0x893411580e590D62dDBca8a703d61Cc4A8c7b2b9',
    WITHDRAW_SWAP_ADAPTER: '0x78F8Bd884C3D738B74B420540659c82f392820e0',
    SAVINGS_DAI_TOKEN_WRAPPER: '0xE28E2c8d240dd5eBd0adcab86fbD79df7a052034',
  },
};
