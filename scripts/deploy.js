const hre = require("hardhat");

const SUPERFLUID_HOST = "0xeD5B5b32110c3Ded02a07c8b8e97513FAfb883B6";

const main = async () => {
    const AqueductToken = await hre.ethers.getContractFactory("AqueductToken");
    const aqueductToken = await AqueductToken.deploy(SUPERFLUID_HOST);
    await aqueductToken.deployed();

    console.log("AqueductToken deployed to:", aqueductToken.address);

    const message = await aqueductToken.readMessage();
    console.log("Message: ", message);
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log("An error has occurred: ", error);
        process.exit(1);
    }
};

runMain();
