import {Hex} from 'viem';
import {ChainId} from '../generator/chains';

interface KnownInterfaces<T extends number | Hex = any> {
  value: T;
  type: T extends number ? 'uint256' : 'address' | string;
  chainId?: T extends number ? never : ChainId;
}

export type AddressInfo = Hex | KnownInterfaces;

export type Addresses = Record<Uppercase<string>, AddressInfo>;

export type GovernanceV3Addresses = {
  CROSS_CHAIN_CONTROLLER?: Hex;
  GOVERNANCE?: Hex;
  VOTING_MACHINE?: Hex;
  PAYLOADS_CONTROLLER?: Hex;
  VOTING_PORTAL_ETH_ETH?: Hex;
  VOTING_PORTAL_ETH_AVAX?: Hex;
  VOTING_PORTAL_ETH_POL?: Hex;
  CL_EMERGENCY_ORACLE?: Hex;
  VM_DATA_HELPER?: Hex;
  GOV_DATA_HELPER?: Hex;
  PC_DATA_HELPER?: Hex;
  META_DELEGATE_HELPER?: Hex;
  EMERGENCY_REGISTRY?: Hex;
};

export interface GovernanceConfig {
  name: string;
  CHAIN_ID: ChainId;
  ADDRESSES: GovernanceV3Addresses;
}

export interface PoolConfig {
  name: string;
  chainId: ChainId;
  POOL_ADDRESSES_PROVIDER: Hex;
  // will be inlined in js pool export
  additionalAddresses: {
    FAUCET?: Hex;
    WETH_GATEWAY?: Hex;
    REPAY_WITH_COLLATERAL_ADAPTER?: Hex;
    SWAP_COLLATERAL_ADAPTER?: Hex;
    DEBT_SWAP_ADAPTER?: Hex;
    WITHDRAW_SWAP_ADAPTER?: Hex;
    POOL_ADDRESSES_PROVIDER_REGISTRY?: Hex;
    LISTING_ENGINE?: Hex;
    MIGRATION_HELPER?: Hex;
    UI_POOL_DATA_PROVIDER?: Hex;
    UI_INCENTIVE_DATA_PROVIDER?: Hex;
    L2_ENCODER?: Hex;
    PROOF_OF_RESERVE?: Hex;
    PROOF_OF_RESERVE_AGGREGATOR?: Hex;
    DELEGATION_AWARE_A_TOKEN_IMPL_REV_1?: Hex;
    STATIC_A_TOKEN_FACTORY?: Hex;
    CAPS_PLUS_RISK_STEWARD?: Hex;
    GHO_TOKEN?: Hex;
    UI_GHO_DATA_PROVIDER?: Hex;
    RATES_FACTORY?: Hex;
    PERMISSION_MANAGER?: Hex;
    WALLET_BALANCE_PROVIDER?: Hex;
  };
  // will be used for pending pools where the impls can't be fetched yet
  initial?: {
    COLLECTOR?: Hex;
    DEFAULT_A_TOKEN_IMPL?: Hex;
    DEFAULT_VARIABLE_DEBT_TOKEN_IMPL?: Hex;
    DEFAULT_STABLE_DEBT_TOKEN_IMPL?: Hex;
  };
}

export type ReserveData = {
  symbol: string;
  UNDERLYING: Hex;
  decimals: number;
  A_TOKEN: Hex;
  S_TOKEN: Hex;
  V_TOKEN: Hex;
  INTEREST_RATE_STRATEGY: Hex;
  ORACLE: Hex;
  STATA_TOKEN?: Hex;
};
