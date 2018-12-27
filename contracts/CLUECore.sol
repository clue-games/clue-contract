pragma solidity ^0.4.23;

import './CLUEBase.sol';

contract CLUECore is CLUEBase {
  // Set in case the core contract is broken and an upgrade is required
  address public newContractAddress;

  address owner;

  constructor() public {
    owner = msg.sender;
  }

  function getOwner() public view returns(address) {
    return owner;
  }

}