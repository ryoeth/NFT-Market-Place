const KryptoBird = artifacts.require("../src/contracts/KryptoBirdz.sol");
module.exports = function (deployer) {
    deployer.deploy(KryptoBird);
}