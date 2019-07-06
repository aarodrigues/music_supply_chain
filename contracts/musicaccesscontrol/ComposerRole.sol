pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ComposerRole' to manage this role - add, remove, check
contract ComposerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event ComposerAdded(address indexed account);
  event ComposerRemoved(address indexed account);

  // Define a struct 'composers' by inheriting from 'Roles' library, struct Role
  Roles.Role private composers;

  // In the constructor make the address that deploys this contract the 1st composer
  constructor() public {
    _addComposer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyComposer() {
    require(isComposer(msg.sender));
    _;
  }

  // Define a function 'isComposer' to check this role
  function isComposer(address account) public view returns (bool) {
    return composers.has(account);
  }

  // Define a function 'addComposer' that adds this role
  function addComposer(address account) public onlyComposer {
    _addComposer(account);
  }

  // Define a function 'renounceComposer' to renounce this role
  function renounceComposer() public {
    _removeComposer(msg.sender);
  }

  // Define an internal function '_addComposer' to add this role, called by 'addComposer'
  function _addComposer(address account) internal {
    composers.add(account);
    emit ComposerAdded(account);
  }

  // Define an internal function '_removeComposer' to remove this role, called by 'removeComposer'
  function _removeComposer(address account) internal {
    composers.remove(account);
    emit ComposerRemoved(account);
  }
}