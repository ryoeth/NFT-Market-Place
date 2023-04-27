const { assert } = require('chai');
const Kryptobird = artifacts.require('./KryptoBirdz');

contract('KryptoBirdz', async (accounts) => {
    let contract = await Kryptobird.deployed();;

    describe('deployement', async () => {
        it('deploys successfuly', async () => {
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
    });

    describe('minting', async () => {
        it('creates a new token', async () => {
            const result = await contract.mint('pigeon');
            const totalSupply = await contract.totalSupply();
            assert.equal(totalSupply, 1);

            const event = result.logs[0].args;
            assert.equal(event._from, 0x000000000000000000000000000000000000000000, 'from = contract addr');
            assert.equal(event._to, accounts[0], 'to is = msg.sender');

            // Failure
            await contract.mint('pigeon').should.be.rejected;
        })
    });

    describe('indexing', async () => {
        it('lists KryptoBirdz', async () => {
            await contract.mint('peacock');
            await contract.mint('crow');
            await contract.mint('myna');
            const totalSupply = await contract.totalSupply();
            let result = [];
            for (i = 1; i <= totalSupply; i++) {
                let kryptobird = await contract.Kryptobird(i - 1);
                result.push(kryptobird);
            }
            let expected = ['pigeon', 'peacock', 'crow', 'myna'];
            assert.equal(result.join(','), expected.join(','));
        });
    });

})