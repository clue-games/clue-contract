/**
 * Created on 2018-12-16 23:14
 */
pragma solidity ^0.4.23;

/**
 *
 */
contract CLUEBase {
  /**
   * Events
   */

  // Creation event. emitted when CLUE is first created
  event Creation(address indexed creator, uint256 clueId, address indexed bounty, string message);

  // Claim event. emitted when CLUE is claimed
  event Claim(address indexed bounty, string message, bool claimed, address indexed claimer);

  /**
   * main CLUE struct
   */
  struct CLUE {
    // Creator of the CLUE
    address creator;

    // location of the bounty
    address bounty;

    // Cryptic message
    string message;

    // Claimed
    bool claimed;

    // claimer's address
    address claimer;
  }

  // storage for the CLUEs. CLUEIds are represented by the indices
  CLUE[] clues;
  
  /**
   * This is an internal method for generating new CLUEs. This doesn't have any validation, should be used with caution
   */
  function _createCLUE(address _bounty, string _message, address _creator) internal returns (uint) {
    // create new CLUE, and store in memory
    CLUE memory _clue = CLUE({
        creator: _creator,
        bounty: _bounty,
        message: _message,
        claimed: false,
        claimer: address(0)
    });

    // store CLUE to memory
    uint256 clueId = clues.push(_clue) - 1;

    // emit creation event
    emit Creation(_creator, clueId, _bounty, _message);

    // return CLUEId
    return clueId;
  }

  /**
   * This is an internal method for claiming the CLUE
   */
  function _claimCLUE(uint256 _clueId, address _claimer) internal returns (bool) {
    CLUE storage clue = clues[_clueId];

    // you can only claim a CLUE if your address matches the bounty address
    require(address(clue.bounty) == address(msg.sender));

    // ensure the CLUE hasn't been claimed yet
    require(bool(clue.claimed) == bool(false));

    // set CLUE as claimed
    clue.claimed = true;

    // set claimer by address
    clue.claimer = _claimer;

    // emit claim event
    emit Claim(address(clue.bounty), string(clue.message), bool(clue.claimed), address(clue.claimer));
  }
}