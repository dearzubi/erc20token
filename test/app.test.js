const FaltuCoin = artifacts.require("FaltuCoin");

contract ("FaltuCoin", (accounts) => {

    before(async() => {
        faltu = await FaltuCoin.deployed()
    })

    it("the balance of contract deployer should be 5M coins", async()=>{
        let balance = await faltu.balanceOf(accounts[0])
        balance = web3.utils.fromWei(balance, "ether")
        assert.equal(balance, "5000000")
    })

    it("balance transfer between accounts works", async()=>{
        let amount = web3.utils.toWei('10000', 'ether')
        await faltu.transfer(accounts[1], amount, {from: accounts[0]})

        let balance = await faltu.balanceOf(accounts[1])
        balance = web3.utils.fromWei(balance, 'ether')
        assert.equal(balance, '10000')
    })
})