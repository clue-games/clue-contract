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

  function createCLUE(address _bounty, string _message, address _creator) public view returns(uint) {
    return _createCLUE(_bounty, _message, _creator);
  }

  function claimCLUE(uint256 _clueId, address _claimer) public view returns(bool) {
    return _claimCLUE(_clueId, _claimer);
  }

}