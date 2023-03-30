// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721 {
    mapping(uint => address) private _tokenNumber;
    mapping(address => uint) private _OwnedTokenCounts;
}