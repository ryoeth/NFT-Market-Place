// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ERC721Connector.sol";

contract KryptoBirdz is ERC721Connector {
    string[] public KryptoBird;
    mapping(string => bool) public _KryptoBirdExists;

    function mint(string memory _KryptoBird) public {
        require(!_KryptoBirdExists[_KryptoBird], "KryptoBird already exsists");
        KryptoBird.push(_KryptoBird);
        uint _id = KryptoBird.length - 1;
        _mint(_id, msg.sender);
        _KryptoBirdExists[_KryptoBird] = true;
    }

    // a constructor that calls the ERC721Connector
    // constructor with the values "Kryptobird"
    // and "KBIRDZ" to set the name and symbol
    // variables for this contract.
    constructor() ERC721Connector("Kryptobird", "KBIRDZ") {}
}
