// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Metadata.sol";
import "./ERC721Ennumerator.sol";

contract ERC721Connector is ERC721Metadata, ERC721Ennumerator {
    // constructor that takes in the same two string parameters as the 
    // ERC721Metadata constructor and passes them to the ERC721Metadata 
    // constructor using the ERC721Metadata(_name, _symbol) syntax.
    constructor(string memory _name, string memory _symbol) ERC721Metadata(_name, _symbol){

    }
}
