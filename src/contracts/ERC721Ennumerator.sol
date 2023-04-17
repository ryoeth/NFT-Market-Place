// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";
import "./Interfaces/IERC721Enumerable.sol";

contract ERC721Ennumerator is ERC721, IERC721Enumerable {
    uint256[] private _allTokens;

    constructor() {
        _registerInterface(
            calcFingerPrint("totalSupply(bytes4)") ^
                calcFingerPrint("tokenByIndex(bytes4)") ^
                calcFingerPrint("tokenOfOwnerByIndex(bytes4)")
        );
    }

    // tokenId to index in _allTokens array
    mapping(uint => uint) private _allTokensIndex;
    // owner to array of all tokens owned by him
    mapping(address => uint256[]) private _ownedTokens;
    // tokenId to index of owner token list (above)
    mapping(uint => uint) private _ownedTokensIndex;

    function totalSupply() public view returns (uint) {
        return _allTokens.length;
    }

    function tokenByIndex(uint index) public view returns (uint) {
        require(index < totalSupply(), "Not enough tokens");
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex(
        address owner,
        uint index
    ) public view returns (uint) {
        require(index < balanceOf(owner), "Owner Index out of bonds ");
        return _ownedTokens[owner][index];
    }

    function _mint(uint256 tokenID, address to) internal override(ERC721) {
        super._mint(tokenID, to);
        _addTokensToAllTokensEnnumeration(tokenID);
        _addTokensToOwnerTokensEnnumeration(tokenID, to);
    }

    function _addTokensToOwnerTokensEnnumeration(
        uint tokenID,
        address to
    ) private {
        _ownedTokens[to].push(tokenID);
        _ownedTokensIndex[tokenID] = _ownedTokens[to].length;
    }

    function _addTokensToAllTokensEnnumeration(uint tokenID) private {
        _allTokensIndex[tokenID] = _allTokens.length;
        _allTokens.push(tokenID);
    }
}
