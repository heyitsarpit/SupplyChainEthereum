var Ship = artifacts.require("./Shipper_Exporter.sol");

module.exports = function (deployer) {
    deployer.deploy(Ship);
}
