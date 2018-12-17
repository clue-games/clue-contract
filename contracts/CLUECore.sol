pragma solidity ^0.4.23;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import './CLUEBase.sol';

contract CLUECore is CLUEBase, Ownable {
  // Set in case the core contract is broken and an upgrade is required
  address public newContractAddress;

  function CLUECore() public {

  }
}