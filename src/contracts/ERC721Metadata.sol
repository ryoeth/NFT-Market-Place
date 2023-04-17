// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Interfaces/IERC721Metadata.sol";
import "./ERC165.sol";

contract ERC721Metadata is IERC721Metadata, ERC165 {
    string private name;
    string private symbol;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        _registerInterface(
            calcFingerPrint("NameGetter(bytes4)") ^ calcFingerPrint("SymbolGetter(bytes4)")
        );
    }

    function NameGetter() external view returns (string memory) {
        return name;
    }

    function SymbolGetter() external view returns (string memory) {
        return symbol;
    }
}
