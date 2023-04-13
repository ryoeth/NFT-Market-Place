// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

contract ERC165 is IERC165 {
    mapping(bytes4 => bool) private supportedInterfaces;

    constructor() {
        _registerInterface(0x01ffc9a7);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) external view override returns (bool) {
        return supportedInterfaces[interfaceId];
    }

    function calcFingerPrint() public pure returns (bytes4) {
        return bytes4(keccak256("supportedInterfaces(bytes4)"));
    }

    function _registerInterface(bytes4 interfaceId) public {
        require(interfaceId != 0xffffffff, "ERC165: INVALID INTERFACE");
        supportedInterfaces[interfaceId] = true;
    }
}
