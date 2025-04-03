use alloy_primitives::Address;

// Asset information structure
#[derive(Debug, Clone)]
pub struct AssetInfo {
  pub name: &'static str,
  pub decimals: u8,
  pub id: u8,
  pub underlying: Address,
  pub a_token: Address,
  pub v_token: Address,
  pub interest_rate_strategy: Address,
  pub oracle: Address,
  pub static_a_token: Option<Address>,
  pub stata_token: Option<Address>,
}

// E-Mode configuration structure
#[derive(Debug, Clone)]
pub struct EModeConfig {
  pub id: u8,
  pub label: &'static str,
  pub collateral_bitmap: &'static str,
  pub collateral_assets: &'static [Address],
  pub borrowable_bitmap: &'static str,
  pub borrowable_assets: &'static [Address],
  pub ltv: u32,
  pub liquidation_threshold: u32,
  pub liquidation_bonus: u32,
}
