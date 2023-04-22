const {assert} = require('chai');
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
})