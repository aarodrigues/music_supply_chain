pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ProviderRole' to manage this role - add, remove, check
contract ProviderRole {

  // Define 2 events, one for Adding, and other for Removing

  // Define a struct 'distributors' by inheriting from 'Roles' library, struct Role

  // In the constructor make the address that deploys this contract the 1st distributor
  constructor() public {

  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyProvider() {

    _;
  }

  // Define a function 'isProvider' to check this role
  function isProvider(address account) public view returns (bool) {

  }

  // Define a function 'addProvider' that adds this role
  function addProvider(address account) public onlyProvider {

  }

  // Define a function 'renounceProvider' to renounce this role
  function renounceProvider() public {

  }

  // Define an internal function '_addProvider' to add this role, called by 'addProvider'
  function _addProvider(address account) internal {

  }

  // Define an internal function '_removeProvider' to remove this role, called by 'removeProvider'
  function _removeProvider(address account) internal {

  }
}