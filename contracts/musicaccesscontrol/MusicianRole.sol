pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'MusicianRole' to manage this role - add, remove, check
contract MusicianRole {

  // Define 2 events, one for Adding, and other for Removing
  
  // Define a struct 'musicians' by inheriting from 'Roles' library, struct Role

  // In the constructor make the address that deploys this contract the 1st musician
  constructor() public {
    
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyMusician() {
    
    _;
  }

  // Define a function 'isMusician' to check this role
  function isMusician(address account) public view returns (bool) {
    
  }

  // Define a function 'addMusician' that adds this role
  function addMusician(address account) public onlyMusician {
    
  }

  // Define a function 'renounceMusician' to renounce this role
  function renounceMusician() public {
    
  }

  // Define an internal function '_addMusician' to add this role, called by 'addMusician'
  function _addMusician(address account) internal {
    
  }

  // Define an internal function '_removeMusician' to remove this role, called by 'removeMusician'
  function _removeMusician(address account) internal {
    
  }
}