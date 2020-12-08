var EmployeeDetails = artifacts.require("EmployeeDetails");
var Lease = artifacts.require("Lease");

module.exports = function(deployer) {
  deployer.deploy(EmployeeDetails);
  deployer.deploy(Lease);
};

