// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721 {
    mapping(uint => address) private _tokenOwner;
    mapping(address => uint) private _OwnedTokenCounts;
    event Transfer(
        address indexed from,
        address indexed to,
        uint indexed tokenId
    );

    function _mint(uint tokenId, address to) internal virtual {
        require(to != address(0), "Address is 0");
        require(!_exists(tokenId), "Token already minted");

        _tokenOwner[tokenId] = to;
        _OwnedTokenCounts[to]++;

        emit Transfer(address(0), to, tokenId);
    }

    function balanceOf(address _owner) public view returns (uint) {
        require(_owner != address(0), "Owner value is null");
        return _OwnedTokenCounts[_owner];
    }

    function ownerOf(address _tokenId) public view returns (address) {
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), "Owner value is null");
        return owner;
    }

    function _exists(uint tokenId) internal view returns (bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }
}
