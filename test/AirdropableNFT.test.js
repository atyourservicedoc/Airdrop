const {expect} = require("chai");
const {ethers} = require("hardhat");


describe("Airdropablle", function () {
    it("owner should be contract creator", async function () {
        const [owner] = await ethers.getSigners();

        const nft = await ethers.getContractFactory("AirdropableNFT");

        const hardhatNFT = await nft.deploy();

        const contractOwner = await hardhatNFT.owner();
        expect(contractOwner).to.equal(owner.address);
    });

    it("toAddress should receive NFT", async function () {
        const [owner, toAddress] = await ethers.getSigners();

        const nft = await ethers.getContractFactory("AirdropableNFT");

        const hardhatNFT = await nft.deploy();

        await hardhatNFT.mintNFT(toAddress.address);

        expect(await hardhatNFT.balanceOf(toAddress.address)).to.equal(1);
    });
})