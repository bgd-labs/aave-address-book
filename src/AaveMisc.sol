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

library AaveMisc {
  address internal constant ECOSYSTEM_RESERVE = 0x25F2226B597E8F9514B3F68F00f494cF4f286491;

  IAaveEcosystemReserveController internal constant AAVE_ECOSYSTEM_RESERVE_CONTROLLER =
    IAaveEcosystemReserveController(0x3d569673dAa0575c936c7c67c4E6AedA69CC630C);

  address constant TRANSPARENT_PROXY_FACTORY_ETHEREUM = 0xB4e496f70602fE2AC6Ae511D028BA4D194773B29;
  // owned by short executor
  address constant PROXY_ADMIN_ETHEREUM = 0xD3cF979e676265e4f6379749DECe4708B9A22476;
  // owned by long executor
  address constant PROXY_ADMIN_ETHEREUM_LONG = 0x86C3FfeE349A7cFf7cA88C449717B1b133bfb517;

  address constant TRANSPARENT_PROXY_FACTORY_POLYGON = 0xB4e496f70602fE2AC6Ae511D028BA4D194773B29;
  address constant PROXY_ADMIN_POLYGON = 0xD3cF979e676265e4f6379749DECe4708B9A22476;

  address constant TRANSPARENT_PROXY_FACTORY_AVALANCHE = 0xB4e496f70602fE2AC6Ae511D028BA4D194773B29;
  address constant PROXY_ADMIN_AVALANCHE = 0xD3cF979e676265e4f6379749DECe4708B9A22476;

  address constant TRANSPARENT_PROXY_FACTORY_OPTIMISM = 0xB4e496f70602fE2AC6Ae511D028BA4D194773B29;
  address constant PROXY_ADMIN_OPTIMISM = 0xD3cF979e676265e4f6379749DECe4708B9A22476;

  address constant TRANSPARENT_PROXY_FACTORY_ARBITRUM = 0xB4e496f70602fE2AC6Ae511D028BA4D194773B29;
  address constant PROXY_ADMIN_ARBITRUM = 0xD3cF979e676265e4f6379749DECe4708B9A22476;

  address constant TRANSPARENT_PROXY_FACTORY_FANTOM = 0xB4e496f70602fE2AC6Ae511D028BA4D194773B29;
  address constant PROXY_ADMIN_FANTOM = 0xD3cF979e676265e4f6379749DECe4708B9A22476;
}
