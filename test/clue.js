var wait = require('./helpers/wait')
var chalk = require('chalk')
var CLUECore = artifacts.require('./CLUECore.sol')

contract('CLUECore', function (accounts) {
  it('should verify that there are at least three available accounts', async function () {
    assert.isTrue(accounts.length >= 3)
  })

  it('should verify that the contract has been deployed by accounts[0]', async function () {
    const instance = await CLUECore.deployed()
    assert.equal(await instance.getOwner(), tronWeb.address.toHex(accounts[0]))
  })
})
