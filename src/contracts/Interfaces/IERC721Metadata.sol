// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC721Metadata {
    /// @notice A descriptive name for a collection of NFTs in this contract
    function NameGetter() external view returns (string memory _name);

    /// @notice An abbreviated name for NFTs in this contract
    function SymbolGetter() external view returns (string memory _symbol);
}