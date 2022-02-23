// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

contract AirdropableNFT is ERC721 {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address public owner; 

    constructor() ERC721 ("Airdropper","ADPR") {
        owner = msg.sender;
        _tokenIds.increment();
    }

    function mintNFT(address _to) external onlyOwner {
        uint256 newItemId = _tokenIds.current();
        require(newItemId < 100, 'SOLD OUT');
        _safeMint(_to, newItemId);
        _tokenIds.increment();
        console.log("minted %s to address %s", newItemId, _to);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}