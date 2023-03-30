// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721Metadata {
    string private name;
    string private symbol;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function NameGetter() external view returns(string memory){
        return name;
    }

    function symbolGetter() external view returns(string memory){
        return symbol;
    }
}
