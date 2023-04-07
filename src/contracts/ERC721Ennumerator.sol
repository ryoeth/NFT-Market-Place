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

    function totatSupply() external view returns (uint) {
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
    }

    function _addTokensToAllTokensEnnumeration(uint tokenID) private {
        _allTokensIndex=_allTokens.length;
        _allTokens.push(tokenID);

    }
}
