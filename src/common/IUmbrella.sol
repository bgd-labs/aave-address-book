// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IUmbrella {
  error CannotSlash();
  error ConfigurationHasNotBeenSet();
  error ConfigurationNotExist();
  error InvalidLiquidationFee();
  error InvalidNumberOfDecimals();
  error InvalidOraclePrice();
  error InvalidReserve();
  error InvalidStakeToken();
  error NotImplemented();
  error ReserveCoverageNotSetup();
  error ReserveIsConfigured();
  error TooMuchDeficitOffsetReduction();
  error UmbrellaStakeAlreadySetForAnotherReserve();
  error ZeroAddress();
  error ZeroDeficitToCover();

  event DeficitOffsetChanged(address indexed reserve, uint256 newDeficitOffset);
  event DeficitOffsetCovered(address indexed reserve, uint256 amount);
  event PendingDeficitChanged(address indexed reserve, uint256 newPendingDeficit);
  event PendingDeficitCovered(address indexed reserve, uint256 amount);
  event ReserveDeficitCovered(address indexed reserve, uint256 amount);
  event SlashingConfigurationChanged(
    address indexed reserve,
    address indexed umbrellaStake,
    uint256 liquidationFee,
    address umbrellaStakeUnderlyingOracle
  );
  event SlashingConfigurationRemoved(address indexed reserve, address indexed umbrellaStake);
  event StakeTokenSlashed(
    address indexed reserve,
    address indexed umbrellaStake,
    uint256 amount,
    uint256 fee
  );
  event UmbrellaStakeTokenCreated(
    address indexed umbrellaStake,
    address indexed underlying,
    string name,
    string symbol
  );

  function POOL() external view returns (address);

  function POOL_ADDRESSES_PROVIDER() external view returns (address);

  function SLASHED_FUNDS_RECIPIENT() external view returns (address);

  function SUPER_ADMIN() external view returns (address);

  function TRANSPARENT_PROXY_FACTORY() external view returns (address);

  function UMBRELLA_STAKE_TOKEN_IMPL() external view returns (address);

  function coverDeficitOffset(address reserve, uint256 amount) external returns (uint256);

  function coverPendingDeficit(address reserve, uint256 amount) external returns (uint256);

  function coverReserveDeficit(address reserve, uint256 amount) external returns (uint256);

  function createStakeTokens(
    IUmbrellaStkManager.StakeTokenSetup[] memory stakeTokenSetups
  ) external returns (address[] memory stakeTokens);

  function emergencyEtherTransferStk(address stk, address to, uint256 amount) external;

  function emergencyTokenTransferStk(
    address stk,
    address erc20Token,
    address to,
    uint256 amount
  ) external;

  function getDeficitOffset(address reserve) external view returns (uint256);

  function getPendingDeficit(address reserve) external view returns (uint256);

  function getReserveSlashingConfig(
    address reserve,
    address umbrellaStake
  ) external view returns (IUmbrellaConfiguration.SlashingConfig memory);

  function getReserveSlashingConfigs(
    address reserve
  ) external view returns (IUmbrellaConfiguration.SlashingConfig[] memory);

  function getStakeTokenData(
    address umbrellaStake
  ) external view returns (IUmbrellaConfiguration.StakeTokenData memory stakeTokenData);

  function getStkTokens() external view returns (address[] memory);

  function isReserveSlashable(address reserve) external view returns (bool flag, uint256 amount);

  function isUmbrellaStkToken(address stakeToken) external view returns (bool);

  function latestUnderlyingAnswer(
    address umbrellaStake
  ) external view returns (int256 latestAnswer);

  function pauseStk(address stk) external;

  function predictStakeTokensAddresses(
    IUmbrellaStkManager.StakeTokenSetup[] memory stakeSetups
  ) external view returns (address[] memory);

  function removeSlashingConfigs(
    IUmbrellaConfiguration.SlashingConfigRemoval[] memory removalPairs
  ) external;

  function setCooldownStk(IUmbrellaStkManager.CooldownConfig[] memory cooldownConfigs) external;

  function setDeficitOffset(address reserve, uint256 newDeficitOffset) external;

  function setUnstakeWindowStk(
    IUmbrellaStkManager.UnstakeWindowConfig[] memory unstakeWindowConfigs
  ) external;

  function slash(address reserve) external returns (uint256);

  function tokenForDeficitCoverage(address reserve) external view returns (address);

  function unpauseStk(address stk) external;

  function updateSlashingConfigs(
    IUmbrellaConfiguration.SlashingConfigUpdate[] memory slashingConfigs
  ) external;
}

interface IUmbrellaConfiguration {
  struct SlashingConfig {
    address umbrellaStake;
    address umbrellaStakeUnderlyingOracle;
    uint256 liquidationFee;
  }

  struct SlashingConfigRemoval {
    address reserve;
    address umbrellaStake;
  }

  struct SlashingConfigUpdate {
    address reserve;
    address umbrellaStake;
    uint256 liquidationFee;
    address umbrellaStakeUnderlyingOracle;
  }

  struct StakeTokenData {
    address underlyingOracle;
    address reserve;
  }
}

interface IUmbrellaStkManager {
  struct CooldownConfig {
    address umbrellaStake;
    uint256 newCooldown;
  }

  struct StakeTokenSetup {
    address underlying;
    uint256 cooldown;
    uint256 unstakeWindow;
    string suffix;
  }

  struct UnstakeWindowConfig {
    address umbrellaStake;
    uint256 newUnstakeWindow;
  }
}
