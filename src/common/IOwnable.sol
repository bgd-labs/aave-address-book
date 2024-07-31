// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

interface IOwnable {
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  /**
   * @dev Returns the address of the current owner.
   */
  function owner() external view virtual returns (address);

  /**
   * @dev Leaves the contract without owner. It will not be possible to call
   * `onlyOwner` functions anymore. Can only be called by the current owner.
   *
   * NOTE: Renouncing ownership will leave the contract without an owner,
   * thereby removing any functionality that is only available to the owner.
   */
  function renounceOwnership() external virtual;

  /**
   * @dev Transfers ownership of the contract to a new account (`newOwner`).
   * Can only be called by the current owner.
   */
  function transferOwnership(address newOwner) external virtual;
}
