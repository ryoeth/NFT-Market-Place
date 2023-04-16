// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Interfaces/IERC721Metadata.sol";

contract ERC721Metadata is IERC721Metadata {
    string private name;
    string private symbol;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function NameGetter() external view returns(string memory){
        return name;
    }

    function SymbolGetter() external view returns(string memory){
        return symbol;
    }
}
