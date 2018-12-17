pragma solidity ^0.4.23;

import "./CLUEBase.sol"

contract CLUECore is CLUEBase {
  // Set in case the core contract is broken and an upgrade is required
  address public newContractAddress;

  function CLUECore() public {

  }
}