// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IDataWarehouse} from './IDataWarehouse.sol';

interface IVotingStrategy {
  /**
   * @notice method to get the DataWarehouse contract
   * @return DataWarehouse contract
   */
  function DATA_WAREHOUSE() external view returns (IDataWarehouse);

  /**
   * @notice method to get the exchange rate precision. Taken from stkTokenV3 contract
   * @return exchange rate precission
   */
  function STK_AAVE_SLASHING_EXCHANGE_RATE_PRECISION() external view returns (uint256);

  /**
   * @notice method to get the slot of the stkAave exchange rate in the stkAave contract
   * @return stkAave exchange rate slot
   */
  function STK_AAVE_SLASHING_EXCHANGE_RATE_SLOT() external view returns (uint256);

  /**
   * @notice method to get the power scale factor of the delegated balances
   * @return power scale factor
   */
  function POWER_SCALE_FACTOR() external view returns (uint256);

  /**
   * @notice method to get the power of an asset
   * @param asset address of the token to get the power
   * @param storageSlot storage position of the balance mapping
   * @param power balance of a determined asset to be used for the vote
   * @param blockHash block hash of when we want to get the power. Optional parameter
   * @return voting power of the specified asset
   */
  function getVotingPower(
    address asset,
    uint128 storageSlot,
    uint256 power,
    bytes32 blockHash
  ) external view returns (uint256);

  /**
   * @notice method to check that the roots for all the tokens in the voting strategy have been registered. Including
             the registry of the stkAave exchange rate slot
   * @param blockHash hash of the block from where the roots have been registered.
   */
  function hasRequiredRoots(bytes32 blockHash) external view;
}
