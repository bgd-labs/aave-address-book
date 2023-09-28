// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGovernancePowerStrategy {
  /**
 * @notice method to get the full voting power of an user. This method is only use for consulting purposes.
             As its not used for voting calculations, it is not needed to force blockNumber - 1 to protect against
             FlashLoan attacks.
   * @param user address where we want to get the power from
   * @return full voting power of a user
   */
  function getFullVotingPower(address user) external view returns (uint256);

  /**
   * @notice method to get the full proposal power of an user. It is not needed to protect against FlashLoan
             attacks because once user returns the tokens (power) the proposal will get canceled as proposal creator
             will loose the proposition power.
   * @param user address where we want to get the power from
   * @return full proposition power of a user
   */
  function getFullPropositionPower(address user) external view returns (uint256);
}
