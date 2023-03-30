// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ERC721Connector.sol";

contract KryptoBirdz is ERC721Connector {
    // a constructor that calls the ERC721Connector constructor with the values "Kryptobird"
    // and "KBIRDZ" to set the name and symbol variables for this contract.
    constructor() ERC721Connector("Kryptobird", "KBIRDZ"){

    }
}