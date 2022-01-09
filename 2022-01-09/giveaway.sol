// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

/**
 * USES HARDCODED VALUES - MEANT ONLY TO BE RUN ON TESTNET IN IT'S CURRENT STATE
 */

contract Giveaway is VRFConsumerBase {
  bytes32 internal keyHash;
  uint256 internal fee;

  string public giveAwayName;
  uint256[] public randomResult = new uint256[](1000);
  uint256 public round = 0;

  /**
   * Constructor inherits VRFConsumerBase
   *
   * Network: Mumbai
   * Chainlink VRF Coordinator address: 0x8C7382F9D8f56b33781fE506E897a4F1e2d17255
   * LINK token address:                0x326C977E6efc84E512bB9C30f76E30c160eD06FB
   * Key Hash: 0x6e75b569a01ef56d18cab6a8e71e6600d6ce853834d4a5748b720d06f878b3a4
   */
  constructor(string memory _giveAwayName)
    VRFConsumerBase(
      0x8C7382F9D8f56b33781fE506E897a4F1e2d17255,
      0x326C977E6efc84E512bB9C30f76E30c160eD06FB
    )
  {
    keyHash = 0x6e75b569a01ef56d18cab6a8e71e6600d6ce853834d4a5748b720d06f878b3a4;
    fee = 0.0001 * 10**18; // 0.0001 LINK (Varies by network - Mumbai)
    giveAwayName = _giveAwayName;
  }

  /**
   * Requests randomness
   */
  function getRandomNumber() public returns (bytes32 requestId) {
    require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
    return requestRandomness(keyHash, fee);
  }

  /**
   * Callback function used by VRF Coordinator. Increments the round and sets the randomness result.
   */
  function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
    randomResult[round] = randomness;
    round += 1;
  }

  function getWinnerByIndex(uint256 _round, uint256 entries) external view returns (uint256) {
    return randomResult[_round] % entries;
  }

  // function withdrawLink() external {} - TODO: Implement a withdraw function to avoid locking your LINK in the contract if going to mainnet
}
