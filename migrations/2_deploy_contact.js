const FaltuCoin = artifacts.require("FaltuCoin");

module.exports =  (deployer, networks, accounts) => {
  deployer.deploy(FaltuCoin, 5000000, {from: accounts[0]});
};
