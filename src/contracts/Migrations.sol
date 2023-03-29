// SPDX-License-Identifier: MIT
// Migrations are JavaScript files that help you deploy contracts to the Ethereum network. 
// These files are responsible for staging your deployment tasks, and they're written under 
// the assumption that your deployment needs will change over time. As your project evolves, 
// you'll create new migration scripts to further this evolution on the blockchain. A history 
// of previously run migrations is recorded on-chain through a special Migrations contract, 
// detailed below.

pragma solidity 0.8.0;

contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }


  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }

  
}
