var Driver = artifacts.require('./Driver.sol');
var expo = artifacts.require('./Shipper_Exporter.sol');
var impo = artifacts.require('./Shipper_Importer.sol');

module.exports = function(deployer) {
    deployer.deploy(Driver);
    deployer.deploy(expo);
    deployer.deploy(impo);
};
