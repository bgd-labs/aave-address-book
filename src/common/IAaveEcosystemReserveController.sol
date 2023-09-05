// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

interface IAaveEcosystemReserveController {
  /**
   * @notice Proxy function for ERC20's approve(), pointing to a specific collector contract
   * @param collector The collector contract with funds (Aave ecosystem reserve)
   * @param token The asset address
   * @param recipient Allowance's recipient
   * @param amount Allowance to approve
   **/
  function approve(
    address collector,
    // IERC20 token,
    address token,
    address recipient,
    uint256 amount
  ) external;

  /**
   * @notice Proxy function for ERC20's transfer(), pointing to a specific collector contract
   * @param collector The collector contract with funds (Aave ecosystem reserve)
   * @param token The asset address
   * @param recipient Transfer's recipient
   * @param amount Amount to transfer
   **/
  function transfer(
    address collector,
    // IERC20 token,
    address token,
    address recipient,
    uint256 amount
  ) external;

  /**
   * @notice Proxy function to create a stream of token on a specific collector contract
   * @param collector The collector contract with funds (Aave ecosystem reserve)
   * @param recipient The recipient of the stream of token
   * @param deposit Total amount to be streamed
   * @param tokenAddress The ERC20 token to use as streaming asset
   * @param startTime The unix timestamp for when the stream starts
   * @param stopTime The unix timestamp for when the stream stops
   * @return uint256 The stream id created
   **/
  function createStream(
    address collector,
    address recipient,
    uint256 deposit,
    // IERC20 tokenAddress,
    address tokenAddress,
    uint256 startTime,
    uint256 stopTime
  ) external returns (uint256);

  /**
   * @notice Proxy function to withdraw from a stream of token on a specific collector contract
   * @param collector The collector contract with funds (Aave ecosystem reserve)
   * @param streamId The id of the stream to withdraw tokens from
   * @param funds Amount to withdraw
   * @return bool If the withdrawal finished properly
   **/
  function withdrawFromStream(
    address collector,
    uint256 streamId,
    uint256 funds
  ) external returns (bool);

  /**
   * @notice Proxy function to cancel a stream of token on a specific collector contract
   * @param collector The collector contract with funds (Aave ecosystem reserve)
   * @param streamId The id of the stream to cancel
   * @return bool If the cancellation happened correctly
   **/
  function cancelStream(address collector, uint256 streamId) external returns (bool);
}
