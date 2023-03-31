// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721 {
    mapping(uint => address) private _tokenNumber;
    mapping(address => uint) private _OwnedTokenCounts;
    event Transfer(
        address indexed from,
        address indexed to,
        uint indexed tokenId
    );

    function _mint(uint tokenId, address to) internal {
        require(to != address(0), "Address is 0");
        require(_tokenNumber[tokenId] == address(0),"Token already minted");

        _tokenNumber[tokenId] = to;
        _OwnedTokenCounts[to]++;

        emit Transfer(address(0), to, tokenId);
    }
}
