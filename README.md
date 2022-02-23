# Airdropable NFT
This project is an example of an NFT that can be airdropped.

It uses the ERC721 standard.

It uses the Counters utility to track the tokenIds. This is done here in lieue of the ERC721Enumerable standard to demonstrate an awareness of the fundamentals of tokenIds.

It has an arbitrary hard limit of 100 tokens that can be minted, and are minted with the ERC721 safe mint.

It has a custom onlyOnwer modifier, requiring that the caller of the modified function be the contract owner. This is done in lieue of the Ownable interface to demonstrate an awareness of the fundamentals of modifiers.