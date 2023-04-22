const { assert } = require('chai');
const Kryptobird = artifacts.require('./KryptoBirdz');

contract('KryptoBirdz', () => {
    let contract;
    describe('deployement', async () => {
        it('deploys successfuly', async () => {
            contract = await Kryptobird.deployed();
            const address = contract.address;
            assert.notEqual(address, '');
            assert.notEqual(address, null);
            assert.notEqual(address, undefined);
            assert.notEqual(address, 0x0);
        })
        it('has a name', async () => {
            const name = await contract.NameGetter();
            assert.equal(name, 'Kryptobird');
        })
        it('has a symbol', async () => {
            const symbol = await contract.SymbolGetter();
            assert.equal(symbol, 'KBIRDZ');
        })
    })
    describe('minting', async () => {
        it('creates a new token', async () => {
            const result = await contract.mint('pigeon');
            const totalSupply = await contract.totalSupply();
            assert.equal(totalSupply, 1);

            const event = result.logs[0].args;
            assert.equal(event.from, 0x000000000000000000000000000000000000000000, 'from = contract addr');
            assert.equal(event.to, accounts[0], 'to is = msg.sender');
        })
    })
})