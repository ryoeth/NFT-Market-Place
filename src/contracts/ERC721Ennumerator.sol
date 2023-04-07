// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721Ennumerator is ERC721 {
    uint256[] private _allTokens;
    mapping[uint=>uint] private _allTokensIndex;
    mapping[address=>uint256[]] private _ownedTokens;
    mapping[uint=>uint] private _ownedTokensIndex;

    function totatSupply() external view returns(uint){
        return _allTokens.length;
    }

    function tokenByIndex(uint _index) external view returns(uint);

    function _mint(uint256 tokenID, address to) override(ERC721){
        super._mint(tokenID, to);
    }

}