pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ProducerRole' to manage this role - add, remove, check
contract ProducerRole {

  // Define 2 events, one for Adding, and other for Removing
  
  // Define a struct 'producers' by inheriting from 'Roles' library, struct Role

  // In the constructor make the address that deploys this contract the 1st producer
  constructor() public {
    
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyProducer() {
    
    _;
  }

  // Define a function 'isProducer' to check this role
  function isProducer(address account) public view returns (bool) {
    
  }

  // Define a function 'addProducer' that adds this role
  function addProducer(address account) public onlyProducer {
    
  }

  // Define a function 'renounceProducer' to renounce this role
  function renounceProducer() public {
    
  }

  // Define an internal function '_addProducer' to add this role, called by 'addProducer'
  function _addProducer(address account) internal {
    
  }

  // Define an internal function '_removeProducer' to remove this role, called by 'removeProducer'
  function _removeProducer(address account) internal {
    
  }
}