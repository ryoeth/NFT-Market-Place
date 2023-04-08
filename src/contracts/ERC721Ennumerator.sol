// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721Ennumerator is ERC721 {
    uint256[] private _allTokens;

    // tokenId to index in _allTokens array
    mapping(uint => uint) private _allTokensIndex;
    // owner to array of all tokens owned by him
    mapping(address => uint256[]) private _ownedTokens;
    // tokenId to index of owner token list (above)
    mapping(uint => uint) private _ownedTokensIndex;

    function totatSupply() internal view returns (uint) {
        return _allTokens.length;
    }

    // function tokenByIndex(uint _index) external view returns (uint);

    // function tokenOfOwnerByIndex(
    //     address owner,
    //     uint _index
    // ) external view returns (uint);

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

    function tokenByIndex(uint index) public view returns (uint) {
        require(index < totatSupply(), "Not enough tokens");
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex(
        address owner,
        uint index
    ) public view returns (uint) {
        return _ownedTokens[owner][index];
    }

    function _addTokensToAllTokensEnnumeration(uint tokenID) private {
        _allTokensIndex[tokenID] = _allTokens.length;
        _allTokens.push(tokenID);
    }
}
