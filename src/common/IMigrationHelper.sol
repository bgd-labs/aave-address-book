// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IPool as IV3Pool} from '../AaveV3.sol';
import {ILendingPool as IV2Pool} from '../AaveV2.sol';
import {ICreditDelegationToken} from 'aave-v3-core/contracts/interfaces/ICreditDelegationToken.sol';
import {IERC20WithPermit} from 'aave-v3-core/contracts/interfaces/IERC20WithPermit.sol';

interface IMigrationHelper {
  struct PermitInput {
    IERC20WithPermit aToken;
    uint256 value;
    uint256 deadline;
    uint8 v;
    bytes32 r;
    bytes32 s;
  }

  struct CreditDelegationInput {
    ICreditDelegationToken debtToken;
    uint256 value;
    uint256 deadline;
    uint8 v;
    bytes32 r;
    bytes32 s;
  }

  struct RepayInput {
    address asset;
    uint256 amount;
    uint256 rateMode;
  }

  struct RepaySimpleInput {
    address asset;
    uint256 rateMode;
  }

  struct EmergencyTransferInput {
    IERC20WithPermit asset;
    uint256 amount;
    address to;
  }

  /**
   * @notice Method to do migration of any types of positions. Migrating whole amount of specified assets
   * @param assetsToMigrate - list of assets to migrate
   * @param positionsToRepay - list of assets to be repayed
   * @param permits - list of EIP712 permits, can be empty, if approvals provided in advance
   * @param creditDelegationPermits - list of EIP712 signatures (credit delegations) for v3 variable debt token
   * @dev check more details about permit at PermitInput and /solidity-utils/contracts/oz-common/interfaces/draft-IERC20Permit.sol
   **/
  function migrate(
    address[] memory assetsToMigrate,
    RepaySimpleInput[] memory positionsToRepay,
    PermitInput[] memory permits,
    CreditDelegationInput[] memory creditDelegationPermits
  ) external;

  /**
   * @notice Executes an operation after receiving the flash-borrowed assets
   * @dev Ensure that the contract can return the debt + premium, e.g., has
   *      enough funds to repay and has approved the Pool to pull the total amount
   * @param assets The addresses of the flash-borrowed assets
   * @param amounts The amounts of the flash-borrowed assets
   * @param premiums The fee of each flash-borrowed asset
   * @param initiator The address of the flashloan initiator
   * @param params The byte-encoded params passed when initiating the flashloan
   * @return True if the execution of the operation succeeds, false otherwise
   */
  function executeOperation(
    address[] calldata assets,
    uint256[] calldata amounts,
    uint256[] calldata premiums,
    address initiator,
    bytes calldata params
  ) external returns (bool);

  /**
   * @notice Public method to optimize the gas costs, to avoid having getReserveData calls on every execution
   **/
  function cacheATokens() external;

  /**
   * @notice Method to get asset and amount to be supplied to V3
   * @param asset the v2 pool asset
   * @param amount origin amount
   * @return address asset to be supplied to the v3 pool
   * @return uint256 amount to be supplied to the v3 pool
   */
  function getMigrationSupply(
    address asset,
    uint256 amount
  ) external view returns (address, uint256);

  /// @notice The source pool
  function V2_POOL() external returns (IV2Pool);

  /// @notice The destination pool
  function V3_POOL() external returns (IV3Pool);

  /**
   * @notice Public method for rescue funds in case of a wrong transfer
   * @param emergencyInput - array of parameters to transfer out funds
   **/
  function rescueFunds(EmergencyTransferInput[] calldata emergencyInput) external;

  function aTokens(address underlying) external returns (address);

  function vTokens(address underlying) external returns (address);

  function sTokens(address underlying) external returns (address);
}
