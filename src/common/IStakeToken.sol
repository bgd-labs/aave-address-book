pragma solidity ^0.8.10;

interface StakeToken {
  event Approval(address indexed owner, address indexed spender, uint256 value);
  event AssetConfigUpdated(address indexed asset, uint256 emission);
  event AssetIndexUpdated(address indexed asset, uint256 index);
  event Cooldown(address indexed user, uint256 amount);
  event CooldownSecondsChanged(uint256 cooldownSeconds);
  event DistributionEndChanged(uint256 endTimestamp);
  event EIP712DomainChanged();
  event ExchangeRateChanged(uint216 exchangeRate);
  event FundsReturned(uint256 amount);
  event Initialized(uint64 version);
  event MaxSlashablePercentageChanged(uint256 newPercentage);
  event PendingAdminChanged(address indexed newPendingAdmin, uint256 role);
  event Redeem(address indexed from, address indexed to, uint256 assets, uint256 shares);
  event RewardsAccrued(address user, uint256 amount);
  event RewardsClaimed(address indexed from, address indexed to, uint256 amount);
  event RoleClaimed(address indexed newAdmin, uint256 role);
  event Slashed(address indexed destination, uint256 amount);
  event SlashingExitWindowDurationChanged(uint256 windowSeconds);
  event SlashingSettled();
  event Staked(address indexed from, address indexed to, uint256 assets, uint256 shares);
  event Transfer(address indexed from, address indexed to, uint256 value);
  event UserIndexUpdated(address indexed user, address indexed asset, uint256 index);

  struct AssetConfigInput {
    uint128 emissionPerSecond;
    uint256 totalStaked;
    address underlyingAsset;
  }

  function CLAIM_HELPER_ROLE() external view returns (uint256);

  function COOLDOWN_ADMIN_ROLE() external view returns (uint256);

  function DOMAIN_SEPARATOR() external view returns (bytes32);

  function EMISSION_MANAGER() external view returns (address);

  function EXCHANGE_RATE_UNIT() external view returns (uint256);

  function INITIAL_EXCHANGE_RATE() external view returns (uint216);

  function LOWER_BOUND() external view returns (uint256);

  function PRECISION() external view returns (uint8);

  function REWARDS_VAULT() external view returns (address);

  function REWARD_TOKEN() external view returns (address);

  function SLASH_ADMIN_ROLE() external view returns (uint256);

  function STAKED_TOKEN() external view returns (address);

  function UNSTAKE_WINDOW() external view returns (uint256);

  function allowance(address owner, address spender) external view returns (uint256);

  function approve(address spender, uint256 value) external returns (bool);

  function assets(
    address
  ) external view returns (uint128 emissionPerSecond, uint128 lastUpdateTimestamp, uint256 index);

  function balanceOf(address account) external view returns (uint256);

  function claimRewards(address to, uint256 amount) external;

  function claimRewardsAndRedeem(address to, uint256 claimAmount, uint256 redeemAmount) external;

  function claimRewardsAndRedeemOnBehalf(
    address from,
    address to,
    uint256 claimAmount,
    uint256 redeemAmount
  ) external;

  function claimRewardsOnBehalf(
    address from,
    address to,
    uint256 amount
  ) external returns (uint256);

  function claimRoleAdmin(uint256 role) external;

  function configureAssets(AssetConfigInput[] memory assetsConfigInput) external;

  function cooldown() external;

  function cooldownOnBehalfOf(address from) external;

  function decimals() external view returns (uint8);

  function distributionEnd() external view returns (uint256);

  function eip712Domain()
    external
    view
    returns (
      bytes1 fields,
      string memory name,
      string memory version,
      uint256 chainId,
      address verifyingContract,
      bytes32 salt,
      uint256[] memory extensions
    );

  function getAdmin(uint256 role) external view returns (address);

  function getCooldownSeconds() external view returns (uint256);

  function getExchangeRate() external view returns (uint216);

  function getMaxSlashablePercentage() external view returns (uint256);

  function getPendingAdmin(uint256 role) external view returns (address);

  function getTotalRewardsBalance(address staker) external view returns (uint256);

  function getUserAssetData(address user, address asset) external view returns (uint256);

  function inPostSlashingPeriod() external view returns (bool);

  function initialize(
    string memory name,
    string memory symbol,
    address slashingAdmin,
    address cooldownPauseAdmin,
    address claimHelper,
    uint256 maxSlashablePercentage,
    uint256 cooldownSeconds
  ) external;

  function name() external view returns (string memory);

  function nonces(address owner) external view returns (uint256);

  function permit(
    address owner,
    address spender,
    uint256 value,
    uint256 deadline,
    uint8 v,
    bytes32 r,
    bytes32 s
  ) external;

  function previewRedeem(uint256 shares) external view returns (uint256);

  function previewStake(uint256 assets) external view returns (uint256);

  function redeem(address to, uint256 amount) external;

  function redeemOnBehalf(address from, address to, uint256 amount) external;

  function returnFunds(uint256 amount) external;

  function setCooldownSeconds(uint256 cooldownSeconds) external;

  function setDistributionEnd(uint256 newDistributionEnd) external;

  function setMaxSlashablePercentage(uint256 percentage) external;

  function setPendingAdmin(uint256 role, address newPendingAdmin) external;

  function settleSlashing() external;

  function slash(address destination, uint256 amount) external returns (uint256);

  function stake(address to, uint256 amount) external;

  function stakeWithPermit(
    uint256 amount,
    uint256 deadline,
    uint8 v,
    bytes32 r,
    bytes32 s
  ) external;

  function stakerRewardsToClaim(address) external view returns (uint256);

  function stakersCooldowns(address) external view returns (uint40 timestamp, uint216 amount);

  function symbol() external view returns (string memory);

  function totalSupply() external view returns (uint256);

  function transfer(address to, uint256 value) external returns (bool);

  function transferFrom(address from, address to, uint256 value) external returns (bool);
}
